#include <stdio.h>
#include "header.h"

int main() {
    int a, b;
    int res;

    a = OP1;
    b = OP2;

    res = mult(a, b);
    printf("%d x %d = %d\n", a, b, res);

    return 0;
}