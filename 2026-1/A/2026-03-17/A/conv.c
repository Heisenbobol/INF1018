#include <stdio.h>

int main(void) {
    char a;
    short b;

    unsigned char x;
    unsigned short y;

    a = 25;
    b = a;
    x = a;
    y = a;

    printf("a = %hhd\n", a);
    printf("b = %hd\n", b);
    printf("x = %hhu\n", x);
    printf("y = %hu\n", y);

    puts("-------------------------");

    a = -25;
    b = a;
    x = a;
    y = a;

    printf("a = %hhd\n", a);
    printf("b = %hd\n", b);
    printf("x = %hhu\n", x);
    printf("y = %hu\n", y);

    return 0;
}