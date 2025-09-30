/*
int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}
*/
/*
rip -> ponteiro para a próxima instrução
rsp -> ponteiro para o topo da pilha
rbp -> ponteiro para a base do RA
*/
/*
Dicionário
Reg     Var
edi     n
*/

.text

#int fat (int n) {
.globl  fat
fat:
    pushq   %rbp    # salva o valor da base do RA da função chamadora na pilha
                    # também realinhou a pilha com endereço múltiplo de 16
    movq    %rsp, %rbp  # cria a base do ra da função chamada
    subq    $16, %rsp  # abre espaço para o RA da função chamada

    # TODO: salvar os registradores callee-saved usados pela função chamada
    movq    %r13, -8(%rbp)

#    if (n==0) {
    cmpl    $0, %edi
    jne     ELSE

#        return 1;
    movl    $1, %eax
    jmp     RETORNAR

#    } else {
ELSE:
#//        return n*fat(n-1);
#        temp = n
    movl    %edi, %r13d

#        temp = temp-1
    decl    %r13d

#        result = fat(temp);
    movl    %edi, -12(%rbp) # salva o edi no RA
    movl    %r13d, %edi     # 1o parâmetro
    call    fat
    movl    -12(%rbp), %edi # restaura o valor do edi

#        result = result * n
    imull   %edi, %eax  # o valor retornado está em eax

#        return result
    # não precisa fazer nada porque o valor a ser retornado já está em eax
#    }
#}
RETORNAR:
    # restaurar os registradores callee-saved
    movq    -8(%rbp), %r13

    # destruir o RA
#    leave
#   OU!!!!
    movq    %rbp, %rsp  # libera o RA da função chamada
    popq    %rbp        # restaura o RA da função chamadora

    # retonar
    ret

