from __future__ import annotations

from functools import lru_cache
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

    def detect(self, text: str):
        result = self.classifier(text)

        if isinstance(result, list):
            if len(result) == 0:
                results = []
            elif isinstance(result[0], list):
                results = result[0]
            else:
                results = result
        else:
            results = [result]

        scores = [
            {
                "label": str(item.get("label", "")),
                "score": float(item.get("score", 0.0)),
            }
            for item in results
        ]

        print(f"results {results} \n")

        if not scores:
            return {
                "label": "CLEAN",
                "score": 0.0,
                "hateSpeech": False,
                "scores": [],
            }

        best_result = max(scores, key=lambda item: item["score"])

        raw_label = best_result["label"].upper()
        score = best_result["score"]

        hateSpeech = raw_label in {"LABEL_1", "HATE", "HATE_SPEECH"}

        return {
            "label": "HATE" if hateSpeech else "CLEAN",
            "score": score,
            "hateSpeech": hateSpeech,
            "scores": scores,
        }


@lru_cache(maxsize=1)
def get_hate_speech_service() -> HateSpeechService:
    return HateSpeechService()