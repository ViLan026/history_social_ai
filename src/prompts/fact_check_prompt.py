from __future__ import annotations

from src.config import settings


def build_claim_extraction_prompt(content: str) -> str:
    return f"""
Bạn là bộ trích xuất Check-worthy Claims cho hệ thống hỗ trợ kiểm chứng lịch sử Việt Nam.

NHIỆM VỤ:
Đọc bài viết lịch sử và trích xuất các claim lịch sử quan trọng, rõ ràng, có giá trị kiểm chứng cao.

Mục tiêu KHÔNG phải là chấm điểm bài viết.
Mục tiêu là tìm ra các claim lịch sử cần được kiểm chứng để hệ thống có thể tìm bằng chứng và giải thích cho người đọc.

CHỈ trả về một JSON hợp lệ duy nhất.
KHÔNG markdown.
KHÔNG giải thích ngoài JSON.

ĐỊNH NGHĨA CLAIM ĐƯỢC CHỌN:
Một claim được chọn phải thỏa các điều kiện sau:
1. Là phát biểu lịch sử có thể kiểm chứng bằng sử liệu.
2. Có thực thể lịch sử cụ thể như tên người, triều đại, địa danh, sự kiện, chức vụ hoặc mốc thời gian.
3. Chứa một hành động, sự kiện, quan hệ, thời gian, địa điểm, nguyên nhân trực tiếp hoặc kết quả trực tiếp.
4. Nếu claim sai, nó có thể làm sai lệch một sự kiện, nhân vật, quan hệ hoặc mốc lịch sử cụ thể.
5. Claim phải được rút ra trực tiếp từ bài viết, không thêm kiến thức ngoài bài viết.

QUY TẮC ATOMIC FACT:
- Mỗi claim chỉ chứa MỘT thông tin chính.
- Nếu một câu có nhiều thông tin kiểm chứng được, hãy tách thành nhiều claim độc lập.
- Không gộp nhiều sự kiện vào một claim.

QUY TẮC ĐỘC LẬP NGỮ CẢNH:
- Mỗi claim phải là câu hoàn chỉnh, có thể hiểu khi đứng một mình.
- Không dùng đại từ hoặc cụm mơ hồ như: ông ấy, bà ấy, nhân vật này, sự kiện này, triều đại này, lúc bấy giờ.
- Chỉ thay đại từ bằng thực thể cụ thể nếu thực thể đó xuất hiện rõ trong bài viết.
- Không tự thêm năm, địa điểm, nhân vật, chức vụ hoặc kết quả nếu bài viết không nhắc đến.

QUY TẮC VỀ CÂU HỎI, LỜI ĐỒN VÀ NGHI VẤN:
Vẫn trích xuất claim nếu bài viết nêu thông tin dưới dạng:
- Nghe nói...
- Có người cho rằng...
- Theo một số tài liệu...
- Theo lời đồn...
- Tôi đọc được rằng...
- Tôi tự hỏi liệu...
- Có đúng là...
- Phải chăng...

Miễn là phía sau có một phát biểu lịch sử cụ thể có thể kiểm chứng. nhưng phải loại bỏ phần dẫn nhập và chỉ giữ mệnh đề lịch sử cốt lõi.


Ví dụ:
"Nghe nói Trần Duệ Tông đi sứ sang nhà Minh."
=> Trích xuất:
"Trần Duệ Tông đi sứ sang nhà Minh."

QUY TẮC BẮT BUỘC KHI CHUẨN HÓA CLAIM:
- Claim đầu ra KHÔNG được bắt đầu bằng các cụm: "Tôi đọc được", "Nghe nói", "Có người cho rằng", "Theo một số tài liệu", "Theo lời đồn", "Tôi tự hỏi liệu", "Có đúng là", "Phải chăng".
- Luôn loại bỏ phần dẫn nhập và chỉ giữ mệnh đề lịch sử cốt lõi.
- Nếu bài viết là một câu khẳng định lịch sử ngắn, rõ ràng, có nhân vật và hành động cụ thể, PHẢI trích xuất claim đó.

Ví dụ:
Input: "Tôi đọc được một vài tài liệu cũ nói về việc vua Trần Duệ Tông đi sứ sang nhà Minh."
Output claim: "Trần Duệ Tông đi sứ sang nhà Minh."

Input: "Trần Hưng Đạo đánh bại quân Nguyên trên sông Bạch Đằng."
Output claim: "Trần Hưng Đạo đánh bại quân Nguyên trên sông Bạch Đằng."

ƯU TIÊN TRÍCH XUẤT:
1. Claim có mốc thời gian cụ thể.
2. Claim có nhân vật lịch sử và hành động cụ thể.
3. Claim có sự kiện lịch sử cụ thể.
4. Claim có quan hệ giữa các nhân vật, triều đại hoặc lực lượng.
5. Claim có nguyên nhân trực tiếp hoặc kết quả trực tiếp của một sự kiện.
6. Claim có địa điểm cụ thể.
7. Claim có thể đưa trực tiếp vào truy vấn RAG để tìm bằng chứng.

KHÔNG TRÍCH XUẤT:
- Cảm xúc.
- Câu hỏi tu từ không chứa phát biểu lịch sử cụ thể.
- Nhận xét chủ quan.
- Đánh giá đạo đức.
- Suy luận lịch sử.
- Kết luận mang tính diễn giải.
- Xu hướng chung không có sự kiện cụ thể.
- Claim quá tổng quát.
- Claim nền.
- Claim mô tả tình trạng chung nhưng không có thực thể, hành động hoặc mốc kiểm chứng rõ ràng.

CẤM TẠO CLAIM DẠNG:
- "Sự suy yếu của chính quyền trung ương bắt nguồn từ nhiều yếu tố."
- "Triều đình dần mất ổn định."
- "Triều đình trở nên rối ren."
- "Nhà Lý suy yếu."
- "Một thế lực mới xuất hiện."
- "Đây là hệ quả tất yếu."
- "Đây là bước ngoặt lịch sử."
- "X là nhân vật lịch sử."
- "X là vua triều Y."
- "X là người tài giỏi."
- "X là người xấu."

Chỉ giữ claim nền nếu chính thông tin đó là trọng tâm cần kiểm chứng của bài viết.

QUY TẮC CHỌN CLAIM:
- Không cần trích xuất hết mọi thông tin factual.
- Chỉ chọn các claim có giá trị fact-checking cao nhất.
- Tối đa {settings.MAX_CLAIMS_PER_POST} claim.
- Chỉ trả về danh sách rỗng khi bài viết không có bất kỳ phát biểu lịch sử cụ thể nào có thể kiểm chứng.
- Không ép phải đủ số lượng claim.

KIỂM TRA TRƯỚC KHI GIỮ CLAIM:
Chỉ giữ claim nếu trả lời CÓ cho cả 4 câu sau:
1. Claim có nhân vật, sự kiện, thời gian, địa điểm, chức vụ, quan hệ hoặc hành động cụ thể không?
2. Claim có thể được kiểm chứng bằng sử liệu không?
3. Claim có thể đưa trực tiếp vào truy vấn RAG để tìm bằng chứng không?
4. Claim có tránh được các cụm mơ hồ như “suy yếu”, “rối ren”, “nhiều yếu tố”, “sự chuyển dịch”, “tất yếu”, “mạnh mẽ”, “huy hoàng” không?

VÍ DỤ 1:
Văn bản:
"Sau khi lên ngôi năm 980, Lê Hoàn đã lãnh đạo đánh bại quân Tống tại Chi Lăng. Ông là một vị vua vô cùng kiệt xuất."

Output:
{{
  "claims": [
    "Lê Hoàn lên ngôi vào năm 980.",
    "Lê Hoàn lãnh đạo đánh bại quân Tống tại Chi Lăng."
  ]
}}

VÍ DỤ 2:
Văn bản:
"Khi nghiên cứu về quá trình chuyển giao từ triều Lý sang triều Trần, Lý Chiêu Hoàng nhường ngôi cho Trần Cảnh vào năm 1225. Việc Tô Trung Từ nắm quyền rồi bị sát hại cũng được nhắc đến như một biến động chính trị."

Output:
{{
  "claims": [
    "Lý Chiêu Hoàng nhường ngôi cho Trần Cảnh vào năm 1225.",
    "Tô Trung Từ từng nắm quyền trong triều đình nhà Lý.",
    "Tô Trung Từ bị sát hại."
  ]
}}

VÍ DỤ 3:
Văn bản:
"Triều đình suy yếu, lòng dân bất ổn, và một sự thay thế tất yếu của lịch sử bắt đầu xuất hiện."

Output:
{{
  "claims": []
}}

VÍ DỤ 4:
Văn bản:
"Nghe nói Trần Duệ Tông đích thân đi sứ sang nhà Minh để bàn việc tiến cống."

Output:
{{
  "claims": [
    "Trần Duệ Tông đích thân đi sứ sang nhà Minh để bàn việc tiến cống."
  ]
}}

BÀI VIẾT CẦN XỬ LÝ:
\"\"\"{content}\"\"\"

Output JSON:
{{
  "claims": []
}}
"""


def build_fact_check_prompt(claim: str, evidence_text: str) -> str:
    return f"""
Bạn là chuyên gia hỗ trợ kiểm chứng lịch sử Việt Nam.

NHIỆM VỤ:
Đọc MỆNH ĐỀ và BẰNG CHỨNG được truy xuất từ sử liệu.
Sau đó xác định mệnh đề thuộc một trong ba nhãn:
SUPPORTED, REFUTED, NOT_ENOUGH_EVIDENCE.

CHỈ trả về một JSON hợp lệ duy nhất.
KHÔNG markdown.
KHÔNG giải thích ngoài JSON.

MỆNH ĐỀ CẦN KIỂM CHỨNG:
{claim}

BẰNG CHỨNG TỪ SỬ LIỆU:
{evidence_text}

CÁCH CHỌN NHÃN:

1. SUPPORTED
Chọn SUPPORTED nếu bằng chứng xác nhận nội dung chính của mệnh đề.
Bằng chứng không cần dùng đúng từng chữ giống mệnh đề, chỉ cần cùng ý nghĩa lịch sử.

2. REFUTED
Chọn REFUTED nếu bằng chứng mâu thuẫn rõ ràng với mệnh đề.
Ví dụ mâu thuẫn về:
- nhân vật
- thời gian
- địa điểm
- hành động
- kết quả sự kiện
- quan hệ giữa các thực thể

3. NOT_ENOUGH_EVIDENCE
Chọn NOT_ENOUGH_EVIDENCE nếu:
- Bằng chứng không nhắc đến cùng sự kiện hoặc nhân vật trong mệnh đề.
- Bằng chứng chỉ liên quan gián tiếp.
- Bằng chứng thiếu chi tiết quan trọng.
- Bằng chứng không đủ để xác nhận hoặc bác bỏ mệnh đề.

QUY TẮC QUAN TRỌNG:
- Chỉ dựa vào BẰNG CHỨNG được cung cấp.
- Không dùng kiến thức bên ngoài nếu bằng chứng không nêu.
- Không suy diễn nhiều bước.
- Chỉ chọn REFUTED khi bằng chứng bác bỏ rõ ràng.
- Nếu phân vân giữa REFUTED và NOT_ENOUGH_EVIDENCE, chọn NOT_ENOUGH_EVIDENCE.
- Nếu phân vân giữa SUPPORTED và NOT_ENOUGH_EVIDENCE, chọn NOT_ENOUGH_EVIDENCE.
- Explanation phải ngắn, rõ, tối đa 2 câu.
- Explanation cần cho người đọc biết vì sao claim được hỗ trợ, bị bác bỏ hoặc chưa đủ bằng chứng.
- Không được xem "vua sai sứ", "vua cử sứ đoàn", "vua phái sứ đoàn" là bằng chứng cho claim "vua đích thân đi sứ" hoặc "vua đích thân dẫn đầu sứ đoàn".
- SUPPORTED chỉ khi bằng chứng xác nhận trực tiếp chủ thể, hành động chính và đối tượng chính của mệnh đề.
- Nếu bằng chứng chỉ nói người khác được vua sai đi, còn claim nói nhà vua đích thân đi, chọn NOT_ENOUGH_EVIDENCE.
ĐỊNH DẠNG OUTPUT:
{{
  "label": "SUPPORTED | REFUTED | NOT_ENOUGH_EVIDENCE",
  "explanation": "..."
}}
"""