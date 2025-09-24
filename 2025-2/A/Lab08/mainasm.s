/*
#include <stdio.h>
#define LIM 1

int filtro(int x, int lim);

int nums[5] = {3,-5,7,8,-2};

int main() {
  int i;
  int *p = nums;
  for (i = 0; i < 5; i++) {
    printf("%d\n", filtro(*p,LIM));
    p++;
  }
  return 0;
}
*/
/*
Dicionário
Reg     Var
r12     p
ebx     i
*/

#include <stdio.h>
#define LIM 1

#int filtro(int x, int lim);

.data   # dados inicializados e strings constantes
#int nums[5] = {3,-5,7,8,-2};
nums:   .int 3,-5,7,8,-2
Sf1:    .string "%d\n"

.text
#int main() {
.globl main
main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

#  int i;
#  int *p = nums;   <-- vou quebrar essa linha em 2 linhas mais simples
#  int *p;
#  p = nums;
    movq    $nums, %r12

#  for (i = 0; i < 5; i++) {
#    i=0;
    movl    $0, %ebx

WHILE:
#    while(i<5) {
    cmpl    $5, %ebx
    jge     FORA_WHILE

#    printf("%d\n", filtro(*p,LIM));    <-- quebrar em 2 linhas mais simples
#    temp = filtro(*p,LIM)
    movl    (%r12), %edi    # 1o argumento
    movl    $1, %esi        # 2o argumento
    call    filtro

#    printf("%d\n", temp);
    movq    $Sf1, %rdi
    movl    %eax, %esi
    movl    $0, %eax
    call    printf

#    p++;
    addq    $4, %r12

#    i++;
    incl    %ebx

#  }
    jmp     WHILE

FORA_WHILE:
#  return 0;
    movl    $0, %eax

#}
/* finalizacao */
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    leave
    ret
