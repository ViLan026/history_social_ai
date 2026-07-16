from __future__ import annotations

import logging

from fastapi import APIRouter, HTTPException, status

from src.config import settings
from src.exceptions import (
    GeminiServiceError,
    RetrievalServiceError,
)
from src.schemas.fact_check_schema import (
    FactCheckRequest,
    FactCheckResponse,
    RetrievalRequest,
    RetrievalResponse,
)
from src.schemas.hate_speech_schema import (
    HateSpeechRequest,
    HateSpeechResponse,
)
from src.services.embedding_service import EmbeddingService
from src.services.fact_check_service import FactCheckService
from src.services.gemini_service import GeminiService
from src.services.hate_speech_service import HateSpeechService
from src.services.qdrant_service import QdrantService
from src.services.retrieval_service import RetrievalService

logger = logging.getLogger(__name__)

router = APIRouter()

_embedding_service: EmbeddingService | None = None
_qdrant_service: QdrantService | None = None
_retrieval_service: RetrievalService | None = None
_gemini_service: GeminiService | None = None
_fact_check_service: FactCheckService | None = None
_hate_speech_service: HateSpeechService | None = None


def init_services():
    global _embedding_service, _qdrant_service,_gemini_service, _retrieval_service, _fact_check_service, _hate_speech_service
    
    gemini_service: GeminiService | None = None
    
    try:
        embedding_service = EmbeddingService()
        qdrant_service = QdrantService()
        retrieval_service = RetrievalService(embedding_service=embedding_service, qdrant_service=qdrant_service)
        gemini_service = GeminiService()
        fact_check_service = FactCheckService(gemini_service=gemini_service, retrieval_service=retrieval_service)

        hate_speech_service = HateSpeechService()

        # Chỉ gán global sau khi toàn bộ service khởi tạo thành công.
        _embedding_service = embedding_service
        _qdrant_service = qdrant_service
        _retrieval_service = retrieval_service
        _gemini_service = gemini_service
        _fact_check_service = fact_check_service

        _hate_speech_service = hate_speech_service

        logger.info("AI services initialized successfully.")

    except Exception:
        logger.exception("Failed to initialize AI services.")

        if gemini_service is not None:
            gemini_service.close()

        raise

def close_services() -> None:
    """
    Đóng các client cần giải phóng tài nguyên khi ứng dụng shutdown.
    """

    global _embedding_service
    global _qdrant_service
    global _retrieval_service
    global _gemini_service
    global _fact_check_service
    global _hate_speech_service

    logger.info("Closing AI services.")

    if _gemini_service is not None:
        _gemini_service.close()

    _fact_check_service = None
    _gemini_service = None
    _retrieval_service = None
    _qdrant_service = None
    _embedding_service = None
    _hate_speech_service = None

    logger.info("AI services closed.")


@router.get("/health")
def health_check() -> dict[str, str]:
    return {"status": "ok", "service": settings.APP_NAME}


@router.post("/fact-check", response_model=FactCheckResponse)
async def fact_check(request: FactCheckRequest) -> FactCheckResponse:
    if _fact_check_service is None:
        raise HTTPException( status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail="AI service is not ready.", )

    try:
        return _fact_check_service.check_post(
            post_id=request.post_id,
            content=request.content,
        )

    except GeminiServiceError as exc:
        logger.exception( "Gemini operation failed. operation=%s", exc.operation,)

        raise HTTPException( status_code=status.HTTP_502_BAD_GATEWAY,detail=("Dịch vụ phân tích và kiểm chứng nội dung " "tạm thời không khả dụng."),) from exc
    
    except RetrievalServiceError as exc:
        logger.exception( "Evidence retrieval failed during fact-check.")

        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=("Dịch vụ truy xuất bằng chứng " "tạm thời không khả dụng." ),) from exc

    except Exception as exc:
        logger.exception("Unexpected fact-check pipeline error.")

        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Đã xảy ra lỗi nội bộ khi kiểm chứng bài viết.",) from exc


@router.post("/hate-speech/detect", response_model=HateSpeechResponse)
def detect_hate_speech(request: HateSpeechRequest)-> HateSpeechResponse:
    if _hate_speech_service is None:
        raise HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail="Hate-speech service is not ready.",)

    return _hate_speech_service.detect(request.text)


@router.post("/retrieval", response_model=RetrievalResponse)
async def retrieve_evidence(request: RetrievalRequest) -> RetrievalResponse:
    
    """
    Endpoint kiểm tra retrieval độc lập.

    Nhận chính xác một trong hai trường:
    - claim;
    - content.
    """
 
    if _embedding_service is None or _qdrant_service is None:
        raise HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail="Service not ready.")

    try:
        query_text = request.get_text()

        results = _retrieval_service.retrieve( query_text )

        return RetrievalResponse( post_id=request.post_id, query_text=query_text, results=results)

    except ValueError as exc:
        raise HTTPException( status_code=status.HTTP_400_BAD_REQUEST, detail=str(exc),) from exc

    except RetrievalServiceError as exc:
        logger.exception("Standalone evidence retrieval failed.")

        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=("Dịch vụ truy xuất bằng chứng tạm thời không khả dụng."),) from exc

    except Exception as exc:
        logger.exception( "Unexpected standalone retrieval error.")

        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Đã xảy ra lỗi nội bộ khi truy xuất bằng chứng.",) from exc




















# dữ liệu đầu vào 

# {
#   "post_id": "post-uuid-2026",
#   "content": "Trần Hưng Đạo lãnh đạo đánh bại quân Nguyên. Sau đó ngài đi du học nhà Tống."
# }


# sau quá trình gọi qwen để trích xuất mệnh đề

# claims = [
#   "Trần Hưng Đạo lãnh đạo đánh bại quân Nguyên.",
#   "Trần Hưng Đạo đi du học nhà Tống."
# ]


# retrival và call llm


# kết quả qdran trả về khi truy vấn 


# kết quả của một claim sau khi gọi qdrant để lấy evidence 
# [
#   {
#     "chunk_id": "019e5656-2ee6-716b-bd8f-3448fe93914d",
#     "score": 0.895623,
#     "book_name": "Đại Việt Sử Ký Toàn Thư",
#     "pages": [198],
#     "text": "Tháng 3, ngày mồng 8, quân Nguyên hội ở sông Bạch Đằng để đón thuyền lương của bọn Trương Văn Hổ nhưng không gặp. Hưng Đạo Vương đánh bại chúng.",
#     "footnotes": {
#       "chapter": "Kỷ Nhà Trần",
#       "volume": 5
#     }
#   },
#   {
#     "chunk_id": "point-id-12345",
#     "score": 0.742119,
#     "book_name": "Việt Sử Toàn Thư",
#     "pages": [193, 194],
#     "text": "Sau hai trận đại thắng ở Chương Dương và Hàm Tử thấy lòng quân phấn chấn, Hưng Đạo Vương hạ lệnh phong tỏa các đường giao thông gắt gao.",
#     "footnotes": null
#   }
# ]


# dữ  liệu đầu vào khi gọi llm lần 2  (gồm nội dung claim và các bằng chứng đã được format lại)

# {Nội dung claim}

# [1] Sách: {book_name_1} | Trang: {pages_1}
# {Nội dung văn bản 1 bị cắt ngắn tối đa theo settings.MAX_EVIDENCE_CHARS}

# [2] Sách: {book_name_2} | Trang: {pages_2}
# {Nội dung văn bản 2 bị cắt ngắn tối đa theo settings.MAX_EVIDENCE_CHARS}



# [1] Sách: Đại Việt Sử Ký Toàn Thư | Trang: 198
# Tháng 3, ngày mồng 8, quân Nguyên hội ở sông Bạch Đằng để đón thuyền lương của bọn Trương Văn Hổ nhưng không gặp. Hưng Đạo Vương đánh bại chúng.

# [2] Sách: Việt Sử Toàn Thư | Trang: 193, 194
# Sau hai trận đại thắng ở Chương Dương và Hàm Tử thấy lòng quân phấn chấn, Hưng Đạo Vương hạ lệnh phong tỏa các đường giao thông gắt gao.



# kết quả llm trả về 
# {
#   "label": "string",       // Nhãn kết quả, chỉ nhận 1 trong 3 giá trị: "SUPPORTED" | "REFUTED" | "NOT_ENOUGH_EVIDENCE"
#   "explanation": "string"  // Đoạn văn ngắn bằng tiếng Việt (tối đa 2 câu) giải thích lý do lựa chọn nhãn dựa trên bằng chứng
# }

# kết quả khi kiểm tra xong một claim

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


# kết quả của một bài post sau khi fact-checking xong

# {
#   "post_id": "string",         // ID của bài viết (có thể là chuỗi UUID nhận từ Spring Boot hoặc null)
#   "quality_score": 0.0,        // float (Điểm chất lượng tổng quan của bài viết, từ 0.0 đến 1.0)
#   "post_label": "string",      // Nhãn tổng: "SUPPORTED" | "REFUTED" | "NOT_ENOUGH_EVIDENCE"
#   "claims": [                  // Mảng chứa danh sách các mệnh đề đã bóc tách và kiểm chứng
#     {
#       "claim": "string",
#       "label": "string",
#       "penalty_score": 0.0,
#       "explanation": "string",
#       "evidence": [            // Mảng các bằng chứng lịch sử tìm được từ Qdrant cho mệnh đề này
#         {
#           "chunk_id": "string",
#           "score": 0.0,
#           "book_name": "string",
#           "pages": [0],
#           "text": "string",
#           "footnotes": {}      // Object hoặc null
#         }
#       ]
#     }, ...
#   ]
# }


# với quality_score =   penalty_score của từng claim * hệ số phạt
# với hệ số phạt là 1.0 cho REFUTED, 0.25 cho NOT_ENOUGH_EVIDENCE, 0.0 cho SUPPORTED









