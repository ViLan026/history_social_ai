from __future__ import annotations

import logging
import re

from src.config import settings
from src.prompts.fact_check_prompt import (
    build_claim_extraction_prompt,
    build_fact_check_prompt,
)
from src.schemas.fact_check_schema import (
    ClaimResult,
    EvidenceItem,
    FactCheckLabel,
    FactCheckResponse,
)
from src.services.gemini_service import GeminiService
from src.services.retrieval_service import RetrievalService

logger = logging.getLogger(__name__)

_WHITESPACE_PATTERN = re.compile(r"\s+")
_END_PUNCTUATION_PATTERN = re.compile(r"[.!?…]+$")


class FactCheckService:
    """
    Điều phối toàn bộ pipeline fact-checking:

    post content
        -> claim extraction
        -> evidence retrieval
        -> claim verification
        -> FactCheckResponse
    """

    def __init__(
        self,
        gemini_service: GeminiService,
        retrieval_service: RetrievalService,
    ) -> None:
        self._gemini_service = gemini_service
        self._retrieval_service = retrieval_service

    @staticmethod
    def _normalize_claim_key(claim: str) -> str:
        """
        Chuẩn hóa claim để phát hiện các claim trùng nhau.

        Không thay đổi claim được trả về cho người dùng.
        """

        normalized = _WHITESPACE_PATTERN.sub(
            " ",
            claim.strip(),
        )

        normalized = _END_PUNCTUATION_PATTERN.sub("",normalized)

        return normalized.casefold()

    def extract_claims(self, content: str) -> list[str]:
        """
        Trích xuất claim bằng Gemini.

        Trả về [] chỉ khi Gemini gọi thành công và xác định
        bài viết không có claim lịch sử phù hợp.

        GeminiServiceError không bị bắt tại đây.
        """

        prompt = build_claim_extraction_prompt(content)

        output = self._gemini_service.extract_claims(prompt)

        seen: set[str] = set()
        claims: list[str] = []

        for raw_claim in output.claims:
            claim = _WHITESPACE_PATTERN.sub( " ", raw_claim.strip())

            if not claim:
                continue

            normalized_key = self._normalize_claim_key(claim)

            if not normalized_key:
                continue

            if normalized_key in seen:
                continue

            seen.add(normalized_key)
            claims.append(claim)

            if len(claims) >= settings.MAX_CLAIMS_PER_POST:
                break

        logger.info("Extracted %d claim(s) from post.",len(claims))

        return claims

    @staticmethod
    def _format_evidence_for_prompt(
        evidence: list[EvidenceItem],
    ) -> str:
        """
        Định dạng evidence để đưa vào prompt verification.

        Footnote chỉ được giữ trong response cho frontend,
        không được đưa vào prompt Gemini.
        """

        sections: list[str] = []

        for index, item in enumerate(evidence, start=1):
            text = item.text.strip()

            if not text:
                continue

            book_name = item.book_name or "Không rõ tên sách"

            pages = (
                ", ".join(str(page) for page in item.pages)
                if item.pages
                else "Không xác định"
            )

            sections.append(
                "\n".join(
                    [
                        f"<EVIDENCE_{index}>",
                        f"Sách: {book_name}",
                        f"Trang: {pages}",
                        "Nội dung:",
                        text,
                        f"</EVIDENCE_{index}>",
                    ]
                )
            )

        return "\n\n".join(sections)

    def check_claim(self, claim: str) -> ClaimResult:
        """
        Kiểm chứng một claim.
        Ba trường hợp được phân biệt:
        1. Retrieval thành công nhưng không có evidence:trả NOT_ENOUGH_EVIDENCE.
        2. Retrieval gặp lỗi: RetrievalServiceError được đưa lên endpoint.
        3. Gemini verification gặp lỗi: GeminiServiceError được đưa lên endpoint.
        """

        evidence = self._retrieval_service.retrieve(claim)

        if not evidence:
            return ClaimResult(
                claim=claim,
                label=FactCheckLabel.NOT_ENOUGH_EVIDENCE,
                explanation=("Chưa có đủ thông tin trong cơ sở tri thức để xác nhận hoặc bác bỏ nội dung này."),
                evidence=[],
            )

        evidence_text = self._format_evidence_for_prompt(
            evidence
        )

        # RetrievalService đã loại evidence text rỗng,
        # nhưng vẫn kiểm tra phòng trường hợp dữ liệu bất thường.
        if not evidence_text:
            return ClaimResult(
                claim=claim,
                label=FactCheckLabel.NOT_ENOUGH_EVIDENCE,
                explanation=("Chưa có đủ thông tin trong cơ sở tri thức để xác nhận hoặc bác bỏ nội dung này."),
                evidence=[],
            )

        prompt = build_fact_check_prompt(claim=claim,evidence_text=evidence_text)

        verification = self._gemini_service.verify_claim(prompt)

        explanation = verification.explanation.strip()

        if not explanation:
            # Bình thường schema đã ngăn trường hợp này.
            # Nếu vẫn xảy ra thì đây là output LLM không hợp lệ,
            # không phải NOT_ENOUGH_EVIDENCE.
            from src.exceptions import GeminiServiceError

            raise GeminiServiceError("Gemini returned an empty explanation.",operation="claim_verification",)

        return ClaimResult(
            claim=claim,
            label=verification.label,
            explanation=explanation,
            evidence=evidence,
        )

    def check_post(
        self,
        post_id: str | None,
        content: str,
    ) -> FactCheckResponse:
        """
        Chạy toàn bộ pipeline cho một bài viết.
        Chưa xử lý song song để tránh tạo nhiều request Gemini đồng thời và khó kiểm soát quota.
        """

        claims = self.extract_claims(content)

        if not claims:
            return FactCheckResponse(post_id=post_id, claims=[],)

        results: list[ClaimResult] = []

        for claim in claims:
            logger.info( "Checking claim: %s", claim[:100],)

            result = self.check_claim(claim)
            results.append(result)

        return FactCheckResponse(post_id=post_id, claims=results,)