#include <stdio.h>

int main() {
    int a = 512;
    int b;
    int n;

    n = 2;
    b = a << n; // Left shift by n (equivalent to multiplying by 4)
    printf("%d << %d = %d\n", a, n, b);

    n = 64;
    b = a << n; // Left shift by n (equivalent to multiplying by 4)
    printf("%d << %d = %d\n", a, n, b);

    scanf("%d", &n);
    b = a << n; // Left shift by user-defined n
    printf("%d << %d = %d\n", a, n, b);

    return 0;
}