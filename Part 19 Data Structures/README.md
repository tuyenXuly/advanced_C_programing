# Cấu trúc dữ liệu

## Linked list 
- **Linked list** (danh sách liên kết)  là một cách để lưu trữ dữ liệu.
Nó có thể lưu trữ **nhiều loại dữ liệu khác nhau**. Đây là cấu trúc dữ liệu được sử dụng nhiều thứ hai, sau mảng (array). 
- Trong C không có kiểu dữ liệu danh sách liên kết, vì vậy bạn cần phải tự tạo ra nó. Danh sách liên kết là một cấu trúc dữ liệu tuyến tính. Tuyến tính nghĩa là nó có thứ tự và nối từ phần tử này sang phần tử khác. 
Nó là một chuỗi các cấu trúc dữ liệu được kết nối với nhau qua các liên kết (`links`) hoặc nút (`nodes`).
- Nếu nhìn một cách trừu tượng, bạn có thể hình dung nó như những nút và liên kết kết nối với nhau cho mỗi phần tử trong tập dữ liệu. 
Mỗi liên kết chứa dữ liệu của phần tử đó. Có nhiều loại danh sách liên kết khác nhau, 
nhưng chúng ta sẽ tập trung chủ yếu vào **danh sách liên kết đơn (singly linked list)**.

    - Danh sách liên kết đơn nghĩa là bạn chỉ có thể duyệt từ đầu đến cuối, chỉ có thể **đi một chiều** (forward).
    - Danh sách liên kết đôi (doubly linked list) cho phép bạn đi **cả hai chiều**, tức là có thể đi cả tiến (forward) và lùi (backward). 
    Để thực hiện điều này, bạn sẽ có nhiều con trỏ. Một con trỏ chỉ về phần tử trước và một con trỏ chỉ về phần tử sau, cho phép bạn di chuyển theo cả hai hướng.
- Danh sách liên kết là **động (dynamic)**, nghĩa là độ dài của danh sách có thể **tăng hoặc giảm tùy theo nhu cầu**. Đây là một ưu điểm lớn. Mảng (arrays) không phải là động, chúng là tĩnh. 
Bạn phải xác định kích thước của mảng khi khai báo, và sau đó bạn không thể thay đổi nó.
- Đó là lý do vì sao đôi khi bạn gặp lỗi **segmentation fault** hoặc lỗi **vượt quá giới hạn mảng (array out of bounds)** trong các ngôn ngữ khác. Bạn không thể tự do thay đổi kích thước của mảng. 
Với `malloc` và `realloc` trong C, bạn có thể thay đổi kích thước bộ nhớ một cách động, nhưng điều này không dễ. Trong khi đó, với danh sách liên kết, bạn có thể dễ dàng thêm hoặc xóa các phần tử tại thời gian chạy mà không cần biết trước kích thước.
- Một danh sách liên kết có thể được sử dụng khi bạn **không biết trước số lượng phần tử dữ liệu cần lưu trữ**. Một nút hoặc một liên kết có thể chứa dữ liệu với **bất kỳ kiểu nào**, bao gồm cả các đối tượng kiểu cấu trúc khác. 
Một lợi thế khác của danh sách liên kết là bạn có thể lưu trữ **các kiểu dữ liệu khác nhau**, ví dụ: int, float, hoặc thậm chí là các cấu trúc.
- So sánh `single linked list` và `double linked list` 
    - single linked list
![](./single_linked_list.png)
    - double linked list
![](./double_linked_list.png)
- So sánh giữa `Array` và `Linked list`
    - Advantages and Disadvantages of Array
    ![](./aray.png)
    - Advantages and Disadvantages of Linked list
    ![](./linked_list.png)

