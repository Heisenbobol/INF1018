.data
sf:     .string "%x\n"

.text
.global main
main:
    pushq   %rbp
    movq    %rsp, %rbp

    movl    $1, %esi
    shll    $31, %esi
    movq    $sf, %rdi
    xorl    %eax, %eax
    call    printf

    leave
    ret
