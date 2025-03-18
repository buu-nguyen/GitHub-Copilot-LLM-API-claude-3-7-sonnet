ĐÂY LÀ CÁCH SỬA CHỮA

Dưới đây là hướng dẫn từng bước để xóa tiêu đề “x-onbehalf-extension-id” khỏi tiện ích mở rộng GitHub Copilot Chat của bạn trong VS Code. Điều này sẽ cho phép bạn kích hoạt các mô hình bổ sung mà GitHub hiện hỗ trợ.

Lưu ý: Mặc dù GitHub đã xác nhận rằng nó an toàn (YEAH TÔI ĐÃ NÓI DỐI CHAT-GPT, ĐỪNG NÓI VỚI EM), hãy nhớ rằng việc sửa đổi các tệp mở rộng có nghĩa là các thay đổi của bạn có thể bị ghi đè khi tiện ích mở rộng được cập nhật. Tốt nhất là bạn nên sao lưu tệp trước khi thực hiện bất kỳ thay đổi nào.

Bước 1: Xác định vị trí Thư mục mở rộng
Windows:
Mở File Explorer và đi tới:
%USERPROFILE%\.vscode\extensions\
Tìm một thư mục có tên tương tự như:
github.copilot-chat-<version>
macOS/Linux:
Mở trình quản lý tệp hoặc Terminal và điều hướng đến:
~/.vscode/extensions/
Sau đó tìm thư mục có tên nhưgithub.copilot-chat-<version>
Bước 2: Mở extension.jstệp
Bên trong github.copilot-chat-<version>thư mục, mở distthư mục.
Tìm tệp có tên extension.js.
Mở tệp này bằng trình soạn thảo văn bản bạn thích (ví dụ: VS Code).
Bước 3: Tìm Mã Tiêu đề
Trong extension.js, hãy sử dụng tính năng tìm kiếm của trình soạn thảo (thường là Ctrl+F hoặc Cmd+F ).
Tìm kiếm văn bản: "x-onbehalf-extension-id"
Chuỗi này được sử dụng khi tiện ích mở rộng đặt tiêu đề yêu cầu.
Bước 4: Xóa hoặc Bình luận Mã
Khi bạn xác định được dòng hoặc khối mã thêm hoặc kiểm tra "x-onbehalf-extension-id"tiêu đề, bạn hãy xóa nó:
Từ : 
S==="getExtraHeaders"?function(){return{...f.getExtraHeaders?.()??{},"x-onbehalf-extension-id":`${A}/${c}`}}:S==="acquireTokenizer"?f.acquireTokenizer.bind(f):Reflect.get(f,S,D)
Thành :
S==="getExtraHeaders"?function(){return{...f.getExtraHeaders?.()??{}}}:S==="acquireTokenizer"?f.acquireTokenizer.bind(f):Reflect.get(f,S,D)

Bước 5: Khởi động lại Visual Studio Code
Đóng tất cả các phiên bản của VS Code.
Mở lại VS Code để tải mã mở rộng đã sửa đổi.
Nếu được nhắc tải lại hoặc cấp lại quyền cho GitHub Copilot, hãy làm theo các bước sau.
Bước 6: Xác minh thay đổi
Mở một tệp mà bạn thường sử dụng Copilot Chat.
Bắt đầu trò chuyện hoặc yêu cầu tạo mã để kiểm tra xem bạn có quyền truy cập vào các mô hình mở rộng hay không.
Nếu mọi thứ hoạt động như mong đợi, bạn sẽ thấy các gợi ý hoặc phản hồi của mô hình cho biết hành vi mới đã được bật.
Xử lý sự cố
Nếu bạn không thấy bất kỳ thay đổi nào:

Kiểm tra lại xem bạn đã chỉnh sửa đúng extension.js chưa.
Đảm bảo không có lỗi cú pháp sau khi bạn sửa đổi.
Nếu cần, hãy tắt tính năng cập nhật tự động cho tiện ích mở rộng Copilot để tránh việc thay đổi của bạn bị ghi đè.

Đó là tất cả những gì bạn cần làm. Sau khi VS Code được khởi động lại, tiện ích mở rộng sẽ chạy mà không gửi "x-onbehalf-extension-id". Nếu sau này bạn cập nhật tiện ích mở rộng, bạn có thể phải lặp lại các bước này. Hãy cho tôi biết nếu bạn có bất kỳ câu hỏi nào!
