"""
Pydantic schemas for the fact-checking API.

Valid claim labels:
  SUPPORTED            – evidence directly supports the claim
  REFUTED              – evidence directly refutes the claim
  NOT_ENOUGH_EVIDENCE  – insufficient evidence to confirm or deny
"""

from __future__ import annotations

from typing import Any

from pydantic import BaseModel, field_validator


# ---------------------------------------------------------------------------
# Request
# ---------------------------------------------------------------------------


class FactCheckRequest(BaseModel):
    """Incoming request from Spring Boot containing the post to be checked."""

    post_id: str | None = None
    content: str

    @field_validator("content")
    @classmethod
    def content_not_empty(cls, v: str) -> str:
        v = v.strip()
        if len(v) < 5:
            raise ValueError("'content' must be at least 5 characters long.")
        return v


# ---------------------------------------------------------------------------
# Response building blocks
# ---------------------------------------------------------------------------


class EvidenceItem(BaseModel):
    """A single evidence chunk retrieved from Qdrant."""

    chunk_id: str | None = None
    score: float | None = None
    book_name: str | None = None
    pages: list[int] = []
    text: str
    footnotes: dict[str, Any] | None = None


class ClaimResult(BaseModel):
    """Fact-checking result for a single historical claim."""

    claim: str
    label: str          # SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    penalty_score: float
    explanation: str
    evidence: list[EvidenceItem] = []


class FactCheckResponse(BaseModel):
    """Overall fact-checking response for a post."""

    post_id: str | None = None
    quality_score: float        # 0.0 – 1.0
    post_label: str             # SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    claims: list[ClaimResult] = []