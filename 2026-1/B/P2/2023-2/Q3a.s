/*
int acerta (int u[], int i) {
  return u[i];
}
*/
/*
DIC
rdi - u
esi - i
*/

.text
.globl acerta
acerta:
    pushq   %rbp
    movq    %rsp, %rbp

    imull   $4, %esi
    addq    %rsi, %rdi

    movl    (%rdi), %eax
    leave
    ret
