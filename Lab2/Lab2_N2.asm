%include "io.inc"
section .text
global CMAIN
;7, 14, 21, 28
CMAIN:
    mov     ebp, esp; for correct debugging
    LEA     ESI, [A]
;Для извлечения первого элемента
    MOV     AL, [ESI] 
    MOV     DL, 0xFC ;маска 
    AND     AL, DL ;маскируем 
    SHR     AL, 2 ;сдвигаем биты вправо для получение искомого числа 
    PRINT_UDEC 1, AL ;выводим искомое число
    NEWLINE
;Для извлечения второго элемента
;достаем старшие 2 бита
    MOV     AL, [ESI]
    MOV     DL, 0x03
    AND     AL, DL
    SHL     AL, 4 ;ставим извлеченнные биты на нужные позиции
    MOV     BL, AL ;сохряняем старшие два бита
;достаем младшие 4 бита 
    MOV     AL, [ESI + 1] 
    MOV     DL, 0xF0
    AND     AL, DL
    SHR     AL, 4
    OR      AL, BL ;накладываем старшие и младшие биты, чтобы получить число полностью
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения третьего элемента
;достаем старшие 4 бита
    MOV     AL, [ESI + 1] 
    MOV     DL, 0x0F
    AND     AL, DL
    SHL     AL, 2
    MOV     BL, AL
;достаем младшие 2 бита 
    MOV     AL, [ESI + 2]
    MOV     DL, 0xC0
    AND     AL, DL
    SHR     AL, 6 
    OR      AL, BL
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения четвертого элемента 
    MOV     AL, [ESI + 2]
    MOV     DL, 0x3F
    AND     AL, DL
    PRINT_UDEC 1, AL
    NEWLINE
    ret
section .data
A: DB 0x1C, 0xE5, 0x5C