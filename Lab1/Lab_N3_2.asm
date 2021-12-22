%include "io.inc"
;12, 12, 15
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;записываем числа в регистры
    MOV     AX, 0x0C
    MOV     BX, 0x0C
    MOV     CX, 0x0F
    CMP     AX, BX ;сравниваем 12 и 12
    JE  true
    CMP     BX, CX ;сравниваем 12 и 15
    JE  true
    CMP     AX, CX ;сравниваем 12 и 15
    JE  true
    PRINT_DEC 1, 0
    JMP quit
true:
    PRINT_DEC 1, 1
quit:        
    ret