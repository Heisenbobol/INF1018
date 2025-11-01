/*
int foo (int x) {
  return add(x);
}
*/
.text
.globl foo
foo:
    pushq   %rbp
    call    add
    call    sub
    call    mult
    call    div
    popq    %rbp
    ret
