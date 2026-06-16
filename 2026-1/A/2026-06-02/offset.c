#include <stdio.h>

void f1(int n);
static void f2(void);

void f1(int n) {
	printf("Estou em F1 %d", n);
}

int main(void) {
	int i;
	for(i=0; i<10; i++) {
		f1(1);
		f2();
		f1(2);
		f2();
	}
	return 0;
}

static void f2(void) {
	f1(5);
}
