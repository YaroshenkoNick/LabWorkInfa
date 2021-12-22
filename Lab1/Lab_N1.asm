%include "io.inc"
;a/(b-c)
;19, 24, 2
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    XOR     DX, DX ;обнуляем регистр DX, так как старшие биты делимого берутся из него 
    ;записываем числа в регистры
    MOV     AX, 0x13
    MOV     BX, 0x18
    MOV     CX, 0x02
    SUB     BX, CX   ;24-2=22 
    DIV     BX       ;19/22=0 (остаток 19) 
    PRINT_UDEC 2, AX ;выводим целую часть делимого
    NEWLINE
    PRINT_UDEC 2, DX ;выводим остаток от деления
     
     
    NEWLINE
;26, 20, 7    
    XOR     DX, DX ;обнуляем регистр DX, так как старшие биты делимого берутся из него 
    ;записываем числа в регистры
    MOV     AX, 0x1A
    MOV     BX, 0x14
    MOV     CX, 0x07
    SUB     BX, CX ;20-7=13
    DIV     BX     ;26/13=2 
    PRINT_UDEC 2, AX ;выводим целую часть делимого
    NEWLINE
    PRINT_UDEC 2, DX ;выводим остаток от деления
    ret