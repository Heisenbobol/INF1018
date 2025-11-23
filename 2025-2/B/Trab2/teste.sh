#!/usr/bin/env bash

# The below commands create a binary file containing the bytes for the instruction "MOV EAX, ECX"
# and then disassemble it using objdump to show the corresponding assembly instruction.
# Finally, they remove the temporary binary file.
# Expected output:
# instrucao.bin:     file format binary
#
# Disassembly of section .data:
#00000000 <.data>:
#   0:   8b c1                   mov    eax,ecx
# Note: The actual output may vary slightly depending on the version of objdump used.
# To run this test, ensure you have objdump installed on your system.
# To execute the script, use the command: bash teste.sh
# This script is intended for educational purposes in a computer architecture course.

echo -ne "\x8B\xC1" > instrucao.bin
objdump -D -b binary -m i386:x86-64 instrucao.bin
rm instrucao.bin

# End of script
