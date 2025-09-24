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
rbx     p
r12d    i
*/

#include <stdio.h>
#define LIM 1

#int filtro(int x, int lim);

.data   # variáveis globais inicalizadas e strings constantes
#int nums[5] = {3,-5,7,8,-2};
nums:   .int    3,-5,7,8,-2
Sf1:    .string "%d\n"
.text
int main() {
.globl main
main:
/* prologo */
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp
    movq  %rbx, -8(%rbp)
    movq  %r12, -16(%rbp)  
    
#  int i;
#  int *p = nums;   <-- vou dividir em 2 instruções mais simples
#  int *p;
#  p = nums;
    movq    $nums, %rbx

#  for (i = 0; i < 5; i++) {
#    i=0
    movl    $0, %r12d

#    while (i<5) {
    cmpl    $5, %r12d
    jge     FORA_WHILE

#    printf("%d\n", filtro(*p,LIM));
#    temp = filtro(*p,LIM);
    movl    (%rbx), %edi    # 1o argumento de 4 bytes
    movl    $1, %esi        # 2o argumento de 4 bytes
    call    filtro

#    printf("%d\n", temp);
    movq    $Sf1, %rdi      # 1o argumento de 8 bytes
    movl    %eax, %esi      # 2o argumento de 4 bytes
    movl    $0, %eax
    call    printf

#    p++;
    addq    $4, %rbx

#    i++
  }
FORA_WHILE:  
  return 0;
}
