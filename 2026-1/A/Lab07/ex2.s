/*
#include <stdio.h>

char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};

int main (void) {
  char *pc = S2;
  while (*pc)
    printf ("%c", *pc++);
  printf("\n");
  return 0;
}
*/
/*
Dicionário
Reg Var
r12 pc
*/
#include <stdio.h>

.data
#char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};
S2: .byte   65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0

#int main (void) {
main:
.globl main
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

#  char *pc = S2;
#    char *pc
    #pc = S2
    movq    $S2, %r12

#  while (*pc)
    cmpb    $0, (%r12)
    je      FORA_LOOP

    printf ("%c", *pc++);
  printf("\n");
  return 0;
}

