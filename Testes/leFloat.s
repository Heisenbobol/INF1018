.text
.globl leFloat
leFloat:
    pushq   %rbp
    movq    %rsp, %rbp

    movsd   .LC0(%rip), %xmm0

    leave
    ret

.LC0:
    .double 1.0
