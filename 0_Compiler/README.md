# Quá trình biên dịch của 1 chương trình C
1.  C là một ngôn ngữ bậc trung nó cần 1 trình biên dịch để chuyển đổi nó thành mã máy (là mã mà máy tính có thể hiểu được - chỉ bao gồm các số 0,1)
2.  Quá trình biên dịch chương trình C diễn ra như sau:
![](./Compilation-Process-in-C.png)

 Đầu tiên để biên dịch được file C ta phải có file code C . Đây chính là Source File - Bước này thì quá quen thuộc rồi ta chỉ cần tạo ra các file .c ví dụ như 1 chương trình Hello World! đơn giản
(Cách để chạy 1 chương trình C sẽ được đề cập ở bài khác bài này chỉ giải thích các bước biên dịch của C)
 
Quá trình biên dịch gồm 4 bước sau:
- Bước 1 : Preprocessor - sẽ xử lý các tiền xử lý (có ký tự #) Đầu ra sẽ là các file .i
  * Xóa bỏ các bình luận
  * Thêm các file #include - Chính vì thêm chính các file mà được #include vào nên điều này sẽ gây ra lỗi nếu ta đặt tên các Global variable có tên giống nhau hoặc các hàm có tên giống nhau => (sử dụng từ khóa static)
  * Thay thế các #Macro
  * Biên dịch điều kiện

Ví dụ với file hello_world.c để tạo ra file .i ta làm như sau :

```
gcc -E hello_world.c -o hello_world.i
```
- Bước 2 :
