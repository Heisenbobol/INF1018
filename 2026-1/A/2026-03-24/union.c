#include <stdio.h>

union u1 {
    int a;
    int b;
};

union u2 {
    short a;
    int b;
};

int main(void) {
    union u1 x;

    x.a = 30;
    x.b = 20;

    printf("x.a: %d\n", x.a);
    printf("x.b: %d\n", x.b);

    union u2 y;
    y.b = 0x40001234;
    y.a = 0x30;
    printf("y.a: 0x%x\n", y.a);
    printf("y.b: 0x%x\n", y.b);

    return 0;
}