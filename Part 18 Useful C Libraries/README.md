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

## Stdlib
- `stdlib.h` là một thư viện tiện ích chung bao gồm các hàm như Thư viện này có các hàm như tạo số ngẫu nhiên, các hàm kết thúc chương trình, 
các hàm tìm kiếm và sắp xếp, các hàm chuyển đổi và quản lý.

### Exit() function
- Chúng ta hiểu rằng chương trình sẽ tự động kết thúc khi lệnh cuối cùng trong hàm main được thực thi, hoặc khi bạn thực thi lệnh `return` từ main.
Và chúng ta thường làm điều đó trong hàm main. Khi chúng ta trả về một số nguyên, ví dụ `return 0` (**số 0 thể hiện không có lỗi**), còn **số khác 0 thể hiện có lỗi**.
- Tuy nhiên, có những lúc bạn muốn buộc chương trình **kết thúc sớm hơn**, trước khi lệnh `return` trong main được thực thi. Ví dụ, khi chương trình phát hiện một lỗi,
hoặc tệp tin cần xử lý không thể mở. Đây là những lỗi nghiêm trọng mà bạn không thể tiếp tục chạy chương trình, và cần phải **kết thúc ngay lúc đó**.
- Vì vậy, hàm `exit` buộc chương trình kết thúc giống như khi nó được thực thi bình thường. Bất kể **bạn đang thực thi ở đâu**, nó sẽ kết thúc chương trình.Điều này khác với `return`
vì nếu sử dụng `return` ta chỉ có thể kết thúc chương trình nếu nó ở trong hàm main. Do vậy `exit` chính là hàm được gọi tự động khi `main` thực hiện `return`.
- Giá trị nguyên trạng thái được gọi là trạng thái thoát (`exit status`) và có ý nghĩa tương tự như giá trị trả về từ hàm main. 
Nó có thể có giá trị `EXIT_FAILURE`, biểu thị chương trình đã thất bại, là một số không phải 0. `EXIT_SUCCESS` biểu thị chương trình đã thành công, là giá trị 0. 
Đó là lý do tại sao thường trả về 0 từ hàm main.
- Khi một chương trình kết thúc chỉ bằng việc thực thi lệnh cuối cùng trong main, trạng thái thoát của nó không được xác định.
Bạn nên kết thúc hoặc trả về từ `main` với một trạng thái thoát xác định.
- Một ví dụ mà chúng ta hay sử dụng đó là khi cần mở 1 file ta phải kiểm tra xem có mở thành công không
```C 
#include <stdio.h>
#include <stdlib.h>

FILE *openFile (const char *file){
    FILE *inFile;

    if( (inFile = fopen (file,"r"))==NULL) {
       fprintf(stderr, "Can't open %s for reading.\n",file);
       exit(EXIT_FAILURE); // thoát khỏi chương trình ngay lập tức
                           // kể cả không trong hàm main
    }
    return inFile;
}
int main(){
    FILE *file = openFile("example.txt");
    
    printf("File opened successfully!\n");
    fclose(file);

    return 0; 
}

```
### the atexit() function
- Hàm `atexit()` cho phép bạn chỉ định các hàm cụ thể khi hàm `exit` được thực thi.Bạn phải đăng ký các hàm cần gọi khi thoát chương trình.Nó nhận một đối số là con trỏ hàm
- systax : `int atexit(void (*func)(void));` đối số của nó là một con trỏ hàm và hàm này trả về kiểu int.
- Có thể đăng ký lên đến 32 hàm để được gọi khi chương trình kết thúc.Các hàm được gọi phải có kiểu trả về là void và không có tham số.

### the abort() function
- Chúng ta vừa nhắc đến rằng các hàm `atexit` và `exit` liên quan đến việc kết thúc chương trình một cách bình thường. Trong khi đó, hàm `abort` gây ra việc **kết thúc chương trình một cách bất thường**.
- Hàm `abor`t tuân theo triết lý "hỏng thì phải dừng ngay và dừng thường xuyên". Nói cách khác, nếu có lỗi nghiêm trọng xảy ra trong chương trình, bạn không nên tiếp tục vì có thể gây ra những vấn đề lớn hơn. Hàm này có nghĩa là **ngay lập tức thoát khỏi chương trình**, gọi `abort` và ghi ra tệp "`core dump`" (bản ghi lỗi chi tiết).
- Bạn có thể sử dụng tệp "`core dump`" để tìm hiểu chuyện gì đã xảy ra, giúp bạn dễ dàng hơn trong việc gỡ lỗi.

- Khi bạn gọi hàm abort, các bộ đệm file sẽ không được làm sạch (flush), các luồng không đóng, và các file tạm thời sẽ không bị xóa.
- Hàm abort có cú pháp khá đơn giản, nó không trả về giá trị nào (void) và không nhận tham số nào.
### the qsort() function

- Hàm này sẽ được nói ở trong các thuật toán sắp xếp hay gặp nhé bài này dài vl rồi 

### Một số hàm khác
- Hàm `atoi` chuyển đổi 1 chuỗi ký tự (string) thành một số nguyên kiểu `int`
```C 
#include <stdio.h> 
#include <stdlib.h>

int main(){
    char s[10]="100";
    int value = atoi(s);
    printf("value = %d\n",value);
}
```
- Hàm `atof` chuyển đổi 1 chuỗi ký tự (string) chứa một số thực thành 1 giá trị số thực kiểu `double`
```C 

#include <stdio.h>
#include <stdlib.h>

int main() {
    char str1[] = "3.14159";
    char str2[] = "abc";

    double num1 = atof(str1); // Sẽ trả về 3.1459
    double num2 = atof(str2);  // Sẽ trả về 0.0000

    printf("num1 = %f\n", num1);
    printf("num2 = %f\n", num2);

    return 0;
}
```
- Hàm `strtod` trong C được sử dụng để chuyển đổi một chuỗi ký tự thành một số thực kiểu double. 
Nó có nhiều tính năng linh hoạt hơn so với các hàm như atof, vì nó có thể phát hiện phần cuối của số trong
chuỗi và cung cấp một con trỏ cho phần tiếp theo của chuỗi.
```C 
#include <stdio.h>
#include <stdlib.h>

int main() {
    const char *str = "123.45abc";
    char *endptr;

    double num = strtod(str, &endptr);

    printf("Số được chuyển đổi: %f\n", num); // in ra 123.4500
    printf("Chuỗi còn lại sau số: %s\n", endptr);  // in ra abc

    return 0;
}
```
- Còn mấy hàm nữa mà lười viết quá haizzzzzzzzz
- Hàm `rand` là hàm trả về một số nguyên ngẫu nhiên, trong khoảng từ 0 đến `RAND_MAX`, với `RAND_MAX` là một hằng số được định nghĩa trong `stdlib.h`. 
Giá trị của `RAND_MAX` ít nhất là 32767, nhưng có thể thay đổi tùy theo hệ thống.Hàm này không cần tham số đầu vào và sẽ trả về một số nguyên ngẫu nhiên.
```C 
#include <stdio.h>
#include <stdlib.h>

int main() {
    for (int i = 0; i < 5; i++) {
        printf("Số ngẫu nhiên: %d\n", rand());
    }
    return 0;
}
```
Mỗi lần chạy chương trình, bạn sẽ nhận được một loạt số ngẫu nhiên khác nhau, 
nhưng dãy số **có thể giống nhau trong các lần chạy khác nhau** nếu không có hạt giống (seed) được thiết lập. Hạt giống đảm bảo rằng quá trình sinh số ngẫu nhiên 
có thể tái lập được. Điều này có nghĩa là, nếu bạn chạy cùng một chương trình với cùng một hạt giống, bạn sẽ nhận được 
cùng một dãy số ngẫu nhiên. Tuy nhiên, nếu bạn thay đổi hạt giống, dãy số ngẫu nhiên sẽ khác.Do vậy cần có 1 hàm để
đảm bảo các số được tạ ra là bất kỳ.

- `srand()` được sử dụng để thiết lập "hạt giống" cho hàm `rand()`. Hạt giống giúp tạo ra sự ngẫu nhiên khác biệt mỗi khi chương trình chạy. Nếu không sử dụng `srand()`, 
chương trình sẽ sử dụng một **hạt giống mặc định**, dẫn đến việc tạo ra cùng một dãy số ngẫu nhiên trong mỗi lần chạy.Giá trị truyền vào `srand()` thường là **giá trị 
thời gian hiện tại** để đảm bảo tính ngẫu nhiên.Vì thời gian thay đổi theo từng giây, mỗi lần bạn chạy chương trình, hạt giống sẽ khác nhau và dãy số ngẫu nhiên sẽ khác.
```C 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    // Đặt hạt giống là thời gian hiện tại
    srand(time(0));

    for (int i = 0; i < 5; i++) {
        printf("Số ngẫu nhiên: %d\n", rand());
    }
    return 0;
}
```
Nếu bạn muốn giới hạn số ngẫu nhiên trong một phạm vi cụ thể, bạn có thể sử dụng toán tử chia lấy dư % (modulus). 
Ví dụ, để tạo ra các số ngẫu nhiên từ 1 đến 100 `rand() % 100` tạo ra các số từ 0 đến 99 (vì chia lấy dư cho 100). Sau đó + 1 giúp chuyển dãy số thành từ 1 đến 100.
```C 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(0));  // Đặt hạt giống dựa trên thời gian

    for (int i = 0; i < 5; i++) {
        int randomNumber = rand() % 100 + 1;  // Số ngẫu nhiên từ 1 đến 100
        printf("Số ngẫu nhiên: %d\n", randomNumber);
    }
    return 0;
}
```

## Time.h
### the clock() function
- Đây là hàm đơn giản nhất để trả về một giá trị thời gian.Nó sẽ trả về thời gian của bộ xử lý chứ không phải thời gian đã trôi qua kể từ khi chương trình được sử dụng, 
tính từ một mốc tham chiếu được định nghĩa bởi trình biên dịch.Thường thì mốc này là từ khi chương trình bắt đầu thực thi.

- Giá trị trả về có kiểu đặc biệt là `clock_t`.Nó là một kiểu số nguyên được định nghĩa trong `time.h`.
Bạn thường gọi hàm `clock()` vào lúc bắt đầu và kết thúc một quá trình nào đó trong chương trình.Chênh lệch giữa hai giá trị đó là một phép đo về thời gian mà quá trình đã tiêu thụ.
Thời gian của bộ xử lý là tổng thời gian mà bộ xử lý đã thực thi cho quá trình gọi hàm `clock()`.


### the time() function
- Bạn cũng có thể lấy giá trị thời gian bằng cách sử dụng hàm `time()`.Hàm này sẽ trả về thời gian lịch dưới dạng giá trị kiểu `time_t`.Thời gian lịch là thời gian hiện tại, thường được đo bằng giây kể từ một thời điểm cố định trên một ngày nhất định.
Thời điểm cố định này thường là **00:00:00 GMT ngày 1 tháng 1 năm 1970**.Đây là cách mà giá trị thời gian thường được định nghĩa.
Mẫu hàm `time()` trả về kiểu `time_t` và nhận vào một đối số kiểu con trỏ `time_t`.Nếu đối số này không phải là NULL, thời gian lịch hiện tại cũng sẽ được lưu trữ trong biến timer.
- Kiểu `time_t` được định nghĩa trong tệp tiêu đề và thường tương đương với kiểu long.Để tính toán thời gian trôi qua tính bằng giây giữa hai giá trị `time_t` liên tiếp được trả về bởi hàm `time()`, bạn có thể sử dụng hàm `difftime()`.Hàm này trả về một giá trị kiểu double và nhận vào hai đối số kiểu `time_t`.Nó sẽ trả về giá trị của t2 - t1 được biểu diễn bằng giây dưới dạng giá trị kiểu double, tức là khoảng thời gian trôi qua giữa hai lần gọi hàm time() mà đã tạo ra các giá trị time_t t1 và t2.

- còn nữa mà lười quá chưa viết được
