/*
struct exam { float val; int tipo; };
double inv (double val);
float boo (double d, float bias) {
  int i;
  struct exam temp[5];
  for (i=0; i<5; i++) {
    temp[i].val = inv(d);
    temp[i].tipo = i;
  }
  return temp[0].val + bias;
}
*/
/*
Dicionário
Reg     Var     tamanho
xmm0    d       double 8 bytes
xmm1    bias    float  4 bytes
r11d    i
*/
#struct exam { float val; int tipo; };
#double inv (double val);
.text
#float boo (double d, float bias) {
.globl boo
boo:
    # criar o RA da função chamada
    pushq   %rbp        # salva o RA da função chamadora no topo da pilha
    movq    %rsp, %rbp  # criar a base do RA da função chamada
    subq    $64, %rsp  # abre espaço no RA da função chamada

#  int i;
#  struct exam temp[5];
#  for (i=0; i<5; i++) {
#    i=0
    movl    %0, %r11d

#    while(i<5) {
WHILE:
    cmpl    $5, %r11d
    jge     FORA_WHILE

#        temp[i].val = inv(d);
#        aux = inv(d);
    # antes de chamar a função, salvar os reg caller-saved usados
    movsd   %xmm0, -48(%rbp)
    movss   %xmm1, -52(%rbp)
    movl    %r11d, -56(%rbp)

    # preparar os parâmetros
    # nada precisa ser feito agora
    # o parâmetro também é double
    # e o valor já está como double em xmm0
    call    inv
    movsd   %xmm0, xmm2 # salva o valor de retorno 

    # restaurar os registradores caller-saved salvos
    movsd   -48(%rbp), %xmm0
    movss   -52(%rbp), %xmm1
    movl    -56(%rbp), %r11d

#        temp[i].val = aux
#    paux = temp[i]
    movl    %r11d, %esi # esi -> valor de i temporário
    imull   $8, %esi            # 8 é o tamanho de cada posição de temp
    leaq    -40(%rbp), %rcx     # endereço de temp em rcx
    addq    %rcx, %rsi          # temp + i -> rsi /// paux = rsi = &temp[i]

#    *paux = aux
    movsd   %xmm2, (%rsi)

#        temp[i].tipo = i;
#    *paux = i
    movl    %r11d, 4(%rcx)

#        i++
    incl    %r11d
#  }
    jmp     WHILE
FORA_WHILE:

#  return temp[0].val + bias;
#  paux = temp[0]
    leaq    -40(%rbp), %rcx

#  aux = val
    movss   (%rcx), %xmm0

#  aux += bias
    addss   %xmm1, %xmm0
#  return aux
    # valor de retorno já está em xmm0
#}
    # destruir o RA
    leave

    # retornar
    ret
