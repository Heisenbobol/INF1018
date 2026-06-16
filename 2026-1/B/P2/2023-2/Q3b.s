/*
struct S {
    int v;
    struct S *prox;
};

extern int norma[];

int boo(struct S *s, int n) {
    int acum = 0;
    while (s) {
        s->v = acerta(norma, n + acum);
        acum += n;
        s = s->prox;
    }
    return acum;
}
*/
/*dicionario:
%rdi s
%esi n
%ebx acum 
*/
.text
.globl boo
boo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    movq    %rbx, -8(%rbp)  

    movl    $0, %ebx

.L2:
    cmpq    $0, %rdi
    je      .Fora_Loop

    movq   %rdi, -16(%rbp)
    movl   %esi, -20(%rbp)

    movq   $norma, %rdi
    addl   %ebx, %esi

    call    acerta

    movq    -16(%rbp), %rdi
    movl    -20(%rbp), %esi

    movl    %eax, (%rdi)
    addl    %esi, %ebx

    movq    8(%rdi), %rdi

    jmp     .L2

.Fora_Loop:
    movl    %ebx, %eax
    movq    -8(%rbp), %rbx

    leave 
    ret

