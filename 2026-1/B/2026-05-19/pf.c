#include <stdio.h>

int main(void) {
    int x, y;
    float a;
    double b;

    y = 0x40000099;
    a = y;
    b = y;
    x = a;

    printf("a = %f\nb = %f\nx = %d\ny = %d\n", a, b, x, y);

    if(x==y) puts("Igual\n");
    else puts("Diferente\n");
    
    return 0;
}