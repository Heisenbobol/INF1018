#include <stdio.h>

static int wrap(int n);
int fibo(int);

int main(void) {
    int n;
    int res;

    n = 7;
    res = wrap(n);
    printf("fibo(%d) = %d\n", n, res);

    n = 10;
    res = wrap(n);
    printf("fibo(%d) = %d\n", n, res);

    return 0;
}

static int wrap(int n) {
    return fibo(n);
}