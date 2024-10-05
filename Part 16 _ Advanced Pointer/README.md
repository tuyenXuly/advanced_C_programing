# Advanced Pointer
## Double Pointer (Pointer to a Pointer)
- Trước hết ta lượn lại một vòng về con trỏ trước đã. **Con trỏ** hiểu đơn giản là truy xuất giá trị một cách gián tiếp.
    - Một con trỏ cơ bản gồm 3 phần:
        - Địa chỉ : Con trỏ có một địa chỉ giống như bất kỳ 1 biến nào khác.
        - Giá trị : Giá trị của con trỏ thực chất là một địa chỉ khác
        - Giá trị mà địa chỉ đó trỏ tới: Đây là giá trị thực tế mà bạn nhận được khi truy xuất giá trị của con trỏ.
    - Với con trỏ đơn giản mà ta đã biết(con trỏ cấp 1) sẽ có:
        - Giá trị của con trỏ: Đây là địa chỉ của 1 biến khác.
        - Giá trị mà địa chỉ đó trỏ tới: Đây chính là giá trị của biến mà con trỏ đang trỏ tới.
        - Ví dụ:
        ```C
        int x=10;
        int *ptr = &x;
        ```
        => ptr là con trỏ cấp 1. Giá trị của ptr là địa chỉ của biến x. Khi truy xuất con trỏ này tức là dùng *ptr ta sẽ được kết quả là 10
- Bây giờ với Double Pointer (Con trỏ cấp 2):
  - Giá trị của con trỏ : Đây là địa chỉ của con trỏ cấp 1
  - Giá trị mà địa chỉ đó trỏ tới : Đây chính là địa chỉ mà con trỏ cấp 1 đang trỏ tới - tức là địa chỉ của 1 biến thực sự.
  - Nhìn ảnh này phát hiểu luôn .-.
  ![](.\double-pointers-in-c.png)
  - Về lý thuyết có thể có Pointer to Pointer to Pointer to .... (con trỏ cấp 3,cấp 4,...) tuy nhiên quá nhì nhằng và khó hiểu rất ít khi được sử dụng.Không nên làm gì nhiều hơn con trỏ cấp 2.
  - Trong trình cài đặt ngôn ngữ C, một con trỏ kép hoạt động tương tự như một con trỏ bình thường trong C. Vì vậy, kích thước của biến con trỏ kép luôn bằng con trỏ bình thường.
  - Ví dụ về con trỏ cấp 2:
  ```C
    #include <stdio.h>

    int main() {
        // Declare an int variable
        int a = 10;
        
        // Declare a single pointer (pointer to int)
        int *p1 = NULL;

        // Declare a double pointer (pointer to pointer)
        int **p2 = NULL;

        // Assign the address of 'a' to the pointer p1
        p1 = &a;

        // Assign the address of pointer p1 to the double pointer p2
        p2 = &p1;

        // Print the address and value of each variable
        printf("Value of a: %d\n", a);
        printf("Address of a: %p\n", &a);

        printf("Value of p1 (address of a): %p\n", p1);
        printf("Address of p1: %p\n", &p1);

        printf("Value of p2 (address of p1): %p\n", p2);
        printf("Address of p2: %p\n", &p2);

        // Access the value of 'a' through the pointers p1 and p2
        printf("Value of a through p1: %d\n", *p1);
        printf("Value of a through p2: %d\n", **p2);

        return 0;
    }

  ```
 => kết quả thu được sẽ là 
 ```
Value of a: 10
Address of a: 00000021E51FF94C
Value of p1 (address of a): 00000021E51FF94C 
Address of p1: 00000021E51FF940
Value of p2 (address of p1): 00000021E51FF940
Address of p2: 00000021E51FF938
Value of a through p1: 10
Value of a through p2: 10 
```
- CÁC ỨNG DỤNG CỦA CON TRỎ CẤP 2 - sẽ lấy ví dụ sau hiccc

    - Chúng tôi được sử dụng trong bộ nhớ bổ sung phân tích của các mảng đa chiều.
    - Chúng tôi có thể được sử dụng để lưu trữ dữ liệu đa cấp như đoạn tài liệu văn bản, câu và ngữ nghĩa.
    - Chúng tôi có thể sử dụng dữ liệu cấu trúc để thao tác trực tiếp địa chỉ của các nút mà không cần sao chép.
    - Chúng tôi có thể sử dụng hàm số để thao tác với địa chỉ được lưu trữ trong bộ máy con trỏ.                                                                                                                                       


