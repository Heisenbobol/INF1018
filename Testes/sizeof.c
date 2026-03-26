#include <stdio.h>
#include <immintrin.h>

int main(void) {
    printf("sizeof(char)        = %ld (%ld bits)\n", sizeof(char), 8*sizeof(char));
    printf("sizeof(short)       = %ld (%ld bits)\n", sizeof(short), 8*sizeof(short));
    printf("sizeof(int)         = %ld (%ld bits)\n", sizeof(int), 8*sizeof(int));
    printf("sizeof(long)        = %ld (%ld bits)\n", sizeof(long), 8*sizeof(long));
    printf("sizeof(long long)   = %ld (%ld bits)\n", sizeof(long long), 8*sizeof(long long));

    putchar('\n');

    printf("sizeof(float)       = %ld (%ld bits)\n", sizeof(float), 8*sizeof(float));
    printf("sizeof(double)      = %ld (%ld bits)\n", sizeof(double), 8*sizeof(double));
    printf("sizeof(long double) = %ld (%ld bits)\n", sizeof(double), 8*sizeof(double));

    putchar('\n');

    printf("sizeof(__m128)      = %ld (%ld bits)\n", sizeof(__m128), 8*sizeof(__m128));
    printf("sizeof(__m256)      = %ld (%ld bits)\n", sizeof(__m256), 8*sizeof(__m256));
    printf("sizeof(__m512)      = %ld (%ld bits)\n", sizeof(__m512), 8*sizeof(__m512));
}