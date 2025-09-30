#include <stdio.h>

int fat (int n);

int main() {
    int n;
    int result;

    n = 5;
    result = fat(n);
    printf("Fatorial de %d = %d\n", n, result);
    
    return 0;
}