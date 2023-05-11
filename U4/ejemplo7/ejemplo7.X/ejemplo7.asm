;REALIZAR UNA OPERACION AND ENTRE DOS REGISTROS
;-------------------------------------
list p=16f84
reg1 equ 0xa0
reg2 equ 0xa1
res equ 0xa2
org 0
;-------------------------------------
inicio
    movlw b'01110011' ; cargamos 73H en w (73H = 01110011)
    movwf reg1 ; enviamos a reg1 (reg1 -> 01110011)
    movlw b'01010101' ; cargamos en w 55H (55H = 01010101)
    movwf reg2 ; movemos 01010101 a reg2
    andwf reg1, 0 ; realizamos AND entre w y reg1 y lo almacenamos en w
    movwf res ; movemos el resultado al registro de resultados res
end
;-------------------------------------