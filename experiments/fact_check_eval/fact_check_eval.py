from __future__ import annotations

import csv
import json
import sys
from collections import Counter, defaultdict
from datetime import datetime
from pathlib import Path
from typing import Any

# Cho phép import src khi chạy từ root project
ROOT_DIR = Path(__file__).resolve().parents[2]
sys.path.append(str(ROOT_DIR))

from src.services.embedding_service import EmbeddingService
from src.services.fact_check_service import FactCheckService, VALID_LABELS
from src.services.qdrant_service import QdrantService


DATASET_PATH = ROOT_DIR / "data" / "NhaTran" / "dataset" / "fact_check_eval_claims.json"
RESULT_DIR = ROOT_DIR / "experiments" / "fact_check_eval" / "results"

DETAIL_CSV_PATH = RESULT_DIR / "fact_check_eval_details.csv"
SUMMARY_CSV_PATH = RESULT_DIR / "fact_check_eval_summary.csv"
OUTPUT_JSON_PATH = RESULT_DIR / "fact_check_eval_outputs.json"


def load_eval_claims(path: Path) -> list[dict[str, Any]]:
    if not path.exists():
        raise FileNotFoundError(f"Không tìm thấy file dataset: {path}")

    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, list):
        raise ValueError("File fact_check_eval_claims.json phải là một list JSON.")

    valid_rows: list[dict[str, Any]] = []

    for idx, item in enumerate(data, start=1):
        claim_id = item.get("claim_id") or f"eval_{idx:04d}"
        claim = str(item.get("claim", "")).strip()
        gold_label = str(item.get("gold_label", "")).strip().upper()

        if not claim:
            print(f"Bỏ qua dòng {idx}: claim rỗng.")
            continue

        if gold_label not in VALID_LABELS:
            print(f"Bỏ qua dòng {idx}: gold_label không hợp lệ: {gold_label}")
            continue

        valid_rows.append(
            {
                "claim_id": claim_id,
                "claim": claim,
                "gold_label": gold_label,
            }
        )

    return valid_rows


def serialize_evidence(evidence_items: list[Any]) -> list[dict[str, Any]]:
    results: list[dict[str, Any]] = []

    for item in evidence_items:
        if hasattr(item, "model_dump"):
            data = item.model_dump()
        elif hasattr(item, "dict"):
            data = item.dict()
        else:
            data = dict(item)

        results.append(
            {
                "chunk_id": data.get("chunk_id"),
                "score": data.get("score"),
                "book_name": data.get("book_name"),
                "pages": data.get("pages"),
                "text": data.get("text"),
                "footnotes": data.get("footnotes"),
            }
        )

    return results


def evaluate_claims(
    service: FactCheckService,
    eval_rows: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    outputs: list[dict[str, Any]] = []

    for i, row in enumerate(eval_rows, start=1):
        claim_id = row["claim_id"]
        claim = row["claim"]
        gold_label = row["gold_label"]

        print(f"[{i}/{len(eval_rows)}] Checking {claim_id}: {claim}")

        try:
            result = service.check_claim(claim)
            pred_label = result.label
            explanation = result.explanation
            evidence = serialize_evidence(result.evidence)
            error = ""
        except Exception as exc:
            pred_label = "ERROR"
            explanation = ""
            evidence = []
            error = str(exc)

        is_correct = pred_label == gold_label

        outputs.append(
            {
                "claim_id": claim_id,
                "claim": claim,
                "gold_label": gold_label,
                "pred_label": pred_label,
                "is_correct": is_correct,
                "explanation": explanation,
                "evidence_count": len(evidence),
                "top_evidence_book": evidence[0].get("book_name") if evidence else "",
                "top_evidence_pages": evidence[0].get("pages") if evidence else "",
                "top_evidence_score": evidence[0].get("score") if evidence else "",
                "top_evidence_text": evidence[0].get("text") if evidence else "",
                "evidence": evidence,
                "error": error,
            }
        )

    return outputs


def build_summary(outputs: list[dict[str, Any]]) -> list[dict[str, Any]]:
    total = len(outputs)
    correct = sum(1 for row in outputs if row["is_correct"])
    overall_accuracy = correct / total if total else 0.0

    summary_rows: list[dict[str, Any]] = [
        {
            "label": "OVERALL",
            "total": total,
            "correct": correct,
            "accuracy": round(overall_accuracy, 4),
        }
    ]

    by_label_total = Counter(row["gold_label"] for row in outputs)
    by_label_correct = Counter(
        row["gold_label"] for row in outputs if row["is_correct"]
    )

    for label in sorted(VALID_LABELS):
        label_total = by_label_total[label]
        label_correct = by_label_correct[label]
        label_accuracy = label_correct / label_total if label_total else 0.0

        summary_rows.append(
            {
                "label": label,
                "total": label_total,
                "correct": label_correct,
                "accuracy": round(label_accuracy, 4),
            }
        )

    return summary_rows


def build_confusion_matrix(outputs: list[dict[str, Any]]) -> dict[str, dict[str, int]]:
    matrix: dict[str, dict[str, int]] = defaultdict(lambda: defaultdict(int))

    for row in outputs:
        gold = row["gold_label"]
        pred = row["pred_label"]
        matrix[gold][pred] += 1

    return {gold: dict(preds) for gold, preds in matrix.items()}


def save_results(
    outputs: list[dict[str, Any]],
    summary_rows: list[dict[str, Any]],
    confusion_matrix: dict[str, dict[str, int]],
) -> None:
    RESULT_DIR.mkdir(parents=True, exist_ok=True)

    detail_fields = [
        "claim_id",
        "claim",
        "gold_label",
        "pred_label",
        "is_correct",
        "evidence_count",
        "top_evidence_book",
        "top_evidence_pages",
        "top_evidence_score",
        "top_evidence_text",
        "explanation",
        "error",
    ]

    with DETAIL_CSV_PATH.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=detail_fields)
        writer.writeheader()

        for row in outputs:
            writer.writerow({field: row.get(field, "") for field in detail_fields})

    with SUMMARY_CSV_PATH.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["label", "total", "correct", "accuracy"])
        writer.writeheader()
        writer.writerows(summary_rows)

    json_output = {
        "created_at": datetime.now().isoformat(timespec="seconds"),
        "detail_csv": str(DETAIL_CSV_PATH),
        "summary_csv": str(SUMMARY_CSV_PATH),
        "summary": summary_rows,
        "confusion_matrix": confusion_matrix,
        "outputs": outputs,
    }

    with OUTPUT_JSON_PATH.open("w", encoding="utf-8") as f:
        json.dump(json_output, f, ensure_ascii=False, indent=2)


def main() -> None:
    eval_rows = load_eval_claims(DATASET_PATH)

    print(f"Loaded {len(eval_rows)} claims from {DATASET_PATH}")

    embedding_service = EmbeddingService()
    qdrant_service = QdrantService()
    fact_check_service = FactCheckService(
        embedding_service=embedding_service,
        qdrant_service=qdrant_service,
    )

    outputs = evaluate_claims(fact_check_service, eval_rows)
    summary_rows = build_summary(outputs)
    confusion_matrix = build_confusion_matrix(outputs)

    save_results(outputs, summary_rows, confusion_matrix)

    print("\n===== SUMMARY =====")
    for row in summary_rows:
        print(row)

    print("\nSaved files:")
    print(f"- {DETAIL_CSV_PATH}")
    print(f"- {SUMMARY_CSV_PATH}")
    print(f"- {OUTPUT_JSON_PATH}")


if __name__ == "__main__":
    main()