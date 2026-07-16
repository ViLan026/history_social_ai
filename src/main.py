from __future__ import annotations

from collections.abc import AsyncIterator
from contextlib import asynccontextmanager

from fastapi import FastAPI

from src.api.routes import (close_services, init_services, router)
from src.config import settings


@asynccontextmanager
async def lifespan(
    app: FastAPI,
) -> AsyncIterator[None]:
    init_services()

    try:
        yield
    finally:
        close_services()


app = FastAPI(title=settings.APP_NAME, version="1.0.0", lifespan=lifespan,)

app.include_router(router) 