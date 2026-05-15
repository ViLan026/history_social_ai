# history_social_ai

### Link data: Chỉ có dữ liệu ở thời Trần 
https://drive.google.com/drive/folders/1GpP4klppKGoYbqhqrQkzlKAAgduqDHBe?usp=sharing


## Gồm cái quyển:
### Các quyển sách 
### Đại Việt Sử Ký Toàn Thư 
### Khâm Định Việt Sử Thông Giám Cương Mục 
### Việt Sử Toàn Thư 
### Việt Nam sử lược 
### Vương Triều Trần (1226-1400)	

## Luồng xử lí
PDF
 ↓
Text extraction
 ↓
Chunking
 ↓
Word segmentation
 ↓
Metadata extraction
 ↓
Embedding
 ↓
Qdrant

--------------------------------

Post
 ↓
Chunking
 ↓
Embedding
 ↓
Retrieve top-k evidence
 ↓
Cross-encoder reranker
 ↓
LLM verification
 ↓
Fact-check result


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
│   ├── src/                     # Source code Python xử lý logic
│   │   ├── processor/           # Tách từ, xử lý text (Underthesea)
│   │   ├── embedding/           # Tokenizer & Embedding model 
│   │   ├── vectorstore/
│   │   │   ├── qdrant/
│   │   │   └── payload/
│   │   ├── rag/
│   │   │   ├── retrieval/
│   │   │   ├── reranking/
│   │   │   ├── prompting/
│   │   │   └── generation/
│   ├── requirements.txt         # Các thư viện cần thiết (underthesea, qdrant-client...)
│   └── main.py                  # File chạy chính để thực thi luồng AI
└── .env                         # Lưu API Key (Gemini, Qdrant, ...)


## Link google colab 
### Chuyển các file pdf thành json 
https://colab.research.google.com/drive/1e41enm-Mn0APjCz99GFWckTyziuFpdpW?usp=sharing

### Gọi api của gemini để chunking

