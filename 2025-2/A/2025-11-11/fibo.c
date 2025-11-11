#include <stdio.h>

int fibo(int n) {
    static int qtd =0;
    qtd++;
    printf("Quantidade = %d\n", qtd);
    if(n <= 1) return n;
    else return fibo(n-1) + fibo(n-2);
}

int main(void) {
    int n;
    printf("Entre com o número: ");
    scanf("%d", &n);
    printf("fibo(%d) = %d\n", n, fibo(n));
    return 0;
}