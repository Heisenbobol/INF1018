/*
double passa_alta(short v, int limite);

void foo(short *v, int n, long filtro) {
    int i;
    float soma = 0;

    for(i=0; i<n; i++) {
        if(v[i] > filtro) {
            soma += passa_alta(v[i], 3);
        }
    }
}
*/

/*
short *v = %rdi
int n = %esi
long filtro = %rdx
int i = %ecx
aux = %r8d
float soma = %xmm0
int i aux = %r9d
*/
/*
int i = 0;
while (i<n){
    if(v[i] > filtro){
        soma += passa_alta(v[i], 3);
    }
    i++;
}
*/

.text
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp

    movl $0, %r8d 
    cvtsi2ss %r8d, %xmm0

    movl $0, %ecx

    while:
        cmpl %esi, %ecx
        jge  fim

        movl %ecx, r9d
        imull $2, %r9d
        addq %rdi, %r9      // &v[i]

        movswq (%r9),%r8    // v[i] = (%r9) 2 bytes -> 8 bytes
        cmpq    %rdx, %r8
        jle     soma

        movq %rdi, -8(%rbp)
        movq %rdx, -16(%rbp)
        movss %xmm0, -20(%rbp)
        movl %esi, -24(%rbp)
        movl %ecx, -28(%rbp)

        movw %r8w, %di      // primero parametro
        movl $3, %esi       // Segundo parametro limite
        call passa_alta

        movss -20(%rbp), %xmm1
        ctvss2sd %xmm1,%xmm1

        addsd %xmm1, %xmm0

        ctvsd2ss %xmm0,%xmm0

        movq -8(%rbp), %rdi
        movq -16(%rbp), %rdx
        movl -24(%rbp), %esi
        movl -28(%rbp), %ecx

    soma:
        addl $1, %ecx
        
        jmp while
  
fim:
    // Nao tem val de retorno (void)
    // Nao vai precisar restaurar valores
    leave
    ret 
