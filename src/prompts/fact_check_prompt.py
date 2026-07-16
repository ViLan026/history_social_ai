from __future__ import annotations

from src.config import settings

def build_claim_extraction_prompt(content: str) -> str:
    return f"""
Bạn là bộ trích xuất claim lịch sử cho hệ thống hỗ trợ fact-checking.

Ở bước này, bạn KHÔNG xác định claim đúng hay sai.
Bạn chỉ trích xuất các phát biểu lịch sử có thể dùng làm đơn vị kiểm chứng ở bước sau.


NHIỆM VỤ:
Trích xuất các claim lịch sử từ bài viết dưới dạng danh sách các câu khẳng định độc lập trong JSON có key là "claims".

ĐỊNH NGHĨA CLAIM:
Claim là một phát biểu độc lập, tự đủ ngữ cảnh, chỉ chứa một nội dung kiểm chứng chính, và có thể đối chiếu với sử liệu.

TÍNH CHẤT BẮT BUỘC CỦA CLAIM:

1. Atomic Fact:
Mỗi claim chỉ chứa MỘT thông tin kiểm chứng chính.
Nếu một câu trong bài viết chứa nhiều thông tin kiểm chứng, hãy tách thành nhiều claim độc lập.

2. Decontextualized & Independent:
Mỗi claim phải là một câu hoàn chỉnh, có thể hiểu khi đứng một mình.
Không dùng đại từ hoặc cụm mơ hồ như "ông ấy", "bà ta", "ngài", "sự kiện này", "trận chiến đó", "triều đại này", "lúc bấy giờ".
Hãy thay bằng tên thực thể cụ thể có sẵn trong bài viết.
Nếu không xác định được đại từ chỉ ai, bỏ mệnh đề đó.

3. Verifiable:
Claim phải là phát biểu có thể đối chiếu với bằng chứng lịch sử.
Sau khi truy xuất sử liệu, claim có thể được hỗ trợ, bị phản bác hoặc chưa đủ bằng chứng.
Không giữ các câu chỉ thể hiện cảm xúc, nhận xét cá nhân, đánh giá chủ quan hoặc so sánh không có tiêu chí kiểm chứng rõ.

4. Faithful:
Claim phải được rút ra trực tiếp từ bài viết.
Không dùng kiến thức lịch sử sẵn có để thêm nhân vật, năm, địa điểm, chức vụ, nguyên nhân hoặc kết quả nếu bài viết không nêu.

ƯU TIÊN TRÍCH XUẤT CÁC CLAIM CÓ:
- Mốc thời gian hoặc địa điểm cụ thể.
- Nhân vật, triều đại, lực lượng hoặc địa danh rõ ràng.
- Hành động hoặc sự kiện lịch sử cụ thể.
- Chức vụ, vai trò, quan hệ giữa các thực thể.
- Lời nói, quan điểm, ghi chép hoặc mệnh lệnh được quy rõ cho một nhân vật hoặc nguồn tư liệu.
- Nguyên nhân hoặc kết quả trực tiếp của một sự kiện, nếu bài viết nêu rõ.

KHÔNG TRÍCH XUẤT:
- Cảm xúc cá nhân.
- Câu hỏi tu từ.
- Nhận xét chủ quan không có tiêu chí kiểm chứng rõ.
- Câu đánh giá hoặc xếp hạng như "vĩ đại nhất", "rực rỡ nhất", "hào hùng nhất", "kiệt xuất nhất".
- Câu diễn giải tổng quát như "đây là bước ngoặt lịch sử", "đây là hệ quả tất yếu", "triều đình suy yếu", "xã hội rối ren" nếu không có sự kiện cụ thể.
- Claim nền tự chế như "X là nhân vật lịch sử", trừ khi bài viết trực tiếp nêu điều đó.

QUY TẮC XỬ LÝ:
1. Nếu câu có cả phần kiểm chứng được và phần chủ quan, chỉ giữ phần kiểm chứng được.
2. Nếu câu có nhiều thông tin kiểm chứng, tách thành nhiều claim.
3. Nếu câu có cụm dẫn nhập như "nghe nói", "có người cho rằng", "theo tài liệu", "tôi đọc được rằng", hãy bỏ phần dẫn nhập và giữ mệnh đề lịch sử cốt lõi.
4. Không tự suy diễn, không khái quát hóa.
5. Giữ thứ tự xuất hiện trong bài.
6. Không lặp lại claim.
7. Tối đa {settings.MAX_CLAIMS_PER_POST} claim.
8. Chỉ trả về {{"claims":[]}} khi bài viết thật sự không có phát biểu lịch sử cụ thể nào có thể kiểm chứng.

VÍ DỤ 1:
Văn bản gốc:
"Sau khi lên ngôi năm 980, Lê Hoàn đã lãnh đạo đánh bại quân Tống tại Chi Lăng. Ông là một vị vua vô cùng kiệt xuất."

Output JSON:
{{
  "claims": [
    "Lê Hoàn lên ngôi vào năm 980.",
    "Lê Hoàn lãnh đạo đánh bại quân Tống tại Chi Lăng."
  ]
}}

VÍ DỤ 2:
Văn bản gốc:
"Về quân sự, nhà Trần gắn liền với tên tuổi của Hưng Đạo Vương Trần Quốc Tuấn, người đã lãnh đạo quân dân Đại Việt chống quân Nguyên Mông. Theo tôi, đây là một trong những giai đoạn hào hùng nhất của lịch sử dân tộc."

Output JSON:
{{
  "claims": [
    "Hưng Đạo Vương Trần Quốc Tuấn lãnh đạo quân dân Đại Việt chống quân Nguyên Mông."
  ]
}}

BÀI VIẾT CẦN XỬ LÝ:
\"\"\"{content}\"\"\"

Output JSON:
"""





def build_fact_check_prompt(claim: str, evidence_text: str) -> str:
    return f"""
Bạn là bộ kiểm chứng claim lịch sử bằng evidence được cung cấp.

CHỈ dùng evidence bên dưới.
KHÔNG dùng kiến thức ngoài evidence.
KHÔNG suy luận xa.
CHỈ trả về một JSON hợp lệ duy nhất.
KHÔNG markdown.
KHÔNG giải thích ngoài JSON.

CLAIM:
{claim}

EVIDENCE:
{evidence_text}

NHIỆM VỤ:
Gán đúng một trong ba nhãn:
SUPPORTED, REFUTED, NOT_ENOUGH_EVIDENCE.

CÁCH CHỌN NHÃN:

1. SUPPORTED
Chọn SUPPORTED chỉ khi evidence xác nhận trực tiếp nội dung chính của claim.
Evidence phải khớp với chủ thể chính, hành động hoặc quan hệ chính, và chi tiết quan trọng trong claim.
Evidence không cần giống từng chữ, nhưng phải cùng ý nghĩa lịch sử.

2. REFUTED
Chọn REFUTED chỉ khi evidence mâu thuẫn trực tiếp với nội dung chính của claim.
Mâu thuẫn có thể nằm ở nhân vật, thời gian, địa điểm, hành động, kết quả hoặc quan hệ giữa các thực thể.

3. NOT_ENOUGH_EVIDENCE
Chọn NOT_ENOUGH_EVIDENCE nếu evidence:
- không nhắc đến nội dung chính của claim;
- chỉ cùng chủ đề nhưng không xác nhận claim;
- chỉ liên quan gián tiếp;
- thiếu chi tiết quan trọng;
- không đủ để xác nhận hoặc bác bỏ claim;
- claim chứa đánh giá chủ quan hoặc so sánh không có tiêu chí rõ.

QUY TẮC QUAN TRỌNG:
- Evidence cùng nhân vật, cùng triều đại hoặc cùng sự kiện chưa đủ để chọn SUPPORTED.
- Chỉ chọn SUPPORTED khi evidence xác nhận trực tiếp claim.
- Chỉ chọn REFUTED khi evidence bác bỏ trực tiếp claim.
- Nếu phân vân, chọn NOT_ENOUGH_EVIDENCE.
- Không biến thông tin liên quan thành bằng chứng xác nhận.
- Explanation tối đa 2 câu, nói rõ vì sao evidence hỗ trợ, phản bác hoặc chưa đủ.

CÁCH VIẾT EXPLANATION:

Explanation được hiển thị trực tiếp cho người dùng.

BẮT BUỘC:
- Viết bằng tiếng Việt tự nhiên, tối đa 2 câu.
- Đi thẳng vào nội dung lịch sử đang được kiểm chứng.
- Không mô tả quá trình kiểm chứng.
- Không nói rằng hệ thống đã đọc, tìm thấy, đối chiếu hoặc xác nhận điều gì.

CÁCH DIỄN ĐẠT:

- Nếu SUPPORTED:
  Nêu lại ngắn gọn thông tin lịch sử phù hợp, sau đó kết luận:
  "Nội dung này phù hợp với bài viết."

- Nếu REFUTED:
  Nêu thông tin lịch sử khác với bài viết, sau đó chỉ rõ điểm sai:
  "Vì vậy, nội dung ... trong bài viết không phù hợp."

- Nếu NOT_ENOUGH_EVIDENCE:
  Nêu rõ thông tin nào chưa được xác định:
  "Chưa có đủ thông tin để xác nhận hoặc bác bỏ việc ..."

Không giải thích bằng thuật ngữ kỹ thuật.
Không nhắc đến cách hệ thống đưa ra nhãn.

ĐỊNH DẠNG OUTPUT:
{{
  "label": "SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE",
  "explanation": "..."
}}
"""
