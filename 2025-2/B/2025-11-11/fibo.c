#include <stdio.h>

int maximo;

int fibo(int n) {
    static int qtd = 0;
    qtd++;
    maximo = qtd > maximo? qtd : maximo;
    if(n <= 1) return n;
    else return fibo(n-1) + fibo(n-2);
}

int main(void) {
    int n;
    maximo = 0;

    printf("Entre com o número: ");
    scanf("%d", &n);
    printf("fibo(%d) = %d\n", n, fibo(n));
    printf("Qtd de chamadas = %d\n", maximo);

    return 0;
}