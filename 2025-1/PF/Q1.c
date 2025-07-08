#include <stdio.h> 
void dump (void *p, int n) { 
unsigned char *p1 = (unsigned char *) p; 
long pFake = 0x64C631E99010L;
    while (n--) { 
        printf("%08lX - %02X\n", pFake, *p1); 
        p1++;
        pFake++;
    } 
} 
struct { 
   double d; 
   int i; 
   int *g; 
} s = {-520.125, -17, &s.i}; 
  
int main (void) { 
   dump (&s, sizeof s); 
   return 0; 
} 