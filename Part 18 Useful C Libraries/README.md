# Sử dụng 1 số thư viện hữu ích
## Assert
- `Assert` là một hàm thực sự hữu ích cho việc **debugging** (gỡ lỗi) và được
định nghĩa trong `assert.h`. Nó là cả một thư viện riêng. Hàm `assert` cho phép
bạn kiểm tra các biểu thức tùy ý trong chương trình của mình. 
Đây là một loại kiểm tra trong **thời gian chạy** (runtime check).
- Hàm `assert` nhận một biểu thức số nguyên làm tham số, và biểu thức này 
có thể là biểu thức so sánh hoặc logic. Nếu biểu thức này sai trong quá trình thực thi, chương trình
sẽ bị **dừng lại với một thông báo lỗi**.Thông báo lỗi này sẽ được ghi vào **luồng lỗi chuẩn** (standard error).
- Nó sẽ hiển thị tên tệp chứa mã kiểm tra, dòng mã và thông báo cho biết biểu thức nào đã thất bại. 
Sau đó, hàm `abort()` sẽ được gọi để **dừng chương trình.**
- `Assert` thường được sử dụng khi có những **điều kiện quan trọng cần đảm bảo** trong chương trình.
Nếu những điều kiện đó không được thỏa mãn, chương trình có thể gặp lỗi nghiêm trọng. 
Khi đó, bạn muốn chương trình **dừng lại để không tiếp tục gây ra thêm lỗi**.
- Tuy nhiên, `assert` không phải là giải pháp thay thế cho việc xử lý lỗi trong điều kiện chạy thông thường của chương trình.
Bạn chỉ nên dùng `assert` để phát hiện các lỗi logic.
- Ví dụ:
```C 
#include <stdio.h>
#include <assert.h>ư

int main(){
    int y = 5;

    for(int x=0 ; x<20;x++){
    printf("x=%d y=%d\n",x,y);
    assert(x<y);
    }

    return 0;
}
```
Kết quả câu lệnh printf sẽ thực hiện được đến x= 5 và y=5 sau đó sẽ thấy lỗi như sau
```
x=0 y=5
x=1 y=5
x=2 y=5
x=3 y=5
x=4 y=5
x=5 y=5
Assertion failed: x<y, file test3.c, line 9
```
- Ta có thể tắt các `assert` bằng cách định nghĩa `#dedine NDEBUG` trước khi bao gồm thư viện
`assert.h`.Điều này sẽ tắt các `assert` khi runtime.Lưu ý phải thực hiện điều này trước khi bao gồm thư viện `assert.h`

Ví dụ 
```C
#include <stdio.h>
#define NDEBUG
#include <assert.h>

int main(){
    int y = 5;

    for(int x=0 ; x<20;x++){
    printf("x=%d y=%d\n",x,y);
    assert(x<y);
    }

    return 0;
}
```
Kết quả sẽ không có lỗi nào được in ra.
```C 
x=0 y=5
x=1 y=5
x=2 y=5
x=3 y=5
x=4 y=5
x=5 y=5
x=6 y=5
x=7 y=5
x=8 y=5
x=9 y=5
x=10 y=5
x=11 y=5
x=12 y=5
x=13 y=5
x=14 y=5
x=15 y=5
x=16 y=5
x=17 y=5
x=18 y=5
x=19 y=5
```

- Với một số hệ thống **không chuẩn**, các `assert` có thể bị **tắt mặc định**. 
Trong trường hợp đó, bạn có thể bật lại `assert` bằng cách sử dụng câu lệnh undefine cho `NDEBUG` (`#undef NDEBUG`),
 ngay trước khi bao gồm thư viện `assert.h`. Câu lệnh này sẽ đảm bảo rằng `assert` được bật cho tệp mã nguồn của bạn.
`Undef` phải xuất hiện trước khi include thư viện `assert.h` để có hiệu lực, giống như khi sử dụng `define`.
- Đó là về **runtime assertions**(kiểm tra trong thời gian chạy).Trong C còn có **compile-time assertions**(kiểm tra trong thời gian biên dịch)
Trong chuẩn C11 còn có thêm tính năng kiểm tra trong thời gian biên dịch.Điều này có nghĩa là việc kiểm tra sẽ được thực hiện khi bạn 
biên dịch chương trình,thay vì khi chạy chương trình.
- Thư viện `assert.h` cung cấp macro `static_assert` như là một `alias` (bí danh) cho từ khóa `static_assert` trong C. 
Nếu không bao gồm thư viện `assert.h`, bạn vẫn có thể sử dụng từ khóa `_Static_assert` trong C11. 
Macro `static_assert` giúp tương thích tốt hơn với C++.
- Static assert hoạt động như một câu lệnh khai báo (declaration statement). Không giống như hầu hết các câu lệnh trong C, 
static assert có thể xuất hiện cả trong hoặc ngoài hàm.
Macro `static assert` cho phép bạn tạo ra một thông báo lỗi trong quá trình biên dịch. 

- Thông báo lỗi sẽ chứa một chuỗi ký tự mà bạn chỉ định,
và phụ thuộc vào giá trị của biểu thức được kiểm tra trong thời gian biên dịch.Do là thông báo lỗi trong thời gian biên dịch
nên tham số truyền vào `static_assert` phải là hằng số.
