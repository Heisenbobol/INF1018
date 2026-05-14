/*
int foo (int x) {
  return add(x);
}
*/
.text
foo:
.globl foo
    # salvar o RA da chamadora e criar o RA
    pushq   %rbp
    movq    %rsp, %rbp

    # salvar callee-saved

    # preparar os parâmetros
    # já estão no edi
    call    add

    # restaurar callee-saved
    # remover RA
    leave

    # retornar
    ret
