from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from src.api.routes import router, init_services
from src.config import settings

app = FastAPI(title=settings.APP_NAME, version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.on_event("startup")
async def startup_event():
    init_services()

app.include_router(router)