#include <stdio.h>
#include "header.h"

int a = 1;
static int z = 5;

static int fun4(int a, float b) {return a + b;}

float fun1(int a, float b) {
    int c;
    c = fun4(2*a, 3*b) + z;
    return fun2(a, b) + c;
}

int main(void) {
    int x =2;
    float y =3.13;

    printf("%lf\n", fun1(x, y));
    return 0;
}