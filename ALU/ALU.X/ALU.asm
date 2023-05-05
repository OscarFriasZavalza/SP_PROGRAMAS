ORG 0x00
;VARIABLES
operador1 EQU 0x0c
operador2 EQU 0x0d
resul EQU 0x0e
cont EQU 0X0f
list p=16f84
 portb equ h'06'
porta equ h'05'
timer equ h'01'
estatus equ h'03'
residuo EQU 0x20
dividendo EQU 0x21
divisor EQU 0x22
; SE DEFINEN LOS PUERTOS, ENTRADAS, SALIDAS Y TIPO DE TIMER
bsf estatus,5
movlw b'11010111'
movwf timer
movlw b'11111111'
movwf portb
movlw b'00000000'
movwf porta
bcf estatus,5
clrf portb
;REVISIÓN DE BOTONES, DEPENDIENDO DE LO QUE CONTENGAN SE DEFINEN LOS BITS DE OPERADOR 1 Y OPERADOR 2
;ENTRADA A
BTFSS portb,0
bsf operador1, 0
BTFSS portb,1
bsf operador1, 1
BTFSS portb,2
bsf operador1, 2
BTFSS portb,3
bsf operador1, 3
;ENTRADA B
BTFSS portb,4
bsf operador2, 0
BTFSS portb,5
bsf operador2, 1
BTFSS portb,6
bsf operador2, 2
BTFSS portb,7
bsf operador2, 3
;SUMA
MOVF operador2,0
ADDWF operador1,0
 MOVWF resul
CLRW
;APAGAMOS TODOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;MANDAMOS A LLAMAR AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;RESTA
MOVF operador2,0
SUBWF operador1,0
MOVWF resul
CLRW
;APAGAMOS TODOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
 bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;INCREMENTO
INCF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
 call temp
call temp
call temp
call temp
call temp
call temp
;DECREMENTO
DECF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;AND
MOVF operador2,0
ANDWF operador1,0
MOVWF resul
CLRW
 ;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;OR
MOVF operador2,0
IORWF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
 bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;XOR
MOVF operador2,0
XORWF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
 call temp
call temp
call temp
call temp
call temp
;NOT
COMF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
CLRF resul
;ROTACIÒN IZQ
CLRW
RLF operador1,0
MOVWF resul
CLRW
 ;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
bcf porta,0
BTFSC resul,4
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;ROTACIÒN DER
CLRW
RRF operador1,0
MOVWF resul
CLRW
;APAGAMOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC estatus,0
 bsf porta,3
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;MULTIPLICACIÓN
CLRW
movf operador2,0
movwf cont
movf operador1,0
;HACEMOS UN CICLO PARA SUMAR operador1 CON operador2 VECES
multiplicacion
addwf operador1,0
decf cont,1
btfsc cont,1
goto multiplicacion
movwf resul
;APAGAMOS TODOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
 BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
;DIVISIÓN
clrw
;ASIGNAMOS operador1 COMO dividendo
movf operador1,0
movwf dividendo
;ASIGNAMOS operador2 COMO divisor
movf operador2,0
movwf divisor
CLRF cont
;CICLO DE EVALUACIÓN
division
MOVF dividendo,0
MOVWF residuo
MOVF divisor,0
INCF cont,1
SUBWF dividendo,1
BTFSC estatus,0
GOTO division
DECF cont,1
MOVF cont,0
MOVWF resul
;APAGAMOS TODOS LOS LEDS
bcf porta,0
bcf porta,1
bcf porta,2
 bcf porta,3
bcf porta,4
;REVISAMOS QUE BITS DE resul ESTÁN ENCENDENDIDOS PARA ARROJAR LA SALIDA
BTFSC resul,0
bsf porta,0
BTFSC resul,1
bsf porta,1
BTFSC resul,2
bsf porta,2
BTFSC resul,3
bsf porta,3
CLRF resul
;LLAMAMOS AL TIMER
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call temp
call final
;RUTINA DE TEMPORIZACIÓN
temp clrf timer
bucle btfss timer,7
goto bucle
return
final
END