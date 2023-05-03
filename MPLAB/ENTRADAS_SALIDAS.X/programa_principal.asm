
List P=16F84A ; Procesador PIC16f84A
#include "p16f84a.inc" ;Incluye las librerias 
    
; CONFIGURACION DEL PIC16F84A
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF

;CODIGO

    ORG	    0
INICIO
    BSF	    STATUS,RP0; Selecciona el banco de registros 1
    CLRF    TRISB; Configura el puerto B como salida
    MOVLW   B'00011111'; Configura los primeros 5 bits del puerto A como entrada
    MOVWF   TRISA; PORTA TIENE 5 PUERTOS: ; Escribe la configuración en el registro TRISA
    BCF	    STATUS,RP0; Selecciona el banco de registros 0

START
    MOVF    PORTA,W;  ; Lee el valor del puerto A y lo mueve al registro W
    MOVWF   PORTB; ; Escribe el valor del registro W en el puerto B
    GOTO    START
    END