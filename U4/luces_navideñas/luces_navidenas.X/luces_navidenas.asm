list p=16f84
;INICIALIZACIÓN DE VARIABLES
portb equ h'06'
porta equ h'05'
timer equ h'01'
estatus equ h'03'
org 0
bsf estatus,5
;INDICAMOS LOS PARÁMETROS DEL TIMER
movlw b'11010110'
movwf timer
;PUERTOS B COMO SALIDAS
movlw b'00000000'
movwf portb
;PUERTOS A COMO ENTRADAS
movlw b'1111'
 movwf porta
bcf estatus,5
clrf portb
inicio
;PRIMERA SECUENCIA
primera
bsf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bsf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bsf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
 call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bsf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bsf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
 bcf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bsf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bsf portb,7
call temp
call temp
call temp
call temp
BTFSC porta,0
call primera
BTFSC porta,1
call segunda
BTFSC porta,2
call tercera
BTFSC porta,3
call cuarta
call inicio
;SEGUNDA SECUENCIA
segunda
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bcf portb,5
 bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bsf portb,3
bcf portb,4
bsf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bsf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bsf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bsf portb,0
bsf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bsf portb,7
call temp
call temp
 call temp
call temp
BTFSC porta,0
call primera
BTFSC porta,1
call segunda
BTFSC porta,2
call tercera
BTFSC porta,3
call cuarta
call inicio
;TERCER SECUENCIA
tercera
bsf portb,0
bsf portb,1
bcf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bsf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bsf portb,2
bcf portb,3
bcf portb,4
bcf portb,5
bsf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
 bsf portb,3
bcf portb,4
bsf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
BTFSC porta,0
call primera
BTFSC porta,1
call segunda
BTFSC porta,2
call tercera
BTFSC porta,3
call cuarta
call inicio
;CUARTA SECUENCIA
cuarta
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bsf portb,5
bsf portb,6
bsf portb,7
 call temp
call temp
call temp
call temp
bsf portb,0
bsf portb,1
bsf portb,2
bsf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bsf portb,5
bsf portb,6
bsf portb,7
call temp
call temp
call temp
call temp
bsf portb,0
bsf portb,1
bsf portb,2
bsf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
 bcf portb,0
bcf portb,1
bcf portb,2
bcf portb,3
bsf portb,4
bsf portb,5
bsf portb,6
bsf portb,7
call temp
call temp
call temp
call temp
bsf portb,0
bsf portb,1
bsf portb,2
bsf portb,3
bcf portb,4
bcf portb,5
bcf portb,6
bcf portb,7
call temp
call temp
call temp
call temp
BTFSC porta,0
call primera
BTFSC porta,1
call segunda
BTFSC porta,2
call tercera
BTFSC porta,3
call cuarta
call inicio
;TIMER
temp clrf timer
bucle btfss timer,7
goto bucle
return
end