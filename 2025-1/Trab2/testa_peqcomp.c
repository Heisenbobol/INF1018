#include <stdio.h>
#include "peqcomp.h"

unsigned char codigo[300];

int main(int argc, char *argv[]) {
    funcp func;
    FILE *arq;

    arq = fopen(argv[1], "r");
    func = peqcomp(arq, codigo);
    printf("==> %d\n", (*func)(2,3));
    return 0;
}
