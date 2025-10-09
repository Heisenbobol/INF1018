/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}
*/
/*
Dicionário
Reg     Var
rdi     a
esi     n
r10d    s
r11d    i
r14d    temp (i')
*/
.text
#void foo (int a[], int n) {
.globl foo
foo:
    # criar o RA (Registro de Ativação)
    pushq   %rbp    # salvar a base do RA da chamadora
    movq    %rsp, %rbp  # apontar para a base do RA da chamada
    subq    $16, %rsp  # abrir o espaço para o RA da chamada

    # salvar os registradores callee-saved que vão ser usados
    movq    %r14, -8(%rbp)

#  int i;
#  int s = 0;
    movl    $0, %r10d

#  for (i=0; i<n; i++) {
#    i=0;
    movl    $0, %r11d

#    while(i<n) {
WHILE:
    cmpl    %esi, %r11d
    jge     FORA_WHILE

#    //s += a[i];
#    //s = s + a[i]
#    temp = a[i]
    movl    %r11d, %r14d    # i --> i'
    imull   $4, %r14d       # sizeof T * i
    addq    %rdi, %r14      # &a[i] agora está em r14

#    s += temp
    addl    (%r14), %r10d

#    if (a[i] == 0) {
    cmpl    $0, (%r14)
    jne     FORA_IF

#      a[i] = s;
    movl    %r10d, (%r14)

#      s = 0;
    movl    $0, %r10d
#    }
FORA_IF:    
#    i++
    incl    %r11d
#  }
FORA_WHILE:  
#}

    # restaurar os registradores callee-saved salvos
    movq    -8(%rbp), %r14

    # destruir o RA da função chamada e restaurar o RA da chamadora
    leave

    # retornar
    ret
