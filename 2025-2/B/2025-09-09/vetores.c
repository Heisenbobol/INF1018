#include <stdio.h>

int main(void) {
    int v[5];
    int *p;

    // Está certo?
    p = v; // Sim, o nome do vetor é um ponteiro para o primeiro elemento
    //v = p; // Não, o nome do vetor é constante
    p++; // Sim, avança para o próximo elemento do vetor
    //v++; // Não, o nome do vetor é constante
    v[3] = 7; // Sim, atribui 7 ao quarto elemento do vetor
    p[3] = 8;   // Sim, atribui 8 ao quarto elemento a partir de p (v[4])
    p--;    // p aponta para o início do vetor novamente
    *(v+2) = 9;    // Sim, atribui 9 ao terceiro elemento do vetor
    *(p+1) = 10;    // Sim, atribui 10 ao segundo elemento do vetor

    printf("sizeof(v) = %zu\n", sizeof v);
    printf("sizeof(p) = %zu\n", sizeof p);
    printf("sizeof(*p) = %zu\n", sizeof(*p));
    printf("sizeof(*v) = %zu\n", sizeof(*v));
    printf("sizeof(v[0]) = %zu\n", sizeof v[0]);
    printf("sizeof(p[0]) = %zu\n", sizeof p[0]);
    printf("sizeof(int) = %zu\n", sizeof(int));

    return 0;
}