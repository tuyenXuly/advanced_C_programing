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
  - Nhìn ảnh này phát hiểu luôn
  ![](./double-pointers-in-c.png)
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
- CÁC ỨNG DỤNG CỦA CON TRỎ CẤP 2 - sẽ lấy ví dụ sau hic hicc

    - Chúng được sử dụng trong bộ nhớ bổ sung phân tích của các mảng đa chiều.
    - Chúng có thể được sử dụng để lưu trữ dữ liệu đa cấp như đoạn tài liệu văn bản, câu và ngữ nghĩa.
    - Chúng có thể sử dụng dữ liệu cấu trúc để thao tác trực tiếp địa chỉ của các nút mà không cần sao chép.
    - Chúng có thể sử dụng hàm số để thao tác với địa chỉ được lưu trữ trong bộ máy con trỏ.                      

## Function pointer                                        
- Ta thường quen thuộc với các biến với địa chỉ của nó Tuy nhiên các hàm cũng chứa một địa chỉ trong bộ nhớ => Do vậy chúng ta có thể sử dụng con trỏ để trỏ tới các hàm (vì bản chất con trỏ là lưu địa chỉ mà)
- Dù không thông dụng như các con trỏ khác nhưng trong 1 số trường hợp ta sẽ phải dùng con trỏ hàm :
    - Truyền con trỏ hàm như **tham số cho 1 hàm khác**,cho phép hàm thứ 2 biết cần sử dụng hàm nào.
    - Một ứng dụng khác là sắp xếp một mảng, khi bạn cần so sánh hai phần tử để xem phần tử nào đứng trước.
    - Con trỏ hàm còn được sử dụng trong việc tạo bảng định tuyến (dispatch tables). Bạn có thể tạo các bảng chứa các con trỏ hàm để xử lý các lệnh do người dùng nhập vào.
    - Hệ thống menu điều khiển: Bạn có thể sử dụng con trỏ hàm để xử lý các lựa chọn menu của người dùng.
    - Thay thế các câu lệnh switch hoặc if: Con trỏ hàm giúp tối giản cấu trúc điều kiện bằng cách ánh xạ các hàm tương ứng.
    - Hiện thực hóa cơ chế gọi lại (callback): Tức là bạn truyền con trỏ hàm vào một hàm khác, và hàm này sẽ gọi lại hàm đó vào thời điểm nào đó trong quá trình chạy.
- Con trỏ hàm có thể được truyền vào hàm,trả về từ hàm,lưu trữ trong mảng ,hoặc gán cho các hàm khác.
- Syntax :
    - Con trỏ hàm lưu địa chỉ của mã bắt đầu của hàm.Cần chú ý **tên của hàm cũng có thể lấy làm địa chỉ của hàm** ~ điều này giống như mảng vậy
      
      VD: Ta có 1 hàm `foo` như sau để lấy địa chỉ của hàm có thể là `&foo` hoặc `foo` 2 điều này là tương đương nhau.
      ```c
      void foo(int){
        // this is code lines.
      }
      int main(){
        printf("Address foo function is %p\n",foo);
        printf("Address foo function is %p\n",&foo);

        return 0;
      }
      ```

    - Con trỏ hàm lưu địa chỉ của mã bắt đầu hàm tuy nhiên chỉ địa chỉ là không đủ để gọi hàm .Cần biết **số lượng và kiểu của tham số cần truyền vào** và **kiểu giá trị trả về**.Vì vậy việc khai báo con trỏ hàm phức tạp hơn so với con trỏ dữ liệu thông thường.

        Ví dụ:
         ```C
          int (*ptr_foo)(int);
          ptr_foo = foo; // of ptr_foo = &foo;
          ```
    - **Dấu ngoặc đơn** quanh (*pFunction) là cần thiết để tránh nhầm lẫn với hàm trả về con trỏ
- **Gọi hàm thông qua con trỏ** : Khi bạn gọi hàm thông qua con trỏ hàm pFunction, bạn chỉ cần sử dụng tên của con trỏ như một hàm thông thường.

    Ví dụ:

        ```C
        int result = pFunction(5);  // Gọi hàm add thông qua con trỏ
        printf("%d\n"result);     // Output: 6
        ```
    Bạn không cần phải viết (*pFunction)(5) để bỏ tham chiếu, bởi vì pFunction đã **trỏ đến một hàm**, và trình biên dịch hiểu rằng bạn đang gọi hàm đó, không phải đang thao tác với **giá trị mà hàm trả về**.
        
- `typedef` để đơn giản cú pháp : Trong C, cú pháp của con trỏ hàm có thể gây khó hiểu, đặc biệt khi hàm có nhiều tham số hoặc kiểu trả về phức tạp. Sử dụng typedef giúp ẩn cú pháp phức tạp và làm cho mã dễ đọc hơn.

- **Hàm Qsort** mà ta vẫn hay dùng chính là một ví dụ về việc sử dụng con trỏ hàm cú pháp của Qsort như sau:
    ```C 
    void qsort(void *base, size_t nitems, size_t size, int (*compar)(const void *, const void *));
    ``` 

    Ở đây **Compar** chính là một con trỏ hàm nó trỏ đến hàm so sánh được dùng để xác định thứ tự của các phần tử Nó được truyền vào hàm Qsort như một đối số.
- **Pointer to a Function** vs. **Function returning a pointer** 
    - **Con trỏ đến một hàm** là một biến dùng để lưu trữ địa chỉ của một hàm, và khi cần, có thể dùng nó để gọi hàm đó.
        
        ```C
        int (*pFunc)(int);
        ```
    - **Một hàm trả về con trỏ** có cú pháp khác với con trỏ hàm. Hàm này sẽ trả về một con trỏ (thay vì trả về một giá trị kiểu int, float, v.v.).
        ```C
        int* func(int a);
        ```

## Void Pointers

- Chúng ta trước đây đã học một con trỏ có kiểu là con trỏ đến `int` hay `float` ,... Thì nó có thể lưu địa chỉ của biến có kiểu định dạng đó.Chúng ta không thể gán địa chỉ của 1 biến kiểu `int` cho 1 con trỏ kiểu `float`.

- Con trỏ `void` là mọt con trỏ đặc biệt.Nó đại diện cho sự không có kiểu,một con trỏ tổng quát tức là Một con trỏ kiểu `void` có thể trỏ đến **bất kỳ loại biến nào**, từ một giá trị số nguyên hoặc số thực đến một chuỗi ký tự.

- Syntax :Cú pháp khai báo con trỏ kiểu void tương tự như con trỏ bình thường, nhưng khác ở chỗ thay vì kiểu dữ liệu, chúng ta sử dụng từ khóa `void`. Do đó, thay vì `int*` hay `float*`,.., chúng ta sẽ dùng `void*`.
- Dữ liệu được trỏ tới bởi 1 con trỏ kiểu `void` không thể được giải tham chiếu 1 cách trực tiếp.Chúng ta không có kiểu để giải tham chiếu tới => để tham chiếu chúng ta phải ép kiểu địa chỉ và con trỏ kiểu void đến 1 loại con trỏ khác.
Ví dụ:
```C
// C program to dereference the void
// pointer to access the value

#include <stdio.h>

int main()
{
	int a = 10;
	void* ptr = &a;
	// The void pointer 'ptr' is cast to an integer pointer
	// using '(int*)ptr' Then, the value is dereferenced
	// with `*(int*)ptr` to get the value at that memory
	// location
	printf("%d", *(int*)ptr);
	return 0;
}
```
- Con trỏ `void` rất phổ biến khi được sử dụng như tham số trong hàm.Do một hàm có thể nhận được 1 con trỏ không cần kiểu cụ thể , giúp hàm trở nên tổng quát hơn.
Ví dụ ta hay viết hàm so sánh cho hàm  qsort như sau:
```C
int compare(const void *a,const void *b){

}
```
- Trong ngôn ngữ lập trình C, tất cả các con trỏ, bất kể chúng trỏ đến loại dữ liệu nào (ví dụ: int, float, char, hoặc void), **đều có cùng kích thước**. Kích thước của một con trỏ thường phụ thuộc vào kiến trúc của máy tính mà chương trình đang chạy. Trên hầu hết các kiến trúc hiện đại (như 32-bit hoặc 64-bit), kích thước của một con trỏ thường là 4 byte (trên 32-bit) hoặc 8 byte (trên 64-bit).
