from __future__ import annotations

from enum import Enum
from typing import Any

from pydantic import BaseModel, Field, field_validator, model_validator


class FactCheckLabel(str, Enum):
    SUPPORTED = "SUPPORTED"
    REFUTED = "REFUTED"
    NOT_ENOUGH_EVIDENCE = "NOT_ENOUGH_EVIDENCE"

# Request
# dữ liệu gửi từ Spring Boot sang FastAPI
class FactCheckRequest(BaseModel):
    post_id: str | None = None
    content: str

    @field_validator("content")
    @classmethod
    def content_not_empty(cls, v: str) -> str:
        v = v.strip()
        if len(v) < 5:
            raise ValueError("'content' must be at least 5 characters long.")
        return v


# Response building blocks
# Nội dung Qdrant trả về 
class EvidenceItem(BaseModel):
    chunk_id: str | None = None
    score: float | None = None
    book_name: str | None = None
    pages: list[int] = Field(default_factory=list)
    text: str
    footnotes: dict[str, Any] | None = None

# kết quả của một claim 
class ClaimResult(BaseModel):
    claim: str
    label: str          # SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    # penalty_score: float
    explanation: str
    evidence: list[EvidenceItem] = Field(default_factory=list)


# kết quả bài post sau khi fact-checking xong 
class FactCheckResponse(BaseModel):
    post_id: str | None = None
    # quality_score: float        # 0.0 – 1.0
    # post_label: str             # SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    claims: list[ClaimResult] = Field(default_factory=list)


# === Retrieval API ===

# Request cho retrieval endpoint
# Nhận vào claim/content và trả về danh sách kết quả retrieval
class RetrievalRequest(BaseModel):
    post_id: str | None = None
    claim: str | None = None
    content: str | None = None

    @field_validator("claim", "content")
    @classmethod
    def validate_optional_text(
        cls,
        value: str | None,
    ) -> str | None:
        if value is None:
            return None

        value = value.strip()

        if len(value) < 5:
            raise ValueError("Text field must be at least 5 characters long.")
        
        return value
    
    @model_validator(mode="after")
    def exactly_one_text_field(self) -> "RetrievalRequest":
        has_claim = self.claim is not None
        has_content = self.content is not None

        if has_claim == has_content:
            raise ValueError("Exactly one of 'claim' or 'content' must be provided.")

        return self

    def get_text(self) -> str:
        if self.claim is not None:
            return self.claim

        if self.content is not None:
            return self.content

        # Model validation normally prevents this state.
        raise ValueError("Exactly one of 'claim' or 'content' must be provided.")



# Response cho retrieval endpoint
class RetrievalResponse(BaseModel):
    post_id: str | None = None
    query_text: str
    results: list[EvidenceItem] = Field(default_factory=list)




class ClaimExtractionOutput(BaseModel):
    claims: list[str] 

class ClaimVerificationOutput(BaseModel):
    label: FactCheckLabel
    explanation: str 

