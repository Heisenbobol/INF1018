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

union U {
    char c;
    long l;
};

union Lab4 {
    unsigned int word;
    unsigned char byte[4];
};

int main(void) {
    union U u;
    union Lab4 packet;

    u.l = 0x1122334455667788;   // 11 22 33 44 55 66 77 88
    printf("u.l = %lx\n", u.l);
    printf("u.c = %hhx\n", u.c);
    u.c = 0x99;
    printf("u.l = %lx\n", u.l);
    printf("u.c = %hhx\n", u.c);

    printf("sizeof(struct s1) = %zu\n", sizeof(struct s1));
    printf("sizeof(struct s2) = %zu\n", sizeof(struct s2));
    printf("sizeof(struct s3) = %zu\n", sizeof(struct s3));

    packet.word = 0x01abcd02; // 01 ab cd 02
    printf("packet.word = %x\n", packet.word);
    printf("packet.byte[2] = %x\n", packet.byte[2]);

    return 0;
}