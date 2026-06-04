
from __future__ import annotations

import json
import logging
import re

import requests

from src.config import settings
from src.prompts.fact_check_prompt import (
    build_claim_extraction_prompt,
    build_fact_check_prompt,
)
from src.schemas.fact_check_schema import (
    ClaimResult,
    EvidenceItem,
    FactCheckResponse,
)
from src.services.embedding_service import EmbeddingService
from src.services.qdrant_service import QdrantService

logger = logging.getLogger(__name__)

VALID_LABELS = {"SUPPORTED", "REFUTED", "NOT_ENOUGH_EVIDENCE"}

# PENALTY_MAP: dict[str, float] = {
#     "SUPPORTED": 0.0,
#     "NOT_ENOUGH_EVIDENCE": 0.25,
#     "REFUTED": 1.0,
# }


class FactCheckService:
    """Orchestrates the full RAG fact-checking pipeline for a single post."""

    def __init__(
        self,
        embedding_service: EmbeddingService,
        qdrant_service: QdrantService,
    ) -> None:
        self._emb = embedding_service
        self._qdrant = qdrant_service


    def _call_ollama(self, prompt: str) -> dict:

        url = f"{settings.OLLAMA_URL.rstrip('/')}/api/generate"
        payload = {
            "model": settings.OLLAMA_MODEL,
            "prompt": prompt,
            "stream": False,
            "format": "json",
        }

        logger.debug("Calling Ollama model=%s", settings.OLLAMA_MODEL)
        response = requests.post(
            url,
            json=payload,
            timeout=settings.REQUEST_TIMEOUT,
        )
        response.raise_for_status()

        raw_body = response.json()
        # Ollama wraps the model output in the "response" key
        model_output: str = raw_body.get("response", "")

        # --- Primary parse attempt ---
        try:
            return json.loads(model_output)
        except json.JSONDecodeError:
            pass

        # --- Recovery: extract first {...} block via regex ---
        match = re.search(r"\{.*\}", model_output, re.DOTALL)
        if match:
            try:
                return json.loads(match.group())
            except json.JSONDecodeError:
                pass

        raise ValueError(
            f"Ollama returned a response that could not be parsed as JSON: "
            f"{model_output[:300]!r}"
        )

# gọi ollama để trích xuất claim từ nội dung bài post. Nếu có lỗi, trả về list rỗng.
    def extract_claims(self, content: str) -> list[str]:

        prompt = build_claim_extraction_prompt(content)

        try:
            result = self._call_ollama(prompt)
        except Exception as exc:
            logger.warning("Claim extraction failed: %s", exc)
            return []

        raw_claims: list = result.get("claims", [])
        if not isinstance(raw_claims, list):   # nếu không phải list thì return []
            logger.warning("'claims' field is not a list: %r", raw_claims)
            return []

        seen: set[str] = set()
        claims: list[str] = []
        for item in raw_claims:
            if not isinstance(item, str):     # nếu không phải str thì bỏ qua
                continue
            item = item.strip()
            if not item:                      # str rỗng thì bỏ qua 
                continue
            if item in seen:                  # nếu trùng lặp thì bỏ qua
                continue
            seen.add(item)
            claims.append(item)
            if len(claims) >= settings.MAX_CLAIMS_PER_POST:
                break

        logger.info("Extracted %d claim(s) from post.", len(claims))
        return claims

# truy vấn Qdrant để lấy bằng chứng cho claim. Áp dụng threshold nếu cần. Trả về list EvidenceItem.
    def retrieve_evidence(self, claim: str) -> list[EvidenceItem]:

        vector = self._emb.embed_text(claim)
        items = self._qdrant.search(vector, top_k=settings.TOP_K)

        threshold = settings.MIN_EVIDENCE_SCORE
        if threshold > 0.0:
            items = [e for e in items if (e.score or 0.0) >= threshold]

        return items


# Định dạng evidence thành một chuỗi có cấu trúc để chèn vào prompt fact-checking.
    def _format_evidence_for_prompt(self, evidence: list[EvidenceItem]) -> str:

        if not evidence:
            return ""

        parts: list[str] = []
        for i, item in enumerate(evidence, start=1):
            book = item.book_name or "Không rõ nguồn"
            pages_str = (
                ", ".join(str(p) for p in item.pages) if item.pages else "N/A"
            )
            text = item.text[: settings.MAX_EVIDENCE_CHARS]
            parts.append(
                f"[{i}] Sách: {book} | Trang: {pages_str}\n{text}"
            )

        return "\n\n".join(parts)

# Check a single claim: retrieve evidence, call Qwen, and build a ClaimResult.
    def check_claim(self, claim: str) -> ClaimResult:

        evidence = self.retrieve_evidence(claim)

        # --- No evidence: skip Qwen ---
        if not evidence:
            return ClaimResult(
                claim=claim,
                label="NOT_ENOUGH_EVIDENCE",
                # penalty_score=PENALTY_MAP["NOT_ENOUGH_EVIDENCE"],
                explanation="Không tìm thấy bằng chứng phù hợp trong cơ sở tri thức.",
                evidence=[],
            )

        # --- Fact-check with Qwen ---
        evidence_text = self._format_evidence_for_prompt(evidence)
        print("DEBUG: Evidence text for claim:", claim)
        print("\n\n\n")
        print("DEBUG: Formatted evidence text:", evidence_text)
        prompt = build_fact_check_prompt(claim, evidence_text)

        label = "NOT_ENOUGH_EVIDENCE"
        explanation = "Không thể xác định kết quả từ bằng chứng hiện có."

        try:
            result = self._call_ollama(prompt)
            raw_label: str = str(result.get("label", "")).strip().upper()
            raw_explanation: str = str(result.get("explanation", "")).strip()

            if raw_label in VALID_LABELS:
                label = raw_label
            else:
                logger.warning(
                    "Invalid label %r from Qwen; defaulting to NOT_ENOUGH_EVIDENCE.",
                    raw_label,
                )

            if raw_explanation:
                explanation = raw_explanation

        except Exception as exc:
            logger.error("Fact-check Qwen call failed for claim %r: %s", claim, exc)
            # Keep safe defaults set above

        # penalty_score = PENALTY_MAP.get(label, PENALTY_MAP["NOT_ENOUGH_EVIDENCE"])

        return ClaimResult(
            claim=claim,
            label=label,
            # penalty_score=penalty_score,
            explanation=explanation,
            evidence=evidence,
        )

# Full pipeline: extract claims → check each claim → aggregate scores.
    def check_post(
        self,
        post_id: str | None,
        content: str,
    ) -> FactCheckResponse:

        claims = self.extract_claims(content)

        # No claims found
        if not claims:
            return FactCheckResponse(
                post_id=post_id,
                # quality_score=0.5,
                post_label="NOT_ENOUGH_EVIDENCE",
                claims=[],
            )

        # Check each claim
        results: list[ClaimResult] = []
        for claim in claims:
            logger.info("Checking claim: %s", claim[:80])
            result = self.check_claim(claim)
            results.append(result)

        # Aggregate
        # avg_penalty = sum(r.penalty_score for r in results) / len(results)
        # quality_score = max(0.0, min(1.0, 1.0 - avg_penalty))

        # Determine post-level label
        labels = {r.label for r in results}
        if "REFUTED" in labels:
            post_label = "REFUTED"
        elif labels == {"SUPPORTED"}:
            post_label = "SUPPORTED"
        else:
            post_label = "NOT_ENOUGH_EVIDENCE"

        return FactCheckResponse(
            post_id=post_id,
            # quality_score=round(quality_score, 4),
            post_label=post_label,
            claims=results,
        )