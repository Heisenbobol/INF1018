#include <stdio.h>

int fibo(int n);

int main(void) {
    int n;
    int res;

    n = 5;
    res = fibo(n);
    printf("Fibo(%d) = %d\n", n, res);

    n = 10;
    res = fibo(n);
    printf("Fibo(%d) = %d\n", n, res);
}
