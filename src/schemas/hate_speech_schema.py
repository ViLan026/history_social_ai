from pydantic import BaseModel
from typing import List


class HateSpeechRequest(BaseModel):
    text: str


class HateSpeechScore(BaseModel):
    label: str
    score: float


class HateSpeechResponse(BaseModel):
    label: str
    score: float
    is_hate: bool
    scores: List[HateSpeechScore]