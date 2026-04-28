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
r8     paux
*/
.text
#void map2 (int* um, int * outro, int n) {
map2:
.globl  map2
    pushq   %rbp    # salva a base do RA da chamadora
    movq    %rsp, %rbp  # cria a base do RA da chamada
    subq    $32, %rsp   # abre espaço para o RA da chamada

    # salvar os registradores callee-saved USADOS!!!

  #int i;

  #for (i=0; i<n; i++) {
    #i=0
    movl    $0, %ecx

WHILE:
    #while(i<n) {
    cmpl    %edx, %ecx
    jge     FORA_WHILE

    #*(outro+i) = f(*(um+i));
    #paux = um+i
    #paux = i
    movl    %ecx, %r8d

    #paux += um
    # não precisa converter de para 8 bytes
    # porque a parte alta já está com 0 (zero)
    imulq   $4, %r8
    addq    %rdi, %r8

    # salvar registradores caller-saved necessários
    movq    %rdi, -8(%rbp)
    movq    %rsi, -16(%rbp)
    movl    %edx, -20(%rbp)
    movl    %ecx, -24(%rbp)
    #param1 = *paux
    movl    (%r8), %edi # 1o parâmetro

    #temp = f(parm1)
    call    f

    # restaurar os registradores caller-saved salvos
    movq    -8(%rbp), %rdi
    movq    -16(%rbp), %rsi
    movl    -20(%rbp), %edx
    movl    -24(%rbp), %ecx

    #paux = outro+i
    #paux = i
    movl    %ecx, %r8d

    #paux += outro
    imulq   $4, %r8
    addq    %rsi, %r8

    #*paux = temp
    movl    %eax, (%r8)

    #i++
    incl    %ecx

#  }
    jmp     WHILE
FORA_WHILE:

#}

    # restaurar registradores callee-saved salvos

    # remover o RA
    movq    %rbp, %rsp  # destroi o RA
    popq    %rbp    # restaura a base do RA da chamadora

    # retornar
    ret
