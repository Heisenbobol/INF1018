/*
int foo (int x) {
  return x+1;
}
*/

.text
# label da função
.globl foo
foo:
    # criar o RA da função
    pushq   %rbp
    movq    %rsp, %rbp
    #subq    $???, %rsp

    # salvar callee-saved usados na função

    # return x + 1
    movl    %edi, %eax
    incl    %eax

    # restaurar os callee-saved que foram salvos

    # remover o RA
    # restaurar o RA da função chamadora
    leave

    # retornar
    ret
