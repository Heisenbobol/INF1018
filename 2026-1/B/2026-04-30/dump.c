#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void) {
  int x = 0x12345678;
  short y;
  int *p;

  printf("x = %d\n", x);
  dump(&x, sizeof x);

  p = &x;
  printf("p = %p\n", p);
  dump(&p, sizeof p);

  y = (short)&x;
  printf("y = %d\n", y);
  dump(&y, sizeof y);

  return 0;
}
