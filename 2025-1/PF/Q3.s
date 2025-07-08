/*
int calculaIndice(int valor); 
double trata(int u); 

float foo (int v[], int n) {  
   double m = 1.0; 
   int i; 
   int indice; 
  
   for(i=0; i< n; i++) { 
      indice = calculaIndice(i); 
      m *= trata(v[indice]); 
   } 
   return m; 
}
*/
/*
Dicionário
v  RDI
n  ESI
m  XMM0
i  EBX
*/
.text
.globl foo
foo:
# float foo (int v[], int n) {

   pushq %rbp
   movq  %rsp, %rbp
   subq  $32, %rsp

   movq  %rbx, -8(%rbp)

#   double m = 1.0; 
   movl  $1, %eax
   cvtsi2sd %eax, %xmm0

#   int i; 
#   int indice; 
  
#   for(i=0; i< n; i++) { 
#   i = 0;
   movl  $0, %ebx

WHILE:
#   while i<n
   cmpl  %esi, %ebx
   jge   FIM_WHILE

   movq  %rdi, -16(%rbp)
   movsd %xmm0, -24(%rbp)
   movl  %esi, -28(%rbp)

#      indice = calculaIndice(i); 
   movl  %ebx, %edi
   call  calculaIndice

#      m *= trata(v[indice]); 
   imulq $4, %rax
   addq  -16(%rbp), %rax

   movl  (%rax), %edi
   call  trata

   movq  -16(%rbp), %rdi
   mulsd -24(%rbp), %xmm0
   movl  -28(%rbp), %esi

#      i++
   incl  %ebx

#   } 
   jmp   WHILE
FIM_WHILE:

#   return m;
   cvtsd2ss %xmm0, %xmm0

#}
   movq  -8(%rbp), %rbx

   leave
   ret
