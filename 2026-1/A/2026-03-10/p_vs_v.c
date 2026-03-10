#include <stdio.h>

int main(void) {
    char *p1;
    char p2[10] = "banana";
    char a;

    /* Isso pode? */
    p1 = p2;    // Certo!
    //p2 = p1;

    a = p1[2];  // a recebe 1o 'n'
    a = p2[2];  // a recebe 1o 'n'

    a = (*p1) +2; // a recebe 1o caractere somado de 2
    printf("*p1 +2: %hhx\n", a);
    a = *(p2 +2);   // a recebe 1o 'n'
    printf("*p2 +2: %hhx %c\n", a, a);

    a = *p1 +2; // a recebe 1o caractere somado de 2
    printf("*p1 +2: %hhx\n", a);
    a = *p2 +2;
    printf("*p2 +2: %hhx\n", a);

    printf("(*p1)++ %hhx\n", (*p1)++);
    printf("(*p2)++ %hhx\n", (*p2)++);
    
    printf("++*p1 %hhx\n", ++*p1);
    printf("++*p2 %hhx\n", ++*p2);
    
    printf("*p1++ %hhx\n", *p1++);
    //printf("*p2++ %hhx\n", *p2++);

    p1++;   // incrementa o valor ou conteúdo de p1
    //p2++;   // errado

    printf("sizeof p1: %ld\n", sizeof p1);
    printf("sizeof p2: %ld\n", sizeof p2);

    printf("texto p1: %s\n", p1);
    printf("texto p2: %s\n", p2);

    printf("&p1 = %p\n", &p1);
    printf("&p2 = %p\n", &p2);
    printf("p1 = %p\n", p1);
    printf("p2 = %p\n", p2);

    printf("*p1 = %hhx\n", *p1);
    printf("*p2 = %hhx\n", *p2);

    return 0;
}