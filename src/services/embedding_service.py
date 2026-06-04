"""
Embedding service using sentence-transformers with AITeamVN/Vietnamese_Embedding.
Ollama is NOT used here – embeddings are generated locally via the HuggingFace model.
"""

from __future__ import annotations

import logging
import os

from sentence_transformers import SentenceTransformer

from src.config import settings

logger = logging.getLogger(__name__)


class EmbeddingService:
    def __init__(self) -> None:
        if settings.HF_TOKEN:
            os.environ.setdefault("HF_TOKEN", settings.HF_TOKEN)
            os.environ.setdefault("HUGGING_FACE_HUB_TOKEN", settings.HF_TOKEN)
            logger.info("HuggingFace token configured.")
        else:
            logger.warning(
                "HF_TOKEN not set. Downloads may be rate-limited. "
                "Add HF_TOKEN to .env to suppress this warning."
            )
 
        logger.info("Loading embedding model: %s", settings.EMBEDDING_MODEL)
        self._model = SentenceTransformer(
            settings.EMBEDDING_MODEL,
            token=settings.HF_TOKEN,  # passed directly to the Hub client
        )
        logger.info("Embedding model loaded successfully.")

    def embed_text(self, text: str) -> list[float]:
        text = text.strip()
        if not text:
            raise ValueError("embed_text received an empty string.")

        vector = self._model.encode(text, normalize_embeddings=True)
        return vector.tolist()