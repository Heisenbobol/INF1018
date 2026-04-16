/*
#include "header.h"

int mult(int a, int b) {
    int res = 0;

    for(int i=0; i<b; i++) {
        res = soma(res, a);
    }

    return res;
}

int soma(int a, int b) {
    return a + b;
}
*/
/*
Dicionário
Reg     Var
edi     a
esi     b
r14d    res
r10d    i
*/
#include "header.h"
#define OP1 5
#define OP2 10
#int mult(int a, int b);
#int soma(int a, int b);

.text
#int mult(int a, int b) {
mult:
.globl mult
    pushq   %rbp    # salva o endereço do RA da função chamadora na pilha
    movq    %rsp, %rbp  # cria a base do RA da função mult
    subq    $32, %rsp   # abre espaço para o RA da função mult

    # salvar os registradores callee-saved que vou usar
    movq    %r14, -8(%rbp)

    #int res = 0;
    #int res
    #res = 0
    movl    $0, %r14d

    #for(int i=0; i<b; i++) {
    #int i
    #i=0
    movl    $0, %r10d

LOOP:
    #while(i<b){
    cmpl    %esi, %r10d
    jge     FORA_LOOP

    #res = soma(res, a);
    movl    %edi, -12(%rbp) # salva o valor de a no RA
    movl    %esi, -16(%rbp) # salva o valor de b no RA
    movl    %r10d, -20(%rbp)# salva o valor de i no RA
    # preparar os parâmetros
    movl    %edi, %esi      # 2o parâmetro
    movl    %r14d, %edi     # 1o parâmetro
    call    soma
    movl    %eax, %r14d     # valor de retorno em eax movido para r14d
    # restaurar os registradores salvos
    movl    -12(%rbp), %edi # restaura o valor de a
    movl    -16(%rbp), %esi # restaura o valor de b
    movl    -20(%rbp), %r10d# restaura o valor de i

    #i++
    incl    %r10d

#    }
    jmp     LOOP
FORA_LOOP:
    #return res;
    movl    %r14d, %eax

#}
    # restaurar os registradores callee-saved salvos
    movq    -8(%rbp), %r14
    # destruir o RA
    leave
    # retornar
    ret

/*
Dicionário
Reg     Var
edi     a
esi     b
r10d    tmp
*/
#int soma(int a, int b) {
soma:
.globl  soma
    # cria o RA
    pushq   %rbp
    movq    %rsp, %rbp
    #subq    $???, %rsp

    # salvar registradores callee-saved no RA
    # não usei, não precisa

    #return a + b;
    #tmp = a + b
    #tmp = a
    movl    %edi, %r10d
    #tmp += b
    addl    %esi, %r10d

    #return tmp
    movl    %r10d, %eax
#}
    # restaurar os registradores callee-saved salvos
    # ops... não salvei nenhum

    # remove o RA
    movq    %rbp, %rsp  # remove o RA
    popq    %rbp        # faz RBP apontar para o RA da chamadora

    # retornar
    ret
    