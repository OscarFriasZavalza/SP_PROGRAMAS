; Realizar operación OR entre un registro y un literal
; Cargar un valor literal en el registro
; Realizar la operación OR con otro valor literal
; Almacenar el resultado en otro registro

LIST p=16F84
REG1 EQU 0xA0
REG2 EQU 0xA1

ORG 0

INICIO
    MOVLW B'00001100' ; Cargar un valor literal en el acumulador (W)
    MOVWF REG1 ; Mover el valor del acumulador a REG1

    IORLW B'00110000' ; Realizar operación OR entre REG1 y el valor literal del acumulador (W)

    MOVWF REG2 ; Mover el resultado de la operación OR a REG2

END