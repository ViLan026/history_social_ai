from fastapi import APIRouter, HTTPException

from src.schemas.hate_speech_schema import HateSpeechRequest, HateSpeechResponse
from src.config import settings
from src.schemas.fact_check_schema import FactCheckRequest, FactCheckResponse
from src.services.embedding_service import EmbeddingService
from src.services.qdrant_service import QdrantService
from src.services.fact_check_service import FactCheckService
from src.services.hate_speech_service import HateSpeechService

router = APIRouter()

_embedding_service = None
_qdrant_service = None
_fact_check_service = None
_hate_speech_service = None


def init_services():
    global _embedding_service, _qdrant_service, _fact_check_service, _hate_speech_service

    _embedding_service = EmbeddingService()
    _qdrant_service = QdrantService()
    _fact_check_service = FactCheckService(_embedding_service, _qdrant_service)
    _hate_speech_service = HateSpeechService()


@router.get("/health")
async def health_check():
    return {"status": "ok", "service": settings.APP_NAME}


@router.post("/fact-check", response_model=FactCheckResponse)
async def fact_check(request: FactCheckRequest):
    if _fact_check_service is None:
        raise HTTPException(status_code=503, detail="Service not ready.")

    return _fact_check_service.check_post(
        post_id=request.post_id,
        content=request.content,
    )


@router.post("/hate-speech/detect", response_model=HateSpeechResponse)
def detect_hate_speech(request: HateSpeechRequest):
    if _hate_speech_service is None:
        raise HTTPException(status_code=503, detail="Service not ready.")

    return _hate_speech_service.detect(request.text)
























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