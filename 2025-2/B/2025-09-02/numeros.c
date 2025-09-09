#include <stdio.h>

int main(void) {
    short x;
    char a;
    short b;
    int c;

    x = -5;     // 1111 1111 1111 1011
    printf("x = %hd = %hu\n", x, x);

    c = 388;    // 0000 0000 0000 0000 0000 0001 1000 1100
    b = c;
    a = c;
    printf("a = %hhd, b = %hd, c = %d\n", a, b, c);

    return 0;
}