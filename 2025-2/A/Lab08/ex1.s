/*
  #include <stdlib.h>
  int main() {
    system("ls -ls");
    return 0;
  }
*/

.data   # dados globais inicializados e strings constantes
s1: .string "ls -ls"

.text
.globl main
main:
/* prologo */
    pushq %rbp
    movq  %rsp, %rbp

  /* coloque seu codigo aqui */
#    system("ls -ls");
    # a função system tem 1 argumento
    # o 1o argumento tem 8 bytes
    movq    $s1, %rdi
    call    system

#    return 0;
    movl    $0, %eax

  /* finalizacao */
    leave
    ret
