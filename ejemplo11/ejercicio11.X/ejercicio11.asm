; -----------------------------------
; -- Programa para leer entradas
; -- y obtener salidas complementadas
; ------------------------------------
list p=16f84
status equ h'03'
porta equ h'05'
portb equ h'06'
org 0
; -- configuramos porta y portb -----
bsf status,5 ;accedemos banco 1
movlw b'11111111' ;entradas
movwf porta ;al puerto A
movlw b'00000000' ;salidas
movwf portb ;al puerto B
bcf status,5 ;accedemos al banco 0
; -- programa principal -------------
inicio 
comf porta,0 ;leemos portA y complementamos
movwf portb ;pasamos los datos a la salida
goto inicio ;bucle
end