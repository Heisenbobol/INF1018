/*
void foo (double *vd, int n) {
  while (n--) {
    *vd = 0.0;
    vd++;
  }
}
*/
/*
Dicionário
Reg	Var
rdi	vd
esi	n
*/
.text
#void foo (double *vd, int n) {
.globl foo
foo:
	# criando o RA
	pushq	%rbp	# salvar o RA da função chamadora
	movq	%rsp, %rbp	# criar a base do RA da função chamada
	#subq	$???, %rsp	# espaço para o RA da função chamada

#  while (n--) {
WHILE:
	cmpl	$0, %esi
	je	FORA_WHILE
	decl	%esi

#    *vd = 0.0;
	# não existe instrução para mover constante para double (xmm?)
	# criar a constante inteira e converter para double
	movl	$0, %r10d
	cvtsi2sd	%r10d, (%rdi)

#    vd++;
	addq	$8, %rdi	# 8 porque é ponteiro para double
#  }
	jmp		WHILE
FORA_WHILE:
#}
	# destruir o RA
	movq	%rbp, %rsp
	popq	%rbp

	# retornar
	ret
