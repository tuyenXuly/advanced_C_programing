# Tổng quan về quá trình biên dịch của 1 chương trình C
1.  C là một ngôn ngữ bậc trung nó cần 1 trình biên dịch để chuyển đổi nó thành mã máy (là mã mà máy tính có thể hiểu được - chỉ bao gồm các số 0,1)
2.  Quá trình biên dịch chương trình C diễn ra như sau:
![](./Compilation-Process-in-C.png)

 Đầu tiên để biên dịch được file C ta phải có file code C . Đây chính là Source File - Bước này thì quá quen thuộc rồi ta chỉ cần tạo ra các file .c ví dụ như 1 chương trình Hello World! đơn giản

 
Quá trình biên dịch gồm 4 bước sau:
- Bước 1 : Preprocessor - về cơ bản nó là 1 công cụ thay thế văn bản nó hướng dẫn trình biên dịch thực hiện các tiền xử lý trước khi biên dịch .Đầu ra sẽ là các file .i
  * Xóa bỏ các bình luận
  * Thêm các file `#include` - Chính vì thêm chính các file mà được #include vào nên điều này sẽ gây ra lỗi nếu ta đặt tên các Global variable có tên giống nhau ở các file hoặc các hàm có tên giống nhau => (phải sử dụng từ khóa `static`)
  * Thay thế các `#Macro`
  * Biên dịch điều kiện

Ví dụ với file hello_world.c để tạo ra file .i ta làm như sau :

```
gcc -E hello_world.c -o hello_world.i
```
`-E` : chỉ thực hiện tiền xử lý 
- Bước 2 : Compiler - Giai đoạn này sẽ tạo ra asembly code (ngôn ngữ bậc thấp gần với ngôn ngữ máy hơn) chuyển file .i sang file .s
Ví dụ để tạo ra file .s ta làm như sau:

``` 
gcc -S hello_world.i -o hello_world.s
```
- Bước 3 :Assembler - đây là giai đoạn chuyển mã assembly thành mã máy tức là các file .o hoặc .obj (phụ thuộc vào kiến trúc hệ điều hành Window hay Linux)
```
gcc -c hello_world.i -o hello_world.o
```

- Bước 4 :Linker - Giai đoạn này sẽ liên kết tất cả các file .o và các thư viện thành 1 file thực thi hoàn chỉnh (chính là file .exe chạy trên Window mà ta vẫn hay thấy)
```
gcc hello_world.o -o hello_world
```
=> Vậy là đã biên dịch 1 chương trình C xong rồi đó bây giờ ta chỉ việc chạy file .exe này là xong rồi.