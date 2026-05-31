"""
Application configuration loaded from environment variables via pydantic-settings.
"""

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """All application settings, read from .env file or environment variables."""

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=False,
    )

    # App
    APP_NAME: str = "history_social"
    APP_ENV: str = "local"
    APP_HOST: str = "0.0.0.0"
    APP_PORT: int = 8000

    # Qdrant Cloud
    QDRANT_URL: str
    QDRANT_API_KEY: str
    QDRANT_COLLECTION_NAME: str = "history_aiteamvn_chunk_256"

    # Embedding
    EMBEDDING_MODEL: str = "AITeamVN/Vietnamese_Embedding"

    # Ollama / Qwen
    OLLAMA_URL: str = "http://localhost:11434"
    OLLAMA_MODEL: str 

    # Retrieval & processing knobs
    TOP_K: int = 5
    MAX_CLAIMS_PER_POST: int = 5
    MAX_EVIDENCE_CHARS: int = 800
    MIN_EVIDENCE_SCORE: float = 0.0
    REQUEST_TIMEOUT: int = 120


settings = Settings()