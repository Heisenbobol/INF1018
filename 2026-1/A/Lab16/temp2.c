#include "temp1.h"
#include "temp2.h"
#include <stdio.h>

int b = 10;
int c;

void foo (void) {
  int d = 4;
  static int e = 5;
  a = -3;
  c = 3;
  boo(); printf("%d, %d\n", d, e);
}

static void boo (void) {
  static int e = 7;
  printf("Estou em boo %d\n", e);
}
