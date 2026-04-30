/*
int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}
*/
#int f(int x);

/*
Dicionário
Reg     Var
rdi     um
rsi     outro
edx     n
ecx     i
rbx     paux
*/
.text
#void map2 (int* um, int * outro, int n) {
map2:
.globl map2
    pushq   %rbp    # salva a base do RA da chamadora
    movq    %rsp, %rbp  # cria a base do RA da chamada
    subq    $32, %rsp  # abre espaço para o RA da chamada

    # salvar registradores callee-saved USADOS pela map2!!!
    movq    %rbx, -8(%rbp)

#  int i;
#  for (i=0; i<n; i++) {

#i=0
    movl    $0, %ecx

WHILE:
#while(i<n) {
    cmpl    %edx, %ecx
    jge     FORA_WHILE

#    *(outro+i) = f(*(um+i));
#paux = um + i
#paux = i
    movl    %ecx, %ebx
#paux += um
# não precisa converter ecx para rcx porque os 4 bytes mais altos
# já estão com 0 (zero)
    imulq   $4, %rbx
    addq    %rdi, %rbx

#param1 = *paux
    # salva os registradores caller-saved usados pela map2
    # porque a função f vai modificar os valores desses registradores
    movq    %rdi, -16(%rbp)
    movq    %rsi, -24(%rbp)
    movl    %edx, -28(%rbp)
    movl    %ecx, -32(%rbp)

#temp = f(parm1)
    movl    (%rbx), %edi    # 1o parâmetro
    call    f

    # restaura os registradores caller-saved salvos
    movq    -16(%rbp), %rdi
    movq    -24(%rbp), %rsi
    movl    -28(%rbp), %edx
    movl    -32(%rbp), %ecx

#paux = outro + i
#paux = i
    movl    %ecx, %ebx
#paux += outro
    imulq   $4, %rbx
    addq    %rsi, %rbx

#*paux = temp
    movl    %eax, (%rbx)

#i++
    incl    %ecx
#  }
    jmp     WHILE
FORA_WHILE:  
#}
    # restaurar os valores dos registradores callee-saved
    movq    -8(%rbp), %rbx

    # detruir o RA
    leave

    # retornar
    ret
