from __future__ import annotations

from functools import lru_cache
from typing import Any, Dict

from transformers import pipeline


MODEL_NAME = "tarudesu/ViSoBERT-HSD"


class HateSpeechService:
    def __init__(self) -> None:
        self.classifier = pipeline(
            "text-classification",
            model=MODEL_NAME,
            tokenizer=MODEL_NAME,
            return_all_scores=True,
        )

    def detect(self, text: str) -> Dict[str, Any]:
        if not text or not text.strip():
            return {
                "label": "NONE",
                "score": 0.0,
                "is_hate": False,
                "scores": [],
            }

        results = self.classifier(text.strip())[0]

        best_result = max(results, key=lambda item: item["score"])

        label = best_result["label"]
        score = float(best_result["score"])

        return {
            "label": label,
            "score": score,
            "is_hate": label.upper() == "HATE",
            "scores": [
                {
                    "label": item["label"],
                    "score": float(item["score"]),
                }
                for item in results
            ],
        }


@lru_cache(maxsize=1)
def get_hate_speech_service() -> HateSpeechService:
    return HateSpeechService()