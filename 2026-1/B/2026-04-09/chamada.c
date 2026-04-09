#include <stdio.h>

int b(short z, int y, long x) {
    return x + y + z;
}

int a(long x, int y, short z) {
    int c = b(z, y, x);
    return c;
}

int main() {
    printf("%d", a(1,2,3));
    return 0;
}
