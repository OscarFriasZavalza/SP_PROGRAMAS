list p=16f84
;INICIALIZACIÓN DE VARIABLES
portb equ h'06'
timer equ h'01'
estatus equ h'03'
org 0
;SE INICIALIZAN LOS PARÁMETROS CON LOS QUE FUNCIONARÁ EL TIMER
;Y SE DEFINEN LOS PUERTOS B COMO SALIDAS
bsf estatus,5
movlw b'11010110'
movwf timer;OPTION_REG
movlw b'00000000'
movwf portb
bcf estatus,5
clrf portb
inicio
;ENCENDEMOS EL LED VERDE
bsf portb,2
bcf portb,3
bcf portb,4
;DEJAMOS PASAR EL TIEMPO
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;ENCENDEMOS EL LED AMARILLO
bcf portb,2
bsf portb,3
;DEJAMOS PASAR EL TIEMPO
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;ENCENDEMOS EL LED ROJO
bcf portb,3
bsf portb,4
;DEJAMOS PASAR EL TIEMPO
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;VOLVEMOS A EMPEZAR EN VERDE
goto inicio
;TIMER HASTA QUE SE DESBORDE AL BIT 7
temp clrf timer
bucle btfss timer,7
goto bucle
return
end