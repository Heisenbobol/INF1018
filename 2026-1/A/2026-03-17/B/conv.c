#include <stdio.h>

int main(void) {
    char a;
    short b;

    unsigned char x;
    unsigned short y;

    a = 25; //           0001 1001
    b = a;  // 0000 0000 0001 1001
    x = a;  // 0001 1001
    y = a;  // 0000 0000 0001 1001

    printf("a = %hhd\n", a);
    printf("b = %hd\n", b);
    printf("x = %hhu\n", x);
    printf("y = %hu\n", y);

    puts("-----------------");

    a = -25;//           1110 0111
    b = a;  // 1111 1111 1110 0111
    x = a;  //           1110 0111
    y = a;  // 1111 1111 1110 0111

    printf("a = %hhd\n", a);
    printf("b = %hd\n", b);
    printf("x = %hhu\n", x);
    printf("y = %hu\n", y);

    return 0;
}