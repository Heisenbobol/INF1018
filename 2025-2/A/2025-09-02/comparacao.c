#include <stdio.h>

int main(void) {
    unsigned char a;
    int b;
    float c;

    a = 0xF0;
    b = a;
    c = a;

    printf("a = %hhu, b = %d, c = %f\n", a, b, c);

    return 0;
}