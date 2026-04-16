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
ecx     res
r13d    i
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
    pushq   %rbp    # salva o endereço base do RA da função chamadora
    movq    %rsp, %rbp  # cria a base do RA da função mult
    subq    $16,  %rsp  # abre espaço para o RA da função mult

    # TODO: salvar registradores callee-saved que vou usar
    movq    %r13, -8(%rbp)

    #int res = 0;
    #int res
    #res = 0
    movl    $0, %ecx

    #for(int i=0; i<b; i++) {
    #i=0
    movl    $0, %r13d

LOOP:
    #while(i<b)
    cmpl    %esi, %r13d
    jge     FORA_LOOP

    #res = soma(res, a);
    # liberar os registradores parâmetros
    movl    %edi, -12(%rbp)
    movl    %esi, -16(%rbp)
    # preparar os parâmetros
    movl    %edi, %esi  # 2o parâmetro
    movl    %ecx, %edi  # 1o parâmetro
    call    soma    # chamada da função soma
    movl    %eax, %ecx
    # restaurar os registradores salvos
    movl    -12(%rbp), %edi
    movl    -16(%rbp), %esi

    #i++
    incl    %r13d
    #}
    jmp     LOOP
FORA_LOOP:
    #return res;
    movl    %ecx, %eax
#}
    # restaurar os registradores callee-saved
    movq    -8(%rbp), %r13
    # destruir o RA
    leave
    # retornar
    ret

/*
Dicionário
Reg Var
edi a
esi b
*/
#int soma(int a, int b) {
soma:
.globl soma
    pushq   %rbp    # salva a base do RA da chamadora
    movq    %rsp, %rbp  # cria a base do RA da soma

    # salvar registradores callee-saved usados

    #return a + b;
    #tmp = a + b
    #tmp = a
    movl    %edi, %eax
    #tmp += b
    addl    %esi, %eax

    # nada precisa ser feito porque o valor já está em eax
    #return tmp
#}
    movq    %rbp, %rsp
    popq    %rbp
    ret
