/*
#include <stdio.h>

char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};

int main (void) {
  char *pc = S2;
  while (*pc) {
    if(*pc != '{' && *pc != '}') {
      printf ("%c", *pc);
    }
    pc++;
  }
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
S2: .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0

# Strings globais
Sf:     .string "%c"
Sf2:    .string "\n"

.text
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
#    pc = S2
    movq    $S2, %r12

LOOP:
#  while (*pc) {
    cmpb    $0, (%r12)
    jz      FORA_LOOP

#    if(*pc != '{' && *pc != '}') {
    cmpb    $'{', (%r12)
    je      FORA_IF
    cmpb    $'}', (%r12)
    je      FORA_IF

#      printf ("%c", *pc);
    movb    (%r12), %al
    movsbl  %al, %eax
#    movsbl  (%r12), %eax
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
#    }
FORA_IF:    
#    pc++;
    incq    %r12

#  }
    jmp     LOOP

FORA_LOOP:    

#  printf("\n");
/*************************************************************/
/* este trecho imprime o \n (estraga %eax)                  */
  movq    $Sf2, %rdi    /* primeiro parametro (ponteiro)*/
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
   
#  return 0;
#}
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/
