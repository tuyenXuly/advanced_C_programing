# Overview
- Các chương trình trong thực tế cần phải làm nhiều việc cùng 1 lúc. Ví dụ :
    - trò chơi cần cập nhật đồ họa trên màn hình đồng thời đọc dữ liệu đầu vào từ bộ điều khiển trò chơi 
    - các chương trình trò chuyện sẽ cần đọc văn bản từ mạng và gửi dữ liệu lên mạng cùng lúc 
    - các trình phát video sẽ cần truyền video tới màn hình như cũng như theo dõi đầu vào từ các điều khiển của người dùng
# Working on tasks at the same time
- Một trong những cách để thực hiện nhiều nhiệm vụ đồng thời là tạo ra một process(tiến trình) mới thông qua lệnh gọi hệ thống `fork`. Tuy nhiên, điều này không phải là một giải pháp hiệu quả.
    - **Thời Gian Tạo Quy Trình**: Việc tạo ra một quy trình mới tốn thời gian. Hệ điều hành cần thực hiện nhiều thao tác để thiết lập quy trình mới, và điều này có thể gây ra độ trễ trong ứng dụng.

    - **Hiệu Quả**: Nếu bạn tạo một quy trình cho mỗi nhiệm vụ, điều này sẽ không hiệu quả. Mỗi quy trình chiếm một lượng tài nguyên hệ thống, và nếu bạn cần tạo quá nhiều quy trình, điều đó sẽ làm giảm hiệu suất tổng thể của ứng dụng.

    - **Khó Chia Sẻ Dữ Liệu**: Các quy trình không thể chia sẻ dữ liệu dễ dàng. Mỗi quy trình có một bản sao hoàn chỉnh của tất cả dữ liệu từ quy trình cha, có nghĩa là chúng không thể truy cập vào các biến hay tài nguyên của nhau một cách trực tiếp.

# Threads
- Cần thứ gì đó có thể bắt đầu một tác vụ riêng biệt một cách nhanh chóng, có thể chia sẻ tất cả dữ liệu hiện tại của bạn và không cần nhiều mã để viết câu trả lời là sử dụng Threads (các luồng)
- Khái niệm:
    - Threads là cách chia nhỏ một process thành các phần có thể thực thi độc lập.
    - Mỗi Thead là một đường đi thực thi riêng biệt trong chương trình.
    - Thread đôi khi được gọi là quy trình nhẹ (lightweight processes).
# Multi - Threads
- Multi-Threads (đa luồng) là một kỹ thuật trong lập trình cho phép thực hiện **nhiều tác vụ (tasks) đồng thời trong một chương trình**. Kỹ thuật này giúp cải thiện hiệu suất và phản ứng của ứng dụng thông qua song song hóa (parallelism), tức là cho phép chạy mã lệnh đồng thời.
    - Các tác vụ thực hiện đồng thời: Trong một chương trình đa luồng, nhiều tác vụ có thể được thực hiện đồng thời mà không phụ thuộc vào thứ tự. Điều này có nghĩa là các tác vụ có thể chạy song song, cải thiện tốc độ và hiệu suất của ứng dụng.
    - Hoạt động không gián đoạn: Giống như các nhân viên trong cửa hàng có thể làm việc mà không làm gián đoạn nhau, các luồng trong một chương trình có thể thực hiện công việc của mình mà không bị ảnh hưởng bởi các luồng khác. Điều này giúp cải thiện trải nghiệm người dùng.
# Advantages of using Threads

- **Giảm Thiểu Tài Nguyên**: Việc tạo một luồng (thread) yêu cầu ít tài nguyên hơn so với việc tạo một tiến trình mới (forking). Khi tạo một tiến trình mới, hệ thống phải khởi tạo không gian bộ nhớ ảo và môi trường hệ thống mới, điều này tiêu tốn nhiều thời gian và tài nguyên.
- **Chia Sẻ Không Gian Địa Chỉ**: Các luồng trong cùng một tiến trình chia sẻ cùng một không gian địa chỉ, điều này cho phép chúng giao tiếp và trao đổi dữ liệu dễ dàng hơn. Không cần sử dụng các phương pháp giao tiếp giữa các tiến trình (IPC) phức tạp như trong trường hợp với tiến trình, mà chỉ cần truy cập trực tiếp vào các biến toàn cục.
- Lợi Thế Hiệu Suất Của Ứng Dụng Đa Luồng :
    - **Tiềm Năng Tăng Tốc Độ**: Ứng dụng sử dụng luồng có thể đạt được hiệu suất cao hơn và có nhiều lợi ích thực tiễn so với ứng dụng không sử dụng luồng. Một số điểm mạnh của luồng bao gồm:
    - **Tạo Luồng Nhanh Chóng**: Việc khởi tạo một luồng diễn ra nhanh hơn nhiều so với việc tạo một tiến trình mới, giảm thiểu chi phí hệ thống.
    - **Chuyển Đổi Ngữ Cảnh Nhanh Chóng**: Chuyển đổi giữa các luồng (context switching) thường diễn ra nhanh chóng hơn so với giữa các tiến trình, vì nó không yêu cầu khôi phục toàn bộ ngữ cảnh của tiến trình.
    - **Kết Thúc Luồng Nhanh Chóng**: Việc kết thúc một luồng cũng diễn ra nhanh hơn, giúp giải phóng tài nguyên một cách hiệu quả.
# Disadvancetages of using Threads
- **Khó Khăn Trong Việc Kiểm Soát Tương Tác Giữa Các Luồng**: Khi có nhiều luồng chạy đồng thời, rất dễ dàng để bỏ qua những hậu quả của việc các luồng tương tác với nhau. Những tương tác này có thể gây ra sự không nhất quán trong dữ liệu và hành vi không lường trước được của chương trình.
- **Nguy Cơ Lỗi Khó Phát Hiện**: Các lỗi xảy ra do tương tác giữa các luồng thường rất khó phát hiện và sửa chữa. Chúng có thể xảy ra trong một số điều kiện nhất định mà không xuất hiện trong các lần thực thi khác, làm cho việc xác định nguồn gốc của lỗi trở nên khó khăn hơn.
- **Vấn Đề Đồng Bộ Hóa Luồng**: Đây là vấn đề lớn nhất Việc đảm bảo rằng các luồng không truy cập cùng một dữ liệu cùng lúc là một thách thức lớn. Nếu hai hoặc nhiều luồng cố gắng truy cập cùng một biến hoặc tài nguyên mà không có cơ chế đồng bộ hóa, điều này có thể dẫn đến tình trạng dữ liệu không nhất quán.
- **Tình Huống Khó Khăn Với Dữ Liệu Chia Sẻ**

    - Ví Dụ Về Dữ Liệu Lương: Hãy tưởng tượng một chương trình có nhiều luồng có thể truy cập vào một biến chứa dữ liệu lương. Nếu có hai luồng độc lập cùng cố gắng sửa đổi giá trị của biến này:
        - Giả sử một luồng truy cập giá trị để thay đổi nó trong khi luồng thứ hai cũng làm như vậy trước khi luồng đầu tiên lưu giá trị đã sửa đổi.
        - Kết quả là, bạn sẽ có dữ liệu không nhất quán, với các luồng ghi đè lên nhau mà không biết điều đó đang xảy ra. Điều này có thể gây ra sai sót trong tính toán và làm cho chương trình của bạn hoạt động không chính xác.
# Multi-threading in C
- Trong ngôn ngữ C, chương trình chạy trên một luồng mặc định, thường là luồng chính (main). Điều này có nghĩa là mã sẽ chỉ chạy một lệnh tại một thời điểm. Không giống như một số ngôn ngữ lập trình khác, C không hỗ trợ đa luồng một cách tích hợp sẵn trong ngôn ngữ.
- Chúng ta sẽ viết các chương trình C đa luồng bằng cách sử dụng các luồng POSIX, hay còn gọi là pthreads. Thư viện pthreads cung cấp các hàm và cấu trúc cần thiết để tạo, quản lý và đồng bộ hóa các luồng trong một chương trình C. Thư viện này có thể được sử dụng với trình biên dịch gcc, một trong những trình biên dịch phổ biến nhất cho ngôn ngữ C.
- Mô hình lập trình với luồng mà pthreads cung cấp là một trong những mô hình chính cho lập trình đa luồng trong hầu hết các ngôn ngữ, bao gồm Java, Python và các ngôn ngữ bậc cao khác. Điều này có nghĩa là các khái niệm về luồng, đồng bộ hóa và quản lý tài nguyên được chia sẻ đều có thể áp dụng tương tự trong các ngôn ngữ khác nhau, giúp lập trình viên dễ dàng chuyển đổi giữa các ngôn ngữ khi cần thiết.