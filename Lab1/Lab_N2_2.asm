%include "io.inc"
;a/(b-c)
;26, 20, 7 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;заносим переменные в стек
    FLD DWORD [a]
    FLD DWORD [b]
    FLD DWORD [c]
    FSUB ;вычитаем c из b c
    FDIV ;делим a на (b-c)
    FST DWORD [r] ;результат запишем в переменную r
    ret
section .data
a: DD 0x41D00000
b: DD 0x41A00000
c: DD 0x40E00000
r: DD 0x00000000
