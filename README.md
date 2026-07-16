# history_social_ai

### Link data: Chỉ có dữ liệu ở thời Trần 
https://drive.google.com/drive/folders/1GpP4klppKGoYbqhqrQkzlKAAgduqDHBe?usp=sharing


## Gồm các quyển:
```
 Đại Việt Sử Ký Toàn Thư 
 Khâm Định Việt Sử Thông Giám Cương Mục 
 Việt Sử Toàn Thư 
 Vương Triều Trần (1226-1400)	
```
## Luồng xử lí 

```
PDF
 ↓
Text extraction
 ↓
Chunking
 ↓
Metadata extraction
 ↓
Embedding
 ↓
Qdrant

```

```
## Cấu trúc thư mục: 
history_social_project/
├── history_social_backend/      # Source code của ứng dụng Backend (Spring boot)
├── history_social_frontend/     # Source code của ứng dụng Frontend (Nextjs)
├── history_social_ai/           # Module xử lý AI
│   ├── data/                
│   │   ├── raw/                 # Chứa các file PDF dữ liệu gốc (chỉ có dữ liệu thời nhà Trần)
│   │   ├── extracted/           # Kết quả từ Colab (pages_data, full_text_data)
│   │   ├── chunks/              # Các file đã được Gemini chunking
│   │   └── final/               # Dữ liệu sau khi word segmented (Underthesea)
│   ├── notebooks/               # Lưu trữ các file .ipynb (Google Colab scripts)  
│   │   ├── pdf_extract/         
│   │   ├── chunking/
│   │   ├── embedding/
│   ├── .env.example          # Template biến môi trường
│   ├── requirements.txt
│   ├── README.md
│   └── src/
|       ├── api
|       │   ├── __init__.py
|       │   └── routes.py
|       ├── prompts
|       │   ├── __init__.py
|       │   └── fact_check_prompt.py
|       ├── schemas
|       │   ├── __init__.py
|       │   ├── fact_check_schema.py
|       │   └── hate_speech_schema.py
|       ├── services
|       │   ├── __init__.py
|       │   ├── embedding_service.py       # text → embedding vector 
|       │   ├── qdrant_service.py          # vector → query Qdrant → danh sách EvidenceItem
|       │   ├── retrieval_service.py       # 
|       │   ├── gemini_service.py          # 
|       │   ├── fact_check_service.py
|       │   └── hate_speech_service.py
|       ├── __init__.py
|       ├── exceptions.py                  # 
|       ├── config.py
|       └── main.py
```

## Link google colab 
### Chuyển các file pdf thành json 
https://colab.research.google.com/drive/1e41enm-Mn0APjCz99GFWckTyziuFpdpW?usp=sharing

### Gọi api của gemini để chunking
https://colab.research.google.com/drive/1lgQ7cwXBN0cFrIYMMRCD9E3uHI9KD7Z6?usp=sharing

# History Social AI Service

FastAPI microservice cung cấp RAG fact-checking cho dự án mạng xã hội lịch sử.

## Kiến trúc tổng quan

```
Spring Boot  ──POST /fact-check──►  FastAPI
                                        │
                              ┌─────────▼──────────┐
                              │   extract_claims    │  (Qwen via Ollama)
                              └─────────┬──────────┘
                                        │ claims[]
                              ┌─────────▼──────────┐
                              │  embed + search     │  (AITeamVN/Vietnamese_Embedding
                              │  Qdrant Cloud       │   + Qdrant Cloud)
                              └─────────┬──────────┘
                                        │ evidence[]
                              ┌─────────▼──────────┐
                              │  fact-check claim   │  (Qwen via Ollama)
                              └─────────┬──────────┘
                                        │ label, explanation
                              ┌─────────▼──────────┐
                              │  aggregate scores   │  (Python)
                              └─────────┬──────────┘
                                        │
                              FactCheckResponse JSON
```

## Cài đặt môi trường

```bash
python -m venv .venv

# Windows
.venv\Scripts\activate

# macOS / Linux
source .venv/bin/activate

pip install -r requirements.txt
```

## Tạo file `.env`

```bash
cp .env.example .env
```

Mở `.env` và điền các giá trị thực:

| Biến | Mô tả |
|------|-------|
| `QDRANT_URL` | URL Qdrant Cloud của bạn |
| `QDRANT_API_KEY` | API key Qdrant Cloud |
| `QDRANT_COLLECTION_NAME` | Tên collection chứa vector lịch sử |
| `OLLAMA_MODEL` | Model Qwen đang chạy trên Ollama |

## Tải model Qwen bằng Ollama

Máy đủ mạnh (≥ 16 GB RAM / GPU):

```bash
ollama pull qwen2.5:7b-instruct
```

Máy yếu hơn:

```bash
ollama pull qwen2.5:3b-instruct
```

Cập nhật `OLLAMA_MODEL` trong `.env` cho phù hợp.

## Khởi động Ollama

```bash
ollama serve
```

Giữ terminal này mở trong suốt quá trình dùng service.

## Chạy FastAPI

```bash
uvicorn src.main:app --reload --host 0.0.0.0 --port 8000
```

## Kiểm tra nhanh

### Health check

```bash
curl http://localhost:8000/health
```

Kết quả mong đợi:

```json
{"status": "ok", "service": "History Social AI Service"}
```

### Fact-check một bài viết

**Linux / macOS:**

```bash
curl -X POST http://localhost:8000/fact-check \
  -H "Content-Type: application/json" \
  -d '{"post_id":"test-001","content":"Trần Hưng Đạo đánh bại quân Nguyên trên sông Bạch Đằng năm 1288."}'
```

**Windows CMD:**

```bat
curl -X POST http://localhost:8000/fact-check ^
  -H "Content-Type: application/json" ^
  -d "{\"post_id\":\"test-001\",\"content\":\"Trần Hưng Đạo đánh bại quân Nguyên trên sông Bạch Đằng.\"}"
```

### Kết quả mẫu

```json
{
  "post_id": "test-001",
  "quality_score": 1.0,
  "post_label": "SUPPORTED",
  "claims": [
    {
      "claim": "Trần Hưng Đạo đánh bại quân Nguyên trên sông Bạch Đằng năm 1288.",
      "label": "SUPPORTED",
      "penalty_score": 0.0,
      "explanation": "Bằng chứng truy xuất xác nhận sự kiện chiến thắng trên sông Bạch Đằng năm 1288.",
      "evidence": [
        {
          "chunk_id": "019e5654-af3f-7af7-a730-e5670e3e6c02",
          "score": 0.83,
          "book_name": "Đại Việt Sử Ký Toàn Thư",
          "pages": [154],
          "text": "...",
          "footnotes": {}
        }
      ]
    }
  ]
}
```


## Nhãn fact-checking

| Nhãn | Ý nghĩa | Penalty |
|------|---------|---------|
| `SUPPORTED` | Bằng chứng ủng hộ trực tiếp | 0.0 |
| `NOT_ENOUGH_EVIDENCE` | Không đủ bằng chứng để kết luận | 0.25 |
| `REFUTED` | Bằng chứng bác bỏ trực tiếp | 1.0 |

`quality_score = 1 - avg(penalty_score)`, clamp về `[0, 1]`.

## Ghi chú

- Embedding **bắt buộc** dùng `sentence-transformers` với `AITeamVN/Vietnamese_Embedding`.  
  Không dùng Ollama để tạo embedding.
- Qwen chỉ được dùng cho: tách claim và gán nhãn từng claim.
- Không có bước Qwen tổng hợp toàn bài.
- API docs tự động: [http://localhost:8000/docs](http://localhost:8000/docs)