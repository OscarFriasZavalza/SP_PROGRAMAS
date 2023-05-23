;**************** THE WELS THEORY ******************
;Descripci?n: Visualizar en un Display de 7 Segmentos
;Las cantidad del Puerto A.
; PORTA = 1010 -> A
;Para m?s informaci?n visita: www.thewelstheory.com
;Y sigueme en www.facebook.com/WelsTheory

List P=16F84A ; Procesador PIC16f84A
#include "p16f84a.inc" ;Incluye las librerias 
    
; CONFIGURACION DEL PIC16F84A
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF
 
;CODIGO

    ORG	    0
INICIO
    BSF	    STATUS,RP0
    CLRF    TRISB	;PORTB todo como salida
    MOVLW   B'00011111'	;CONFIGURAMOS TRIS A COMO ENTRADA
    MOVWF   TRISA	; PORTA todo como entrada
    BCF	    STATUS,RP0

START
    MOVF    PORTA,W	;LEER PORTA -> W }// 5
    ANDLW   B'00001111' ;MULTIPLICAR MASCARA
			;PARA OBTENER LOS 4 BITS MENOS SIGNIFICATIVOS DEL VALOR LEIDO
			;Esto se hace para tener solo los dígitos hexadecimales que 
			;se pueden mostrar en el display de 7 segmentos
    CALL    DISPLAY
    MOVWF   PORTB   ;GUARDAMOS EL VALOR OBTENIDO DE LA LLAMADA A LA SUBRUTINA DISPLAY
    GOTO    START
    
DISPLAY
    ADDWF   PCL,F 
    ;DT 0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67,0x77,0x7C,0x39,0x5E,0x79,0x71
    RETLW   3FH		;0
    RETLW   06H		;1
    RETLW   5BH		;2
    RETLW   4FH		;3
    RETLW   66H		;4
    RETLW   6DH		;5
    RETLW   7DH		;6
    RETLW   07H		;7
    RETLW   7FH		;8
    RETLW   67H		;9
    RETLW   77H		;A
    RETLW   7CH		;B
    RETLW   39H		;C
    RETLW   5EH		;D
    RETLW   79H		;E
    RETLW   71H		;F 
    END