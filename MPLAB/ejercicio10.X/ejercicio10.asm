;-------------------------------------------
;----- leds y interruptores ----------
;-------------------------------------------
list p=16f84
#include "p16f84a.inc" ;Incluye las librerias 

org 0
;--- configuramos puertos ------------------
bsf STATUS,RP0 ;Ponemos a 1 el bit 5 de STATUS (03h), VAMOS AL BANCO 1
MOVLW b'11111111' ;cargamos en w '11111111'
movwf TRISA ;Configuramos TRISA (05h) como entradas
movlw b'00000000' ;Cargamos 0 en w
movwf h'06' ;Configuramos TRISB (06H) como salidas
bcf h'03',5 ;Ponemos a 0 el bit 5 de STATUS y pasamos AL BANCO 0
;----- INICIO DE PROGRAMA PRINCIPAL --------
INICIO
MOVF PORTA,0 ;Cargamos en w el valor del PORTA
movwf PORTB ;Pasamos este valor a PORTB
goto INICIO ;Bucle para pasar al INICIO del programa
end ;Final del programa