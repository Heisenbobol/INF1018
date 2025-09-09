#include <stdio.h>

struct s1 {
    int a;
    int b;
};

struct s2 {
    int a;
    char c;
    int b;
};

struct s3 {
    int a;
    int b;
    char c;
};

struct s4 {
    long l;
    char c;
};

struct s5 {
    char c;
    long l;
};

union U {
    char c;
    long l;
};

union Lab4 {
    unsigned word;
    unsigned char byte[4];
};

int main(void) {
    int v[5];
    int *p;
    union U u;
    union Lab4 packet;

    u.l = 0x1122334455667788;
    printf("u.l = 0x%lx\n", u.l);
    printf("u.c = 0x%hhx\n", u.c);

    u.c = 0x99;
    printf("u.l = 0x%lx\n", u.l);
    printf("u.c = 0x%hhx\n", u.c);

    printf("sizeof(v) = %zu\n", sizeof v);
    printf("sizeof(p) = %zu\n", sizeof p);
    printf("sizeof(*p) = %zu\n", sizeof *p);
    printf("sizeof(v[0]) = %zu\n", sizeof v[0]);
    printf("sizeof(int) = %zu\n", sizeof(int));

    printf("Tamanho de s1 = %zu\n", sizeof(struct s1));
    printf("Tamanho de s2 = %zu\n", sizeof(struct s2));
    printf("Tamanho de s3 = %zu\n", sizeof(struct s3));
    printf("Tamanho de s4 = %zu\n", sizeof(struct s4));
    printf("Tamanho de s5 = %zu\n", sizeof(struct s5));

    // Está certo?
    p = v;  // sim, o nome do vetor é o endereço do primeiro elemento
    //v = p;  // não, o nome do vetor é constante
    p++;    // sim, avança para o próximo elemento do vetor
    //v++;   // não, o nome do vetor é constante

    v[3] = 7;   // sim, atribui 7 ao quarto elemento do vetor
    p[3] = 8;   // sim, atribui 8 ao quarto elemento a partir de p (que é v+1)
                // ou seja, atribui 8 ao quinto elemento do vetor
    p--;      // sim, volta para o primeiro elemento do vetor
    *(v+2) = 10;    // sim, atribui 10 ao terceiro elemento do vetor
    *(p+1) = 11;    // sim, atribui 11 ao segundo elemento do vetor  
 
    packet.word = 0x01abcd02;   // 0x01 0xab 0xcd 0x02
    printf("packet.word = 0x%x\n", packet.word);
    printf("packet.byte[2] = 0x%x\n", packet.byte[2]);  

    return 0;
}