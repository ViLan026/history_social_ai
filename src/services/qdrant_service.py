
from __future__ import annotations

import logging
from typing import Any

from qdrant_client import QdrantClient
from qdrant_client.http.exceptions import ResponseHandlingException

from src.config import settings
from src.schemas.fact_check_schema import EvidenceItem

logger = logging.getLogger(__name__)

# trả về string an toàn từ payload. Nếu giá trị là None, trả về chuỗi rỗng. 
def _safe_str(value: Any, fallback: str = "") -> str:
    return str(value) if value is not None else fallback

# trả về list[int] an toàn từ payload. Nếu giá trị là None hoặc không thể chuyển thành int, trả về list rỗng.
def _safe_list_int(value: Any) -> list[int]:
    if not value:
        return []
    if isinstance(value, list):
        result: list[int] = []
        for item in value:
            try:
                result.append(int(item))
            except (TypeError, ValueError):
                pass
        return result
    try:
        return [int(value)]
    except (TypeError, ValueError):
        return []

# kết nối, truy vấn và trả về kết quả 

class QdrantService:
    def __init__(self) -> None:
        logger.info("Connecting to Qdrant: %s", settings.QDRANT_URL)

        self._client = QdrantClient(
            url=settings.QDRANT_URL,
            api_key=settings.QDRANT_API_KEY or None,
            timeout=60.0,
        )

        self._collection = settings.QDRANT_COLLECTION_NAME
        logger.info("Qdrant client ready. Collection: %s", self._collection)

    def search(
        self,
        vector: list[float],
        top_k: int | None = None,
    ) -> list[EvidenceItem]:
        
        limit = top_k if top_k is not None else settings.TOP_K

        try:
            results = self._client.query_points(
                collection_name=self._collection,
                query=vector,
                limit=limit,
                with_payload=True,
            )
        except ResponseHandlingException as exc:
            logger.error("Qdrant search failed: %s", exc)
            return []
        
        print("DEBUG: Raw Qdrant results:", results)
        print("\n\n\n")

        items: list[EvidenceItem] = []
        for point in results.points:
            payload: dict[str, Any] = point.payload or {}

            # Prefer raw_text, fall back to overlap_text
            text = _safe_str(payload.get("raw_text") or payload.get("overlap_text"))

            # chunk_id: use payload field first, then point id
            chunk_id = _safe_str(
                payload.get("chunk_id") or point.id,
                fallback=str(point.id),
            )

            footnotes_raw = payload.get("footnotes")
            footnotes: dict | None = (
                footnotes_raw if isinstance(footnotes_raw, dict) else None
            )

            items.append(
                EvidenceItem(
                    chunk_id=chunk_id,
                    score=getattr(point, "score", None),
                    book_name=payload.get("book_name"),
                    pages=_safe_list_int(payload.get("pages")),
                    text=text,
                    footnotes=footnotes,
                )
            )

        return items
    




# [
#   {
#     "chunk_id": "string",     // ID của đoạn văn bản (Lấy từ payload hoặc ID gốc của Qdrant point)
#     "score": 0.0,             // float (Điểm độ tương đồng vector trả về từ Qdrant)
#     "book_name": "string",    // Tên cuốn sách chứa đoạn văn bản
#     "pages": [0],             // Mảng số nguyên (Các trang sách chứa đoạn dữ liệu này)
#     "text": "string",         // Nội dung văn bản thô (Ưu tiên raw_text, fallback về overlap_text)
#     "footnotes": {}           // Object/Dictionary chứa chú thích (Hoặc null nếu không có)
#   }
# ]




# {
#   "claim": "string",          // Mệnh đề gốc truyền vào để kiểm chứng
#   "label": "string",          // Nhãn sau khi đã chuẩn hóa và check VALID_LABELS
#   "penalty_score": 0.0,       // Số thực/Số nguyên lấy từ PENALTY_MAP dựa theo nhãn
#   "explanation": "string",    // Câu giải thích (Lấy từ AI hoặc dùng câu mặc định nếu AI lỗi)
#   "evidence": [               // Mảng chứa các bằng chứng đã tìm thấy từ Qdrant trước đó
#     {
#       "chunk_id": "string",
#       "score": 0.0,
#       "book_name": "string",
#       "pages": [0],
#       "text": "string",
#       "footnotes": {}         // Có thể là một Object chứa key-value hoặc null
#     }
#   ]
# }