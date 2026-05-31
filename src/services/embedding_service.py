"""
Embedding service using sentence-transformers with AITeamVN/Vietnamese_Embedding.
Ollama is NOT used here – embeddings are generated locally via the HuggingFace model.
"""

from __future__ import annotations

import logging

from sentence_transformers import SentenceTransformer

from src.config import settings

logger = logging.getLogger(__name__)


class EmbeddingService:
    """Wraps SentenceTransformer to produce normalized embeddings for Vietnamese text."""

    def __init__(self) -> None:
        logger.info("Loading embedding model: %s", settings.EMBEDDING_MODEL)
        self._model = SentenceTransformer(settings.EMBEDDING_MODEL)
        logger.info("Embedding model loaded successfully.")

    def embed_text(self, text: str) -> list[float]:
        """
        Encode *text* into a normalized embedding vector.

        Args:
            text: Raw Vietnamese text to embed.

        Returns:
            A list of floats representing the normalized embedding.

        Raises:
            ValueError: If *text* is empty after stripping.
        """
        text = text.strip()
        if not text:
            raise ValueError("embed_text received an empty string.")

        vector = self._model.encode(text, normalize_embeddings=True)
        return vector.tolist()