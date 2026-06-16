#include <stdio.h>


int fibo(int n) {
    int res;
    static int contador = 0;
    int inicio = 1;

    if(contador) inicio = 0;
    
    contador++;
    
    if (n <= 1) {
        res = n;
    } else {
        res = fibo(n - 1) + fibo(n - 2);
    }
    if(inicio) {
        printf("contador: %d\n", contador);
        contador = 0;
    }
    return res;
}