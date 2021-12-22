%include "io.inc"
;a/(b-c)
;19, 24, 2
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
;переводим числа в тип IEEE 754
a: DD 0x41980000
b: DD 0x41C00000
c: DD 0x40000000
r: DD 0x00000000
