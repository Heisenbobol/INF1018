#include "temp1.h"
#include "temp2.h"
#include <stdio.h>

int b = 10;

void foo (void) {
  int c = 5;
  static int e = 7;
  a = -3;
  printf("%d%d\n", c, e);
  boo();
}

static void boo(void) {
  static int e = 9;
  printf("Estou em boo %d\n", e);
}