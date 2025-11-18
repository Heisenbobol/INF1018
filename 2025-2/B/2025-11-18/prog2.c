#include <stdio.h>
void f2(void);
short s = 101;
int main(void) {
printf("s = %08hx\n", s);
f2();
return 0;
}