# Preprocesser
- Đây là một bước riêng biệt trong quá trình biên dịch nó không phải là một phần của trình biên dịch
- Về cơ bản thì nó là 1 công cụ thay thế văn bản nó hướng dẫn trình biên dịch thực hiện các tiền xử lý trước khi biên dịch thực tế
- Chủ yếu thực hiện 3 tác vụ chính trên mã:
  * Loại bỏ các comments 
  * Bao gồm tất cả các tệp từ các thư viện khác nhau mà chương trình cần biên soạn (#include )
  * Thay thế các Macro
- Các chỉ thị tiền xử lý là cách lệnh bắt đầu bằng # 
- Biên dịch có điều kiện : 
  * Đây là một tính năng nâng cao của Preprocessor thường được dùng để tọa ra 1 chương trình có thể được biên địch bởi nhiều hệ thống khác nhau
  * Cách thực hiện là cho phép biên dịch hoặc bỏ qua 1 phần mã tùy thuộc vào điều kiện xac định trong quá trình tiền xử lý
  * Bao gồm `#if` , `#endif` , `#ifdef`, `#ifndef` , `#elif` và `#else`

     * `#if` được sử dụng để kiểm tra **một điều kiện** (thường là **giá trị** của macro). Nếu điều kiện này đúng (non-zero), đoạn mã sẽ được biên dịch; nếu sai, nó sẽ bị bỏ qua.


    * `#endif` được sử dụng để **kết thúc** một khối lệnh bắt đầu bằng `#if` , `#ifdef`, `#ifndef` , `#elif` và `#else`

    * `#ifdef` (if define) kiểm tra xem một macro đã **được định nghĩa hay chưa không quan tâm đến giá trị giống như `#if`**  nếu Macro đã được định nghĩa bằng #define , đoạn mã dưới #ifdef sẽ được biên dịch

    * `#ifndef` (if not define) kiểm tra xem một macro **chưa được định nghĩa** .Nếu macro chưa được định nghĩa, đoạn mã dưới #ifndef sẽ được thực thi

    * `#elif` (else if) được dùng sau `#if` hoặc `#ifdef` để kiểm tra điều kiện khác nếu điều kiện trước đó bị sai

    * `#else` được sử dụng khi muốn chỉ định 1 hành động thay thế trong trường hợp tất cả các điều kiện trước đó là sai

    * `undef` được dùng để hủy bỏ định nghĩa của 1 macro sau khi sử dụng `#undef` macro sẽ không còn ý nghĩa nữa

    * `include guards` sử dụng `#ifdef` để ngăn chặn nhiều #include của 1 tệp cách này có thể ngăn chặn nhiều định nghĩa của cùng 1 biến.

        Quy trình: Khi preprocessor gặp một file header lần đầu, nó sẽ kiểm tra xem macro đã được định nghĩa hay chưa. Nếu chưa, nó sẽ định nghĩa macro đó và tiếp tục xử lý nội dung của file. Nếu file đã được định nghĩa, preprocessor sẽ bỏ qua nội dung của nó, đảm bảo nội dung chỉ được bao gồm một lần duy nhất trong file nguồn.

        Ví dụ:
        ```C
        #ifndef STANDARD_IO_H
        #define STANDARD_IO_H

        // Nội dung của file header

        #endif
        ```
- `#pragma` cho phép lập trình viên đưa vào mã nguồn các chỉ dẫn cho trình biên dịch, yêu cầu hành vi đặc biệt từ nó.

    Mục đích: #pragma thường được sử dụng cho các **chương trình lớn hoặc cần tận dụng các tính năng đặc thù của trình biên dịch**. Nó có thể điều chỉnh nhiều yếu tố như:

   - Kích thước bộ nhớ cho các biến tự động.
   - Mức độ nghiêm ngặt của kiểm tra lỗi.
   - Kích hoạt các tính năng ngôn ngữ không tiêu chuẩn.
- `#error` là một chỉ thị tiền xử lý cho phép tạo ra thông điệp lỗi tùy chỉnh. Khi trình biên dịch gặp chỉ thị này, nó sẽ dừng lại và hiển thị thông điệp lỗi mà bạn đã chỉ định.

    Chỉ thị này không làm cho mã không biên dịch, mà chỉ báo lỗi cho lập trình viên(hiển thị trên Standard Error).