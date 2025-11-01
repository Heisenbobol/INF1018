/*
int foo (int x) {
  return x+1;
}
*/
.text
.globl foo
foo:
    pushq   %rbp
    movq    %rsp, %rbp
    movl    %edi, %eax
    incl    %eax
    leave
    ret
