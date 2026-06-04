from __future__ import annotations
from dataclasses import Field
from typing import Any
from pydantic import BaseModel, Field, field_validator


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
    # score: float | None = None
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
    post_label: str             # SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    claims: list[ClaimResult] = Field(default_factory=list)