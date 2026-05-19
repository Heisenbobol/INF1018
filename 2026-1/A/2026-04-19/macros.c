#include <stdio.h>

#define mult(a,b) ((a)*(b))
#define soma(a, b) ((a)+(b))

int main(void) {
    int a;
    int b;
    int c;
    int res;

    a = 5;
    b = 10;
    c = 2;
    res = mult(a+c,b);
    printf("%d * %d = %d\n", a+c, b, res);

    res = soma(a, b) * c;
    printf("(%d + %d) * %d = %d\n", a, b, c, res);

    return 0;
}