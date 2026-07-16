from __future__ import annotations

import logging
from typing import Any

from qdrant_client import QdrantClient

from src.config import settings
from src.exceptions import RetrievalServiceError
from src.schemas.fact_check_schema import EvidenceItem

logger = logging.getLogger(__name__)


def _safe_str(
    value: Any,
    fallback: str = "",
) -> str:
    if value is None:
        return fallback

    return str(value)


def _safe_float(value: Any) -> float | None:
    if value is None:
        return None

    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def _safe_list_int(value: Any) -> list[int]:
    if value is None:
        return []

    if isinstance(value, list):
        result: list[int] = []

        for item in value:
            try:
                result.append(int(item))
            except (TypeError, ValueError):
                continue

        return result

    try:
        return [int(value)]
    except (TypeError, ValueError):
        return []

# Handles Qdrant connection and vector search.
class QdrantService:

    def __init__(self) -> None:
        logger.info( "Initializing Qdrant client. Collection: %s", settings.QDRANT_COLLECTION_NAME)

        self._client = QdrantClient(
            url=settings.QDRANT_URL,
            api_key=settings.QDRANT_API_KEY or None,
            timeout=settings.QDRANT_TIMEOUT_SECONDS,
        )

        self._collection = settings.QDRANT_COLLECTION_NAME

    def search(
        self,
        vector: list[float],
        top_k: int | None = None,
    ) -> list[EvidenceItem]:
        if not vector:
            raise ValueError("Qdrant search vector must not be empty.")

        limit = top_k if top_k is not None else settings.TOP_K

        if limit <= 0:
            raise ValueError("Qdrant search limit must be greater than zero.")

        try:
            response = self._client.query_points(
                collection_name=self._collection,
                query=vector,
                limit=limit,
                with_payload=True,
            )
        except Exception as exc:
            logger.exception("Qdrant search failed. Collection: %s",self._collection, )

            raise RetrievalServiceError( "Qdrant search could not be completed.") from exc

        items: list[EvidenceItem] = []

        for point in response.points:
            payload: dict[str, Any] = point.payload or {}

            # Prefer raw_text for display and verification.
            # overlap_text is only a fallback.
            text = _safe_str( payload.get("raw_text") or payload.get("overlap_text"))

            chunk_id = _safe_str( payload.get("chunk_id") or point.id, fallback=str(point.id))

            book_name_text = _safe_str(payload.get("book_name")).strip()

            book_name = book_name_text or None

            footnotes_raw = payload.get("footnotes")
            footnotes: dict[str, Any] | None = None

            if isinstance(footnotes_raw, dict):
                footnotes = footnotes_raw

            items.append(
                EvidenceItem(
                    chunk_id=chunk_id,
                    score=_safe_float(getattr(point, "score", None)),
                    book_name=book_name,
                    pages=_safe_list_int( payload.get("pages")),
                    text=text,
                    footnotes=footnotes,
                )
            )

        logger.debug( "Qdrant returned %d point(s). Collection: %s", len(items), self._collection)

        return items