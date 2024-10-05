#  Macros
## Vài điều về Macro
- Về cơ bản đây là một đoạn mã dựa trên chỉ thị `#define` . Trong phần về `#define` trước chúng ta chỉ học về việc thay thế 1 giá trị như là hằng số => đó cũng chính là **Macro**.Tuy nhiên **Macro** còn có thể thay thế các đoạn mã khác như 1 hàm ,..
- Mỗi **Macro** gồm 3 phần 
  - #define , Macro_name , Macro_body
  - Ví dụ: 
  ```C
  #define PX printf("x is %d.\n",x)
  ```

- Khi sử dụng Macro chúng ta phải tuân theo các quy tắc sau:
  - Phần tên của Macro phải là chữ **in hoa** - để phân biệt với các biến thông thường hoặc hàm giúp dễ dàng nhận ra đây là 1 macro
  - Tên của Macro **không có khoảng trắng**
  - Macro **không có dấu ;** ở cuối lần định nghĩa để kết thúc.
  - => Để tiếp tục viết định nghĩa Macro trên nhiều dòng ta phải sử dụng toán tử `\` để tiếp tục , Ví dụ :
  ```C
  #define PRNT(a,b)\
      printf("value 1 = %d\n",a);\
      printf("value 2 = %d\n",b);
   ```
   có thể thấy ta có thể tạo ra các hàm Macro nhận các đối số như 1 hàm bình thường.Khi gọi các Macro, các đối số được thay thế trực tiếp vào vị trí tương ứng trong văn bản thay thế.
##   **Macros** vs. **Functions**
  - Macro được xử lý trước khi chương trình biên dịch bằng cách thay thế. Các Functions không được xử lý trước mà chúng phải được biên soạn 
  - Về tốc độ Macro nhanh hơn Function ở các hàm nhỏ và đơn giản
  - Macro không được kiểm ra dữ liệu của tham số và không được biên dịch nó đơn giản chỉ là thay thế do đó có thể gây ra các lỗi khó phát hiện  
  - Macro dễ gây nhầm lẫn nếu không được sử dụng cẩn thận nhất là với các biểu thức phức tạp.Điều này đặc biệt nguy hiểm nếu thiếu dấu ngoặc hoặc dùng toán tử sai cách
- => Do vậy có 1 cách khác để thay thế cho Macro và Function để hạn chế nhược điểm của chúng đó chính là sử dụng `inline` 
   -  `inline` giống như Macro nó **gợi ý** cho trình biên dịch **thay thế thân hàm vào trong mã nơi gọi hàm** do vậy sẽ tối ưu được về mặt thời gian
   - `inline` cũng có khả năng kiểm tra dữ liệu  do vậy có thể dễ dàng gỡ được lỗi 
## Lưu ý khi sử dụng Macro
- Lưu ý khi sử dụng Macro : Khi sử dụng macro trong C, dấu ngoặc rất quan trọng để tránh các lỗi phát sinh do thứ tự ưu tiên trong các phép toán. Nếu bạn không sử dụng dấu ngoặc một cách đúng đắn, các toán tử có thể được ưu tiên xử lý theo cách bạn không mong muốn, gây ra kết quả sai.
  - Dấu ngoặc **bao quanh mỗi đối số** của Macro đảm bảo rằng các đối số sẽ được tính toán một cách đúng đắn trước khi sử dụng trong các phép toán của macro.
  - Dấu ngoặc **bao quanh toàn bộ định nghĩa** macro giúp đảm bảo rằng toàn bộ biểu thức sẽ được tính theo đúng thứ tự mong muốn khi macro được mở rộng.
  -  Ví dụ :
  ```C
  #define SQUARE(x) x * x
  ```
  Nếu sử dụng Macro này như sau:
  ```C
  int result = SQUARE(2 + 3);
  ```
  Kết quả nếu đúng sẽ là result=25 tuy nhiên thực tế do thứ tự ưu tiên của các toán tử macro sẽ tính rằng
  ```C
  int result = 2 + 3 * 2 + 3;
  ```
  Do đó kết quả sẽ bị sai nên khi sử dụng Macro cần phải lưu ý sử dụng các dấu ngoặc cho đối số và toàn bộ định nghĩa:
  ```C
  #define SQUARE(x) ((x) * (x))
  ```

## Các Macro được định nghĩa trước
- Có một số Macro được định nghĩa trước được định nghĩa bởi trình biên dịch.
- Chúng bắt đầu và kết thúc bằng 2 dâu gạch dưới `__`
- Chúng không thể được sử dụng trong các chỉ thị `#define` hay `#undefine`
- Không thể định nghĩa lại chúng
- Một số Macro được định nghĩa sẵn :
   - `__FILE__` đại diện cho tên của tệp mã nguồn hiện tại
   - `__LINE__` đại diện cho số dòng hiện tại trong mã nguồn **nơi nó được gọi**, là một số nguyên
   - `__func__` là tên của **hàm hiện tại đang thực hiện** khi được đặt bên trong tệp mã nguồn
   - `__DATE__` cung cấp ngày biên dịch tệp nguồn 
   - `__TIME__` cung cấp thời gian biên dịch tệp nguồn
   - `__STDC__` được dùng để kiểm tra xem trình biên dịch có tuân thủ theo tiêu chuẩn ISO C không ( là một tiêu chuẩn quốc tế cho ngôn ngữ lập trình C ) ,trả về 1 nếu có.
