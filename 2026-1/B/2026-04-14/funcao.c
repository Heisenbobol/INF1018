#include <stdio.h>

int filtro(int x, int limite) {
    if(x < limite) {
        return x;
    } else {
        return 0;
    }
}

int main(void) {
    int a, b;
    int res;

    a = 100;
    b = 1000;

    res = filtro(a, b);

    printf("%d filtrado por %d é %d\n", a, b, res);

    return 0;
}