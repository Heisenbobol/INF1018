#include <stdio.h>
#include "header.h"

// extern int a;
int a=0;

float fun2(float a, int b) { return a + b; }
static int fun4(int x) {return x+1;}

int main(void) {
    int i =1;
    float f = 3.14;
    static int j = 4;

    i = fun1(i, f);
    printf("%d %d\n", i, fun4(j));

    return 0;
}
