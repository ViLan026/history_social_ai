"""
FastAPI application entry point for the History Social AI service.

Endpoints:
  GET  /health      – liveness probe
  POST /fact-check  – RAG fact-checking pipeline
"""

from __future__ import annotations

import logging

from fastapi import FastAPI, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from src.config import settings
from src.schemas.fact_check_schema import FactCheckRequest, FactCheckResponse
from src.services.embedding_service import EmbeddingService
from src.services.fact_check_service import FactCheckService
from src.services.qdrant_service import QdrantService

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(name)s | %(message)s",
)
logger = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# App
# ---------------------------------------------------------------------------

app = FastAPI(
    title=settings.APP_NAME,
    version="1.0.0",
    description="RAG fact-checking microservice for the history social network.",
)

# CORS – allow all origins in local development; tighten in production
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ---------------------------------------------------------------------------
# Service singletons (loaded once at startup, not per-request)
# ---------------------------------------------------------------------------

_embedding_service: EmbeddingService | None = None
_qdrant_service: QdrantService | None = None
_fact_check_service: FactCheckService | None = None


@app.on_event("startup")
async def startup_event() -> None:
    """Initialise heavy services at startup to avoid cold-start latency."""
    global _embedding_service, _qdrant_service, _fact_check_service

    logger.info("Starting up %s …", settings.APP_NAME)
    _embedding_service = EmbeddingService()
    _qdrant_service = QdrantService()
    _fact_check_service = FactCheckService(_embedding_service, _qdrant_service)
    logger.info("All services ready.")


# ---------------------------------------------------------------------------
# Exception handler
# ---------------------------------------------------------------------------


@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception) -> JSONResponse:
    logger.exception("Unhandled exception on %s", request.url.path)
    return JSONResponse(
        status_code=500,
        content={"detail": "Internal server error.", "error": str(exc)},
    )


# ---------------------------------------------------------------------------
# Endpoints
# ---------------------------------------------------------------------------


@app.get("/health", tags=["Monitoring"])
async def health_check() -> dict:
    """Liveness probe for load-balancers and Spring Boot health checks."""
    return {"status": "ok", "service": settings.APP_NAME}


@app.post(
    "/fact-check",
    response_model=FactCheckResponse,
    tags=["Fact Checking"],
    summary="Fact-check a historical post via RAG pipeline",
)
async def fact_check(request: FactCheckRequest) -> FactCheckResponse:
    """
    Receive a post from Spring Boot, run the full RAG fact-checking pipeline,
    and return structured results including per-claim labels and a quality score.
    """
    if _fact_check_service is None:
        raise HTTPException(status_code=503, detail="Service not ready yet.")

    try:
        response = _fact_check_service.check_post(
            post_id=request.post_id,
            content=request.content,
        )
    except ValueError as exc:
        logger.warning("Bad input: %s", exc)
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    except Exception as exc:
        logger.exception("Fact-check pipeline error: %s", exc)
        raise HTTPException(
            status_code=500, detail=f"Fact-check pipeline failed: {exc}"
        ) from exc

    return response