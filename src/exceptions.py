from __future__ import annotations


class AIServiceError(RuntimeError):
    """Base exception for expected AI Service failures."""


class RetrievalServiceError(AIServiceError):
    """
    Raised when evidence retrieval cannot be completed because
    embedding or Qdrant encountered an operational error.
    """


class GeminiServiceError(AIServiceError):
    """
    Raised when a Gemini request fails or Gemini returns output
    that cannot be validated.
    """

    def __init__(
        self,
        message: str,
        *,
        operation: str,
    ) -> None:
        super().__init__(message)
        self.operation = operation