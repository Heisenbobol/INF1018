#include <stdio.h>

int fibo(int n) {
    static int contador = 0;
    int inicio = 1;
    if(contador) inicio = 0;
    int res;
    contador++;
    if (n <= 1) {
        res = n;
    } else {
        res = fibo(n - 1) + fibo(n - 2);
    }
    if(inicio) {
        printf("Contador %d\n", contador);
        contador = 0;
    } 
    return res;
}
