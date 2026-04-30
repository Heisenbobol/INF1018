#include <stdio.h>

union Registrador_10 {
    unsigned long r10;
    unsigned int r10d;
    unsigned short r10w;
    unsigned char r10b;
};

int main(void) {
    union Registrador_10 reg10;

    reg10.r10 = 0x123456789ABCDEF0;
    printf("Valor de r10: 0x%lx\n", reg10.r10); // 0x123456789abcdef0
    printf("Valor de r10d: 0x%x\n", reg10.r10d); // 0x9abcdef0
    printf("Valor de r10w: 0x%x\n", reg10.r10w); // 0xcdef0
    printf("Valor de r10b: 0x%x\n", reg10.r10b); // 0xf0

    reg10.r10d = 0x11223344;

    printf("Valor de r10: 0x%lx\n", reg10.r10); // 0x1234567811223344
    printf("Valor de r10d: 0x%x\n", reg10.r10d); // 0x11223344
    printf("Valor de r10w: 0x%x\n", reg10.r10w); // 0x3344
    printf("Valor de r10b: 0x%x\n", reg10.r10b); // 0x44

    return 0;
}