"""
Core fact-checking orchestrator.

Pipeline:
  1. Extract historical claims from post content (via Qwen).
  2. For each claim:
     a. Embed the claim (sentence-transformers).
     b. Retrieve top-k evidence from Qdrant.
     c. Send claim + evidence to Qwen for label + explanation.
     d. Compute per-claim penalty_score.
  3. Aggregate into quality_score and post_label.
"""

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

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

VALID_LABELS = {"SUPPORTED", "REFUTED", "NOT_ENOUGH_EVIDENCE"}

PENALTY_MAP: dict[str, float] = {
    "SUPPORTED": 0.0,
    "NOT_ENOUGH_EVIDENCE": 0.25,
    "REFUTED": 1.0,
}


class FactCheckService:
    """Orchestrates the full RAG fact-checking pipeline for a single post."""

    def __init__(
        self,
        embedding_service: EmbeddingService,
        qdrant_service: QdrantService,
    ) -> None:
        self._emb = embedding_service
        self._qdrant = qdrant_service

    # ------------------------------------------------------------------
    # Internal: Ollama call
    # ------------------------------------------------------------------

    def _call_ollama(self, prompt: str) -> dict:
        """
        Send *prompt* to the Ollama /api/generate endpoint and return the
        parsed JSON response from the model.

        Args:
            prompt: The full prompt string.

        Returns:
            Parsed dict from the model's JSON output.

        Raises:
            ValueError: If the response cannot be parsed as JSON after recovery.
            requests.RequestException: On network / timeout errors.
        """
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

    # ------------------------------------------------------------------
    # Step 1: Claim extraction
    # ------------------------------------------------------------------

    def extract_claims(self, content: str) -> list[str]:
        """
        Use Qwen to split *content* into independent historical claims.

        Returns:
            A deduplicated, stripped list of claim strings (max MAX_CLAIMS_PER_POST).
        """
        prompt = build_claim_extraction_prompt(content)

        try:
            result = self._call_ollama(prompt)
        except Exception as exc:
            logger.warning("Claim extraction failed: %s", exc)
            return []

        raw_claims: list = result.get("claims", [])
        if not isinstance(raw_claims, list):
            logger.warning("'claims' field is not a list: %r", raw_claims)
            return []

        seen: set[str] = set()
        claims: list[str] = []
        for item in raw_claims:
            if not isinstance(item, str):
                continue
            item = item.strip()
            if not item:
                continue
            if item in seen:
                continue
            seen.add(item)
            claims.append(item)
            if len(claims) >= settings.MAX_CLAIMS_PER_POST:
                break

        logger.info("Extracted %d claim(s) from post.", len(claims))
        return claims

    # ------------------------------------------------------------------
    # Step 2: Evidence retrieval
    # ------------------------------------------------------------------

    def retrieve_evidence(self, claim: str) -> list[EvidenceItem]:
        """
        Embed *claim* and retrieve matching evidence chunks from Qdrant.

        Evidence items with score < MIN_EVIDENCE_SCORE are filtered out
        when the threshold is greater than 0.

        Returns:
            List of EvidenceItem objects.
        """
        vector = self._emb.embed_text(claim)
        items = self._qdrant.search(vector, top_k=settings.TOP_K)

        threshold = settings.MIN_EVIDENCE_SCORE
        if threshold > 0.0:
            items = [e for e in items if (e.score or 0.0) >= threshold]

        return items

    # ------------------------------------------------------------------
    # Internal: Evidence formatting
    # ------------------------------------------------------------------

    def _format_evidence_for_prompt(self, evidence: list[EvidenceItem]) -> str:
        """
        Render *evidence* as a compact numbered list suitable for injection
        into a Qwen prompt.  Each item's text is capped at MAX_EVIDENCE_CHARS.
        Footnotes are omitted to keep the prompt short.

        Returns:
            A formatted string, or an empty string if *evidence* is empty.
        """
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

    # ------------------------------------------------------------------
    # Step 3: Check a single claim
    # ------------------------------------------------------------------

    def check_claim(self, claim: str) -> ClaimResult:
        """
        Fact-check one *claim* through the full RAG pipeline.

        Returns:
            A ClaimResult with label, penalty_score, explanation, and evidence.
        """
        evidence = self.retrieve_evidence(claim)

        # --- No evidence: skip Qwen ---
        if not evidence:
            return ClaimResult(
                claim=claim,
                label="NOT_ENOUGH_EVIDENCE",
                penalty_score=PENALTY_MAP["NOT_ENOUGH_EVIDENCE"],
                explanation="Không tìm thấy bằng chứng phù hợp trong cơ sở tri thức.",
                evidence=[],
            )

        # --- Fact-check with Qwen ---
        evidence_text = self._format_evidence_for_prompt(evidence)
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

        penalty_score = PENALTY_MAP.get(label, PENALTY_MAP["NOT_ENOUGH_EVIDENCE"])

        return ClaimResult(
            claim=claim,
            label=label,
            penalty_score=penalty_score,
            explanation=explanation,
            evidence=evidence,
        )

    # ------------------------------------------------------------------
    # Step 4: Check a full post
    # ------------------------------------------------------------------

    def check_post(
        self,
        post_id: str | None,
        content: str,
    ) -> FactCheckResponse:
        """
        Full pipeline: extract claims → check each claim → aggregate scores.

        Args:
            post_id: Optional identifier echoed back in the response.
            content: Full text of the post.

        Returns:
            A FactCheckResponse with quality_score, post_label, and per-claim results.
        """
        claims = self.extract_claims(content)

        # No claims found
        if not claims:
            return FactCheckResponse(
                post_id=post_id,
                quality_score=0.5,
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
        avg_penalty = sum(r.penalty_score for r in results) / len(results)
        quality_score = max(0.0, min(1.0, 1.0 - avg_penalty))

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
            quality_score=round(quality_score, 4),
            post_label=post_label,
            claims=results,
        )