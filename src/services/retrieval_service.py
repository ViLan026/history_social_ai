from __future__ import annotations

import logging

from src.config import settings
from src.exceptions import RetrievalServiceError
from src.schemas.fact_check_schema import EvidenceItem
from src.services.embedding_service import EmbeddingService
from src.services.qdrant_service import QdrantService

logger = logging.getLogger(__name__)


class RetrievalService:
    """
    Orchestrates the evidence retrieval pipeline:

    query text
        -> embedding
        -> Qdrant search
        -> evidence validation
        -> score filtering
    """

    def __init__(
        self,
        embedding_service: EmbeddingService,
        qdrant_service: QdrantService,
    ) -> None:
        self._embedding_service = embedding_service
        self._qdrant_service = qdrant_service

    def retrieve(
        self,
        query_text: str,
        *,
        top_k: int | None = None,
    ) -> list[EvidenceItem]:
        query_text = query_text.strip()

        if not query_text:
            raise ValueError(
                "Retrieval query must not be empty."
            )

        if top_k is not None and top_k <= 0:
            raise ValueError(
                "'top_k' must be greater than zero."
            )

        try:
            vector = self._embedding_service.embed_text(query_text)

            items = self._qdrant_service.search(
                vector=vector,
                top_k=top_k,
            )

        except RetrievalServiceError:
            # QdrantService has already converted the underlying
            # infrastructure error.
            raise

        except Exception as exc:
            # This includes embedding model failures.
            logger.exception(
                "Evidence retrieval failed before result filtering."
            )

            raise RetrievalServiceError(
                "Evidence retrieval could not be completed."
            ) from exc

        valid_items: list[EvidenceItem] = []

        for item in items:
            text = item.text.strip()

            # A Qdrant point without usable text is not valid evidence.
            if not text:
                logger.warning(
                    "Ignoring evidence with empty text. chunk_id=%s",
                    item.chunk_id,
                )
                continue

            if settings.MIN_EVIDENCE_SCORE > 0.0:
                if item.score is None:
                    continue

                if item.score < settings.MIN_EVIDENCE_SCORE:
                    continue

            # Keep a normalized copy rather than mutating the original model.
            valid_items.append(
                item.model_copy(
                    update={
                        "text": text,
                    }
                )
            )

        logger.info(
            "Retrieved %d valid evidence item(s).",
            len(valid_items),
        )

        return valid_items