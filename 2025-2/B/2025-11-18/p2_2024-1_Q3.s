/*
Sabendo que:
-40(%RBP) está o vetor temp
sizeof temp[i] == 8
Supondo que:
Reg     Var
R10D    i
*/

#temp[i].tipo = i;
#temp
    leaq    -40(%rbp), %r11 # armazena o endereço de temp em r11
#temp[i]
    movl    %r10d, %r12d    # r12d tem o i auxiliar
    imull   $8, %r12d
    addq    %r11, %r12      # r12 agora tem o endereço de temp[i]
#temp[i].tipo = i;
    movl    %r10d, 4(%r12)