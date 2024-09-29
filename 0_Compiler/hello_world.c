#include <stdio.h>
#define NUMBER 7

#define PRNT(a,b)\
    printf("value 1 = %d\n",a);\
    printf("value 2 = %d\n",b);

int main(){
    PRNT(3,4);
    printf("My favorite number is : %d\n",NUMBER);
    // this is commemt line
    printf("Hello World!!");

    return 0;
}