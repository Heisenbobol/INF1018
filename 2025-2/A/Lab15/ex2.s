/*
float foo1 (float a, float b) {
  return sin(a) + b;
}
*/
/*
dicionário
xmm0    a (float)
xmm1    b (float)
*/

.text
.globl foo1
foo1:
    pushq   %rbp    # salva a base do RA da chamadora
    movq    %rsp, %rbp  # criando a base do RA da chamada
    subq    $16, %rsp   # abrir espaço no RA da chamadora

    # salvar os registradores callee-saved usados

    #return sin(a) + b;

    #temp = sin(a)
    cvtss2sd    %xmm0, %xmm0
    movss       %xmm1, -4(%rbp) # salvar caller-saved
    call        sin
    movss       -4(%rbp), %xmm1 # restaurar caller-saved

    #temp += b
    cvtss2sd    %xmm1, %xmm1
    addsd   %xmm1, %xmm0

    #return temp
    cvtsd2ss    %xmm0, %xmm0

    leave
    ret
