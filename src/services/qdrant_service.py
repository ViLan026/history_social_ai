"""
Qdrant Cloud retrieval service.
Queries the vector collection and maps results to EvidenceItem objects.
"""

from __future__ import annotations

import logging
from typing import Any

from qdrant_client import QdrantClient

from src.config import settings
from src.schemas.fact_check_schema import EvidenceItem

logger = logging.getLogger(__name__)


def _safe_str(value: Any, fallback: str = "") -> str:
    """Return *value* as str, or *fallback* if None."""
    return str(value) if value is not None else fallback


def _safe_list_int(value: Any) -> list[int]:
    """Coerce *value* to list[int] safely."""
    if not value:
        return []
    if isinstance(value, list):
        result: list[int] = []
        for item in value:
            try:
                result.append(int(item))
            except (TypeError, ValueError):
                pass
        return result
    try:
        return [int(value)]
    except (TypeError, ValueError):
        return []


class QdrantService:
    """Handles vector search against a Qdrant Cloud collection."""

    def __init__(self) -> None:
        logger.info("Connecting to Qdrant: %s", settings.QDRANT_URL)
        self._client = QdrantClient(
            url=settings.QDRANT_URL,
            api_key=settings.QDRANT_API_KEY,
        )
        self._collection = settings.QDRANT_COLLECTION_NAME
        logger.info("Qdrant client ready. Collection: %s", self._collection)

    def search(
        self,
        vector: list[float],
        top_k: int | None = None,
    ) -> list[EvidenceItem]:
        """
        Perform a nearest-neighbour search against the configured collection.

        Args:
            vector:  Query embedding (must match the dimension used at index time).
            top_k:   Number of results to retrieve. Defaults to settings.TOP_K.

        Returns:
            A list of EvidenceItem objects ordered by descending similarity score.
        """
        limit = top_k if top_k is not None else settings.TOP_K

        results = self._client.query_points(
            collection_name=self._collection,
            query=vector,
            limit=limit,
            with_payload=True,
        )

        items: list[EvidenceItem] = []
        for point in results.points:
            payload: dict[str, Any] = point.payload or {}

            # Prefer raw_text, fall back to overlap_text
            text = _safe_str(payload.get("raw_text") or payload.get("overlap_text"))

            # chunk_id: use payload field first, then point id
            chunk_id = _safe_str(
                payload.get("chunk_id") or point.id,
                fallback=str(point.id),
            )

            footnotes_raw = payload.get("footnotes")
            footnotes: dict | None = (
                footnotes_raw if isinstance(footnotes_raw, dict) else None
            )

            items.append(
                EvidenceItem(
                    chunk_id=chunk_id,
                    score=getattr(point, "score", None),
                    book_name=payload.get("book_name"),
                    pages=_safe_list_int(payload.get("pages")),
                    text=text,
                    footnotes=footnotes,
                )
            )

        return items