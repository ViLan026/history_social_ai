from __future__ import annotations

from src.config import settings

def build_claim_extraction_prompt(content: str) -> str:
    return f"""
Bạn là bộ trích xuất claim lịch sử cho hệ thống hỗ trợ fact-checking.

Ở bước này, bạn KHÔNG xác định claim đúng hay sai.
Bạn chỉ trích xuất các phát biểu lịch sử có thể dùng làm đơn vị kiểm chứng ở bước sau.

CHỈ trả về một block JSON hợp lệ duy nhất.
KHÔNG markdown.
KHÔNG giải thích ngoài JSON.
KHÔNG thêm bất kỳ văn bản nào ngoài JSON.

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
"Nhà Trần là một trong những triều đại phát triển rực rỡ nhất trong lịch sử Việt Nam. Từ năm 1248, vua Trần Thái Tông đặt ra chức quan Hà đê sứ chuyên trách việc đắp đê điều ở các lộ."

Output JSON:
{{
  "claims": [
    "Từ năm 1248, vua Trần Thái Tông đặt ra chức quan Hà đê sứ.",
    "Chức quan Hà đê sứ chuyên trách việc đắp đê điều ở các lộ."
  ]
}}

VÍ DỤ 3:
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
KHÔNG markdown.
KHÔNG giải thích ngoài JSON.
CHỈ trả về một JSON hợp lệ duy nhất.

CLAIM:
{claim}

EVIDENCE:
{evidence_text}

NHIỆM VỤ:
Gán đúng một trong ba nhãn:
SUPPORTED, REFUTED, NOT_ENOUGH_EVIDENCE.

NGUYÊN TẮC QUAN TRỌNG NHẤT:
Hãy kiểm chứng Ý CHÍNH của claim, không kiểm chứng từng chữ một cách máy móc.
Explanation bắt buộc viết bằng tiếng Việt.
Không dịch tên riêng.
Không thay đổi thực thể trong claim.
Không dùng tiếng Trung, tiếng Anh hoặc Hán tự.

Ý chính thường gồm:
- chủ thể chính;
- hành động chính;
- đối tượng chính;
- kết quả chính;
- thời gian hoặc địa điểm nếu claim nhấn mạnh.

CÁCH CHỌN NHÃN:

1. SUPPORTED
Chọn SUPPORTED nếu evidence xác nhận trực tiếp ý chính của claim.
Evidence không cần giống từng chữ, nhưng phải cùng ý nghĩa lịch sử với claim.

2. REFUTED
Chọn REFUTED nếu evidence phản bác ý chính của claim.

Phải chọn REFUTED khi:
- Claim nói một bên thắng, áp đảo, đầu hàng, chạy trốn, bị đánh bại hoặc đạt kết quả X,
  nhưng evidence cho thấy kết quả ngược lại.
- Claim nói một nhân vật/lực lượng làm hành động A,
  nhưng evidence cho thấy nhân vật/lực lượng đó làm hành động khác không thể cùng đúng với A.
- Claim gán vai trò sai cho một nhân vật/lực lượng,
  trong khi evidence mô tả vai trò khác.
- Claim nói một sự kiện xảy ra ở thời gian hoặc địa điểm cụ thể,
  nhưng evidence cho thấy thời gian hoặc địa điểm khác.

Evidence KHÔNG cần có từ phủ định như "không", "chưa", "không phải" mới được chọn REFUTED.
Nếu evidence mô tả diễn biến hoặc kết quả không thể cùng đúng với claim, chọn REFUTED.

3. NOT_ENOUGH_EVIDENCE
Chọn NOT_ENOUGH_EVIDENCE nếu evidence:
- không nói đến ý chính của claim;
- chỉ cùng chủ đề nhưng không xác nhận hoặc phản bác claim;
- chỉ liên quan gián tiếp;
- thiếu thông tin để kết luận;
- không đủ để xác nhận hay phản bác ý chính của claim.

QUY TẮC ƯU TIÊN:
- Nếu evidence phản bác ý chính của claim, chọn REFUTED.
- Không chọn NOT_ENOUGH_EVIDENCE chỉ vì evidence không nhắc lại mọi chi tiết phụ của claim.
- Nếu claim có nhiều chi tiết, nhưng evidence phản bác một chi tiết trung tâm làm claim không thể đúng, chọn REFUTED.
- Nếu evidence chỉ thiếu chi tiết và không phản bác ý chính, chọn NOT_ENOUGH_EVIDENCE.
- Nếu phân vân giữa REFUTED và NOT_ENOUGH_EVIDENCE, hỏi: "Evidence có mô tả kết quả/hành động ngược với claim không?"
  Nếu có, chọn REFUTED.
  Nếu không, chọn NOT_ENOUGH_EVIDENCE.

VÍ DỤ 1:
Claim:
"Trương Văn Hổ áp đảo quân Đại Việt trong cuộc kháng chiến lần thứ ba."

Evidence:
"Trương Văn Hổ đại bại, đổ lương thực xuống biển rồi trốn chạy về Quỳnh Châu. Quân Đại Việt toàn thắng."

Output:
{{
  "label": "REFUTED",
  "explanation": "Bằng chứng cho thấy Trương Văn Hổ đại bại và quân Đại Việt toàn thắng, mâu thuẫn với claim rằng Trương Văn Hổ áp đảo Đại Việt."
}}

VÍ DỤ 2:
Claim:
"Trần Hưng Đạo đầu hàng quân Nguyên trên sông Bạch Đằng."

Evidence:
"Hưng Đạo vương đánh bại quân Nguyên ở sông Bạch Đằng."

Output:
{{
  "label": "REFUTED",
  "explanation": "Bằng chứng cho thấy Hưng Đạo vương đánh bại quân Nguyên ở sông Bạch Đằng, mâu thuẫn với claim rằng Trần Hưng Đạo đầu hàng quân Nguyên."
}}

VÍ DỤ 3:
Claim:
"Trần Duệ Tông đi sứ sang nhà Minh."

Evidence:
"Trần Duệ Tông là vua nhà Trần. Nhà Minh được thành lập năm 1368."

Output:
{{
  "label": "NOT_ENOUGH_EVIDENCE",
  "explanation": "Bằng chứng chỉ cung cấp thông tin liên quan đến Trần Duệ Tông và nhà Minh, nhưng không xác nhận hoặc phản bác việc Trần Duệ Tông đi sứ sang nhà Minh."
}}

ĐỊNH DẠNG OUTPUT:
{{
  "label": "SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE",
  "explanation": "..."
}}
"""