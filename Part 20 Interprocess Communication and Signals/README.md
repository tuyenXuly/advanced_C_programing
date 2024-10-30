# Overview
- Ở 3 phần cuối này không thực sự liên quan trực tiếp đến ngôn ngữ C. Nhưng vì C là một ngôn ngữ cấp thấp và tương tác với hệ điều hành khá nhiều, nó được sử dụng trong hệ thống nhúng, nên việc hiểu ba khái niệm này là rất quan trọng. Do đó, chúng không phải là các cấu trúc của ngôn ngữ C mà là các thư viện và cách để giao tiếp giữa các tiến trình, sử dụng nhiều luồng để thực hiện nhiều đường lệnh song song, và sau đó là mạng, có thể giao tiếp với nhiều máy tính.
- Có rất nhiều thư viện C quan trọng để thực hiện những việc này. Hầu hết các lời gọi mà chúng ta sẽ thực hiện trong các phần tiếp theo là các lời gọi hệ thống (system calls). Bạn sẽ gọi hệ điều hành để làm một việc gì đó cho bạn và điều này sẽ được mô tả chi tiết hơn. Cho đến nay, bạn đã học rất nhiều về ngôn ngữ C, nhưng trong ba phần cuối này, chúng ta sẽ tập trung nhiều hơn vào các khái niệm quan trọng, các khái niệm về hệ điều hành mà bạn cần hiểu để lập trình trong C.
# Process
- `Process` hay tiến trình là một **chương trình đang thực thi**,khi bạn bắt đầu thực thi chương trình, nó sẽ được tải vào RAM và bắt đầu thực thi.
- Chúng ta biết rằng một chương trình là một tập tin chứa thông tin của tiến trình. Một chương trình có mã nguồn, có thể có một tập tin nguồn hoặc có rất nhiều tập tin nguồn. 
Thông thường, một chương trình cơ bản chỉ tạo ra một tiến trình.
- Bạn có thể tạo ra nhiều tiến trình thực thi cùng một chương trình, nhưng mỗi tiến trình có bản sao của chương trình trong không gian địa chỉ riêng của nó và thực thi độc lập với các bản sao khác. 
    - Ví dụ, nếu có Microsoft Explorer đang chạy và có Microsoft Outlook đang chạy, đó là các chương trình. Chúng có thể có một hoặc nhiều tiến trình nếu chúng đang thực hiện giao tiếp giữa các tiến trình và các thứ khác. Nhưng mỗi một trong các chương trình đó có không gian bộ nhớ riêng.

    - Nó không chia sẻ bộ nhớ với chương trình khác. Vì vậy, khi Microsoft Outlook đang ghi dữ liệu hoặc tạo biến, nó có không gian bộ nhớ của nó. Các biến đó không tồn tại trong chương trình khác.Khi đề cập rằng mỗi tiến trình có không gian địa chỉ riêng.

- **Mỗi tiến trình có không gian bộ nhớ riêng và chỉ tiến trình đó mới có thể thấy bộ nhớ đó. Nó hoàn toàn độc lập với các tiến trình khác, với mỗi tiến trình đang chạy trong không gian địa chỉ riêng của chính nó.**

- Lời gọi hệ thống (`system call`) là yêu cầu dịch vụ mà một chương trình thực hiện với nhân (kernel). Kernel là "bộ não" của hệ điều hành. Đó là tất cả mã nguồn đang chạy, thực hiện các công việc như lập lịch cho bộ xử lý, quản lý bộ nhớ và nhiều thứ khác. Dịch vụ này thường là điều mà chỉ kernel mới có quyền làm, đôi khi còn gọi là `kernel calls` hay `system calls`.

- Mỗi tiến trình được xác định bằng một số nguyên dương duy nhất gọi là `process ID`(PID)

- Bởi vì các tiến trình không chia sẻ bộ nhớ. Điều đó dẫn đến giao tiếp giữa các tiến trình
Một tiến trình có 2 loại:
    - `Indpendent process` (tiến trình độc lập) : chương trình chạy riêng biệt, không cần tương tác với các tiến trình khác, chỉ tự thực hiện.
    - `Co-operating process`(tiến trìn hợp tác) : nó bị ảnh hưởng bởi các chương trình khác đang chạy trên hệ điều hành.Được sử dụng để tăng tốc độ tính toán, tiện lợi và tính module hóa cao.
- Các chương trình có thể mạnh hơn nhiều bằng cách cho phép chúng giao tiếp với các chương trình khác trên hệ thống thường được gọi là IPC(Inter process communication)
# Các cách giao tiếp
- Tiến trình có thể giao tiếp với tiến trình khác theo nhiều cách khác nhau.
1. Pipes
2. Message Queues
3. Shared Memory

# Signals
- Tín hiệu (signals) là một dạng giao tiếp liên tiến trình (IPC) chủ yếu được sử dụng trong các hệ điều hành như Unix/Linux. Khi một tiến trình nhận được tín hiệu,
hệ điều hành sẽ ngắt luồng thực thi của tiến trình đó để xử lý sự kiện đã xảy ra. 
- Tín hiệu có thể được tạo ra bởi hệ thống hoặc lập trình viên và thường mang **giá trị nguyên nhỏ, biểu thị thông tin quan trọng.**
# The fork system call
