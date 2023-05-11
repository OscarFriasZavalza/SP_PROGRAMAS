; Decrementador de registro
; Cargamos el valor 5 en 0x0a
; Decrementamos 2 veces hasta 3
LIST p=16F84
v equ 0x0a
org 0
iniciO
movlw 0x05;MOVEMOS L A W
movwf v;MOVEMOS W A F
decf v,1;DECREMENTAMOS V Y GUARDAMOS EN V
decf v,1;DECREMENTAMOS V Y GUARDAMOS EN V
 END