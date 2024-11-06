# Storage Classes
- Lớp lưu trữ được sử dụng để **mô tả các đặc tính của một biến hoặc hàm**.
    - Bao gồm **phạm vi (scope)**, **tầm nhìn (visibility)** và **vòng đời (lifetime)**.
    - Giúp theo dõi sự tồn tại của một biến cụ thể trong quá trình chạy của chương trình 
- Vòng đời của biến là khoảng thời gian mà biến tồn tại trong bộ nhớ của máy tính.
    - Một số biến tồn tại trong thời gian ngắn, một số khác được tạo và hủy nhiều lần, và một số tồn tại suốt thời gian chương trình chạy.
- Phạm vi của biến là nơi mà biến có thể được tham chiếu trong chương trình.
    - Một số có thể được tham chiếu trong toàn bộ chương trình, số khác chỉ từ một phần của chương trình.
- Tầm nhìn hoặc liên kết (linkage) của một biến xác định trong một chương trình nhiều tệp nguồn xem biến đó có chỉ được biết đến trong tệp nguồn hiện tại hay trong bất kỳ tệp nguồn nào với khai báo thích hợp.
- C cung cấp **bốn lớp lưu trữ**, mỗi lớp được định danh bởi một từ khóa nhất định:
    - `auto`
    - `register`
    - `extern`
    - `static`
- Phân loại theo Thời Gian Lưu Trữ
    - **Thời gian lưu trữ tự động (Automatic storage duration)**: Áp dụng cho `auto` và `register`. Biến chỉ tồn tại khi khối mã mà chúng được khai báo đang hoạt động.
    - **Thời gian lưu trữ tĩnh (Static storage duration)**: Áp dụng cho `static` và `extern`. Biến tồn tại trong suốt thời gian chương trình chạy.
    ![](./storage_classes.jpg)

## Local Variables
- Trong C, biến cục bộ là những biến được khai báo bên trong thân hàm hoặc một khối mã và chỉ có thể truy cập trong phạm vi hàm hoặc khối mã đó. Đặc điểm chính của chúng bao gồm:
    - **Thời Gian Lưu Trữ Tự Động** : Biến cục bộ mặc định có thời gian lưu trữ tự động, tức là chúng được tạo mỗi khi hàm được gọi và bị hủy khi hàm kết thúc.Điều này giúp tiết kiệm bộ nhớ vì biến chỉ tồn tại khi thực sự cần thiết.
    - **Phạm Vi Cục Bộ** : Giá trị của biến cục bộ chỉ có thể truy cập trong hàm nơi chúng được khai báo, không thể được truy cập từ các hàm khác.
    - **Khởi tạo lại khi gọi hàm** : Nếu biến cục bộ được gán một giá trị khởi tạo, giá trị này sẽ được gán lại mỗi khi hàm được gọi. Điều này có nghĩa là biến cục bộ sẽ bắt đầu với cùng giá trị khởi tạo trong mỗi lần gọi hàm, giúp duy trì tính nhất quán của dữ liệu và hành vi của hàm trong suốt quá trình thực thi.

## Auto
### Overview
- Trình biên dịch C **mặc định coi rằng bất kỳ biến nào được định nghĩa bên trong một hàm là biến cục bộ tự động**.
Từ khóa `auto` hiếm khi được sử dụng.
- Trong C++, từ khóa `auto` đã được sử dụng lại cho một mục đích khác, vì vậy tránh dùng `auto` làm chỉ thị lớp lưu trữ giúp đảm bảo tính tương thích giữa C và C++.
- Tuy nhiên, bạn có thể làm rõ ý định bằng cách sử dụng từ khóa `auto` trước khi định nghĩa biến.Điều này giúp tài liệu hóa rằng bạn đang cố tình ghi đè một biến được định nghĩa bên ngoài.Hoặc để nhấn mạnh rằng không nên thay đổi biến này sang một lớp lưu trữ khác.
### Why use Auto?
- Bộ nhớ tự động là một cách để tiết kiệm bộ nhớ.
Biến tự động chỉ tồn tại khi cần thiết.
- Chúng được tạo khi hàm mà chúng được định nghĩa trong được gọi.
- Chúng bị hủy khi hàm kết thúc.
- Bộ nhớ tự động là một ví dụ của nguyên tắc hạn chế quyền truy cập.
- Chỉ cho phép truy cập dữ liệu khi thực sự cần thiết.
- Tại sao lại lưu biến trong bộ nhớ và cho phép truy cập khi chúng không thực sự cần?
### Syntax
- **Các lớp lưu trữ được đặt trước kiểu của biến.**
- Để chỉ định lớp lưu trữ cho một biến, cú pháp sau đây cần được tuân thủ:
```C
storage_class var_data_type var_name;
```
Khai báo sau cho biết rằng các biến kiểu double x và y là các biến cục bộ tự động.
Chúng chỉ tồn tại trong thân hàm nơi khai báo xuất hiện:
```C
auto double x, y;
```
## Enternal Variables
