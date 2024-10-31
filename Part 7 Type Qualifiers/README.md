# Overview
-  `Type qualifiers` có thể được sử dụng trước các biến để cung cấp cho trình biên dịch thêm **thông tin về mục đích sử dụng của biến** mụch đích giúp tối ưu hóa
- Các `Type qualifiers` bao gồm : `const` ,`volatile`,`restrict`
## Const
- Nếu một biến được khai báo với từ khóa `const` thì nó có thể cho trình biên dịch biết rằng các biến được chỉ định có **giá trị không đổi trong suốt quá trình thực thi chương trình**
- Nếu cố gắng gán một giá trị cho biến `const` sau khi khởi tạo trình biên dịch có thể đưa ra thông báo lỗi.
- Một trong những nguyên lý đó là từ khóa `const` cho phép trình biên dịch đặt các biến `const` **vào bộ nhớ chỉ đọc(Read-only memory).**
### Const vs. Define
- `#define` là một chỉ thị tiền xử lý còn `const` chỉ là một từ khóa
- Biến `const` có tất cả các đặc điểm giống như một biến bình thường, ngoại trừ việc nó không thể thay đổi giá trị sau khi khởi tạo. Điều này có nghĩa là bạn có thể truyền biến const vào các hàm, ép kiểu (typecast) nó, và làm bất kỳ điều gì khác mà bạn có thể làm với biến bình thường.
- `const` xử lý bằng trình biên dịch còn `#define` được xử lý bởi bộ tiền xử lý
    - Một lợi thế lớn của `const` so với `#define` là khi bạn khai báo một biến const, trình biên dịch sẽ kiểm tra kiểu dữ liệu. Nếu có bất kỳ lỗi nào liên quan đến kiểu (type mismatch), trình biên dịch sẽ phát hiện và cảnh báo bạn.
    - `#define` chỉ đơn giản là một thay thế văn bản trước khi biên dịch. Không có kiểm tra kiểu với `#define`, vì vậy nếu có bất kỳ lỗi nào liên quan đến kiểu, bạn có thể gặp lỗi mà không nhận được cảnh báo rõ ràng từ trình biên dịch.
- Phạm vi hoạt động của một biến `const` cũng giống như một biến bình thường
### syntax
- Cấu trúc của việc khai báo biến `const` như sau:
![](./syntax-of-constants-in-c.png)
- Các biến `const` trong C là bất biến sau khi định nghĩa, tức là chúng chỉ có thể được khởi tạo một lần trong toàn bộ chương trình. Sau đó, chúng ta không thể sửa đổi giá trị được lưu trữ bên trong biến đó.
![](./how-to-declare-constants-in-c.png)
### Ví dụ
- Ví dụ 1:
```C
// C Program to demonstrate the behaviour of constant
// variable
#include <stdio.h>

int main()
{
    // declaring a constant variable
    const int var;
    // initializing constant variable var after declaration
    var = 20;

    printf("Value of var: %d", var);
    return 0;
}
```
Output
```C
In function 'main':
10:9: error: assignment of read-only variable 'var'
10 |     var = 20;
     |         ^
```
### const and pointer
Trong C từ khóa const có thể được sử dụng với con trỏ (pointer) để kiểm soát tính không thay đổi của dữ liệu mà con trỏ trỏ tới hoặc chính bản thân con trỏ.Điều này phụ thuộc vào **vị trí của từ khóa `const` và  ký hiệu khi khai bóa con trỏ `*`**
- **Con trỏ tới một giá trị không thay đổi**: Khi bạn khai báo một con trỏ mà không cho phép thay đổi giá trị mà nó trỏ tới, bạn sử dụng `const` trước `*`
```C
const int *ptr; // cách 1
int const *ptr;  // cách 2
// ptr không thể thay đổi giá trị mà nó trỏ tới
```
- **Con trỏ không thay đổi giá trị của chính nó** : Khi bạn muốn ngăn không cho con trỏ thay đổi vị trí mà nó trỏ tới, bạn có thể đặt `const` sau dấu `*`
```C
int * const ptr;
// ptr không thể trỏ tới một địa chỉ khác
```
- **Con trỏ tới một giá trị không thay đổi và con trỏ không thay đổi** : Cách này kết hợp cả 2 cách trên 
```C
const int * const ptr;
// ptr không thể thay đổi giá trị mà nó trỏ tới và cũng không thể trỏ tới một địa chỉ khác
```
## volatile
### Overview
- `volatile` - từ khóa này cho phép trình biên dịch hiểu rõ rằng giá trị của biến được chỉ định
**sẽ thay đổi**, nên nó gần như là đối lập với từ khóa `const`.
- Nó được cung cấp để chương trình có thể yêu cầu trình biên dịch
**bỏ qua một số kiểu tối ưu hóa**.Nó ngăn trình biên dịch tối ưu hóa các phép gán
dường như dư thừa cho một biến.
- Nó cũng ngăn trình biên dịch kiểm tra lại giá trị của một biến
mà không thấy giá trị đó thay đổi.Về cơ bản, nó ngăn trình biên dịch
lưu trữ các biến.
- Lý do có từ khóa này chủ yếu là do các vấn đề
gặp phải trong lập trình hệ thống nhúng hoặc thời gian thực.
Các chương trình có **nhiều luồng xử lý** hoặc các chương trình mà **tài nguyên hạn chế**
sẽ sử dụng từ khóa `volatile`.
### Use case
- Biến nên được khai báo là `volatile` nếu giá trị của nó có thể thay đổi một cách bất ngờ do các yếu tố bên ngoài chương trình. 
Điều này giúp trình biên dịch hiểu rằng giá trị của biến không ổn định và không nên được lưu trữ tạm thời trong bộ nhớ đệm (caching) hoặc thanh ghi để tối ưu hóa.
-  Trình biên dịch sẽ luôn đọc giá trị mới của biến volatile mỗi khi biến được truy cập, thay vì giữ một bản sao cũ trong bộ nhớ. 
Điều này đảm bảo dữ liệu luôn được cập nhật, đặc biệt hữu ích khi giá trị của biến có thể bị thay đổi bởi các yếu tố bên ngoài.
- Ba loại biến nên dùng `volatile`:
    - **Các thanh ghi ngoại vi ánh xạ vào bộ nhớ**: Thường thấy trong lập trình nhúng, các thanh ghi này giao tiếp trực tiếp với phần cứng, do đó giá trị của chúng có thể thay đổi không báo trước.
    - **Các biến toàn cục được sửa đổi bởi chương trình xử lý ngắt**: Trong các ứng dụng có ngắt (interrupt), các biến toàn cục có thể được cập nhật bởi các chương trình xử lý ngắt. volatile giúp đảm bảo rằng các biến này được đọc lại khi có sự thay đổi do ngắt gây ra.
    - **Các biến toàn cục được truy cập bởi nhiều tác vụ (đa luồng)**: Trong các ứng dụng đa luồng, các biến có thể được thay đổi bởi nhiều luồng khác nhau, nên volatile giúp tránh việc sử dụng các giá trị không chính xác do lưu trữ tạm.
###  syntax
- Cú pháp khai báo biến sử dụng từ khóa `volatile` giống như khi sử dụng từ khóa `const`.
- Khai báo một biến `volatile`:
```c
volatile int loc1;       /* loc1 là một biến volatile */
```
Ở đây, loc1 được khai báo là một biến kiểu int và được đánh dấu là volatile, nghĩa là giá trị của nó có thể thay đổi bất ngờ.


- Khai báo con trỏ trỏ đến biến `volatile`:
```c
volatile int *ploc;     /* ploc trỏ đến một biến volatile */
```
Trong trường hợp này, ploc là một con trỏ trỏ đến một biến kiểu int được đánh dấu là volatile. Điều này có nghĩa là giá trị mà ploc trỏ tới cũng có thể thay đổi một cách bất ngờ.
### Example
```c
val1 = x;  
/* một số mã không sử dụng x */  
val2 = x;  
```
Trong đoạn mã trên, giá trị của biến x được gán cho `val1`, và sau đó một đoạn mã khác không liên quan đến x được thực thi trước khi `val2` nhận giá trị từ x.

Một trình biên dịch thông minh (tối ưu hóa) có thể nhận thấy rằng `x` được sử dụng hai lần mà không có bất kỳ thay đổi nào giữa hai lần gán.
Do đó, trình biên dịch có thể tạm thời lưu giá trị của `x` vào một thanh ghi (register). Khi cần sử dụng giá trị này lần nữa cho `val2`, trình biên dịch sẽ đọc 
nó từ thanh ghi thay vì từ vị trí bộ nhớ gốc, giúp tiết kiệm thời gian.

Tuy nhiên, nếu giá trị của `x` **có thể thay đổi giữa hai câu lệnh (ví dụ: bởi một ngắt hoặc một luồng khác), việc tối ưu hóa này có thể dẫn đến lỗi**. Trình biên dịch có thể sử dụng một giá trị không chính xác cho `val2`.

Để đảm bảo rằng giá trị của `x` luôn được đọc từ bộ nhớ mỗi khi nó được sử dụng, bạn sẽ sử dụng từ khóa `volatile` trong khai báo của `x`
```c
volatile int x;
```
### Another Example (An I/O port)
- Giả sử bạn có một cổng đầu ra mà được chỉ đến bởi một biến trong chương trình của bạn.
- Nếu bạn muốn ghi hai ký tự vào cổng, một ký tự `O` và sau đó là `N`, bạn có thể thực hiện như sau:
```C 
*outPort = 'O';
*outPort = 'N';
```
- Một trình biên dịch thông minh có thể nhận thấy rằng có hai phép gán liên tiếp cho cùng một địa chỉ.
- Bởi vì `outPort` không bị thay đổi giữa hai phép gán, trình biên dịch có thể loại bỏ phép gán đầu tiên khỏi chương trình, dẫn đến chỉ ghi `N` vào cổng mà không ghi `O`.
- Để ngăn chặn điều này xảy ra, bạn cần khai báo outPort là một con trỏ volatile:
```c
volatile char *outPort;
```
### volatile and const
- Một giá trị có thể vừa là `const` vừa là `volatile`.
- Nếu 1 biến kết hợp cả 2 từ khóa này điều này có nghĩa là một biến mà giá trị của nó không nên bị thay đổi bởi chương trình (do từ khóa `const`), nhưng có thể thay đổi bởi các tác nhân khác (do từ khóa `volatile`).

- Khai báo một biến `volatile` và `const`:
```c
volatile const int loc;  // loc là một biến const và volatile
```
- Khai báo một con trỏ trỏ đến một biến `const` và `volatile`:
```c
const volatile int *ploc;  // ploc trỏ đến một biến const và volatile
```
## restrict
### Overview
- Từ khóa `restrict` là một gợi ý tối ưu hóa cho trình biên dịch, giống như các từ khóa khác. Trình biên dịch có thể chọn bỏ qua nó.

- `restrict` được sử dụng trong **khai báo con trỏ** như một từ khóa kiểu cho con trỏ. Nó cho trình biên dịch biết rằng **một con trỏ cụ thể là tham chiếu duy nhất đến giá trị mà nó trỏ tới trong suốt phạm vi của nó**.

- Điều này có nghĩa là giá trị đó không được tham chiếu bởi bất kỳ con trỏ hoặc biến nào khác trong phạm vi đó. Con trỏ này là phương thức ban đầu duy nhất để truy cập một đối tượng dữ liệu.

- Nó phải giả định rằng một định danh khác có thể đã thay đổi dữ liệu giữa hai lần sử dụng con trỏ. Khi từ khóa restrict được sử dụng, trình biên dịch có thể tìm kiếm các lối tắt tính toán, có thể thực hiện một số tối ưu hóa.

- Nếu một lập trình viên sử dụng restrict và vi phạm điều kiện trên, kết quả sẽ là hành vi không xác định.

- Ngoài ra, từ khóa `restrict` không được hỗ trợ trong C++, vì vậy nó không thể di chuyển giữa C và C++.

### syntax
Khi khai báo con trỏ với từ khóa `restrict`, cú pháp sẽ như sau:
```C 
int * restrict intPtrA;
int * restrict intPtrB;
```
Trong thời gian tồn tại của intPtrA và intPtrB, chúng sẽ không bao giờ truy cập cùng một giá trị. Điều này có nghĩa là, cho dù là một phần tử trong một mảng hay một biến riêng lẻ, không có con trỏ nào trong số này được phép tham chiếu đến cùng một vị trí bộ nhớ.
