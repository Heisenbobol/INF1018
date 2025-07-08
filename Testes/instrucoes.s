.data
interno:    .int 1
.text
.globl foo
foo:
    movq    $1, %rax
    movq    $0x0102030405060708, %rax
#    movq    $externo, %rax
    movq    $interno, %rax
    movl    $0, -32(%rbp)
    movsd   .LC0(%rip),%xmm0


.LC0:
    .double 1.0
    