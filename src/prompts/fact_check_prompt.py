"""
Prompt builders for the two Qwen inference tasks:
  1. Extracting independent historical claims from a post.
  2. Fact-checking a single claim against retrieved evidence.
"""

from __future__ import annotations

from src.config import settings


def build_claim_extraction_prompt(content: str) -> str:
    """
    Build a prompt that instructs Qwen to split *content* into independent,
    verifiable historical claims.

    Output must be valid JSON only – no markdown, no explanation.

    Args:
        content: The raw post text.

    Returns:
        A fully-formed prompt string ready to send to Ollama.
    """
    return f"""Bạn là chuyên gia phân tích lịch sử Việt Nam.

Nhiệm vụ: Đọc bài viết dưới đây và trích xuất các mệnh đề lịch sử độc lập, ngắn gọn, có thể kiểm chứng được.

Quy tắc:
- Chỉ trích xuất các mệnh đề lịch sử cụ thể (sự kiện, nhân vật, thời điểm, địa điểm lịch sử).
- Không trích xuất ý kiến cá nhân, cảm xúc, nhận xét chủ quan.
- Không trích xuất câu hỏi hay câu cảm thán.
- Mỗi claim phải ngắn gọn, độc lập, không phụ thuộc vào claim khác.
- Tối đa {settings.MAX_CLAIMS_PER_POST} claim.
- Nếu bài viết không có mệnh đề lịch sử rõ ràng, trả về danh sách rỗng.
- Trả lời hoàn toàn bằng tiếng Việt.
- Chỉ trả về JSON hợp lệ, không giải thích, không dùng markdown.

Schema JSON đầu ra:
{{
  "claims": [
    "claim 1",
    "claim 2"
  ]
}}

Bài viết:
{content}"""


def build_fact_check_prompt(claim: str, evidence_text: str) -> str:
    """
    Build a prompt that instructs Qwen to evaluate *claim* against *evidence_text*
    and return a structured label + explanation.

    Valid labels: SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE
    Output must be valid JSON only – no markdown, no explanation outside JSON.

    Args:
        claim:         The historical claim to evaluate.
        evidence_text: Pre-formatted evidence passages retrieved from Qdrant.

    Returns:
        A fully-formed prompt string ready to send to Ollama.
    """
    return f"""Bạn là chuyên gia kiểm chứng lịch sử Việt Nam. Nhiệm vụ của bạn là đọc BẰNG CHỨNG và quyết định nhãn cho MỆNH ĐỀ.

MỆNH ĐỀ CẦN KIỂM CHỨNG:
{claim}

BẰNG CHỨNG TỪ SỬ LIỆU:
{evidence_text}

HƯỚNG DẪN CHỌN NHÃN — đọc theo thứ tự:

Bước 1: Bằng chứng có nhắc đến cùng sự kiện / nhân vật / địa điểm trong mệnh đề không?
  → Nếu KHÔNG → nhãn: NOT_ENOUGH_EVIDENCE

Bước 2: Nội dung bằng chứng có khớp với mệnh đề không?
  → Nếu KHỚP (cùng sự kiện, cùng kết quả) → nhãn: SUPPORTED
  → Nếu MÂU THUẪN rõ ràng (sai địa điểm, sai kết quả, sai nhân vật) → nhãn: REFUTED
  → Nếu không đủ chi tiết để kết luận → nhãn: NOT_ENOUGH_EVIDENCE

Lưu ý:
- Bằng chứng không cần phải dùng từ ngữ giống hệt mệnh đề — chỉ cần nội dung phù hợp.
- Chỉ trả REFUTED khi bằng chứng bác bỏ rõ ràng, có căn cứ cụ thể.
- Giải thích tối đa 2 câu bằng tiếng Việt, nêu rõ bằng chứng nào dẫn đến quyết định.
- Chỉ trả về JSON hợp lệ, không giải thích ngoài JSON, không dùng markdown.

{{
  "label": "SUPPORTED",
  "explanation": "..."
}}"""