.data
interno:    .int 1
.text
.globl foo
foo:
    movq    $1, %rax
    movq    $0x0102030405060708, %rax
#    movq    $externo, %rax
    movq    $interno, %rax
