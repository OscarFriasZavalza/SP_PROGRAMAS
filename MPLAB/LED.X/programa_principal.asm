
List P=16F84A ; Procesador PIC16f84A
#include "p16f84a.inc" ;Incluye las librerias 
    
; CONFIGURACION DEL PIC16F84A
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF
 
;CODIGO
 
    ORG 0; Direccion 0 del Programa
INICIO
    BSF	   STATUS,RP0 ;SELECCIONAR EL BANCO 1: pone a 1 RP0 del registro STATUS
    CLRF   TRISB; PORTB COMO SALIDA: pone a cero el registro TRISB
    BCF	   STATUS,RP0; SELECCIONAMOS EL BANCO 0: Pone a 0 RP0 del registro STATUS
    
START
    MOVLW  B'00011000'; 8BITS -> W: El registro W se carga con  B'00011000'
    MOVWF  PORTB; W -> PORTB. RB0 - RB7:
		;El contenido del registro W se lleva al registro PORTB Los bits encendidos son los puertos seleccionados
    GOTO   START
    END