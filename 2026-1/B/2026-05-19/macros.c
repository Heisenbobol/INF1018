#include <stdio.h>

#define soma(a,b)   ((a)+(b))
#define mult(a,b)   ((a)*(b))

int main(void) {
    int a, b, c;
    int res;

    a = 5;
    b = 10;
    c = 2;
    res = mult(a+c,b);
    printf("%d * %d = %d\n", a+c, b, res);

    res = soma(a,b);
    printf("%d + %d = %d\n", a, b, res);

    res = soma(a,b)*2;
    printf("(%d + %d) x %d = %d\n", a, b, c, res);

    return 0;
}