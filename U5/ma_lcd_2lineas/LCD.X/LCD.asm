;**************** THE WELS THEORY ******************
;Descripción: Visualizamos por el LCD la palabra 
; "Wels Theory" por 2s luego borra la pantalla por
; 1s y regresa nuevamente la palabra
;
;Para más información visita: www.thewelstheory.com
;Y sigueme en www.facebook.com/WelsTheory

List P=16F84A ; Procesador PIC16f84A
#include "p16f84a.inc" ;Incluye las librerias 
    
; CONFIGURACION DEL PIC16F84A
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF

;MEMORIA DE USUARIO
CBLOCK 0x0C
ENDC
 
;CODIGO
    ORG	0
INICIO
    CALL    LCD_Inicializa 
START
    MOVLW   1
    CALL    LCD_PosicionLinea1
    MOVLW   'E'
    CALL    LCD_Caracter
    MOVLW   'S'
    CALL    LCD_Caracter
    MOVLW   'T'
    CALL    LCD_Caracter
    MOVLW   'U'
    CALL    LCD_Caracter
    MOVLW   'D'
    CALL    LCD_Caracter
    MOVLW   'I'
    CALL    LCD_Caracter
    MOVLW   'A'
    CALL    LCD_Caracter
    
    
    CALL    LCD_UnEspacioBlanco
    
    MOVLW   'C'
    CALL    LCD_Caracter
    MOVLW   'I'
    CALL    LCD_Caracter
    MOVLW   'C'
    CALL    LCD_Caracter
    MOVLW   'L'
    CALL    LCD_Caracter
    MOVLW   'O'
    CALL    LCD_Caracter
    
    MOVLW   1
    CALL    LCD_PosicionLinea2
    MOVLW   'F'
    CALL    LCD_Caracter
    MOVLW   'O'
    CALL    LCD_Caracter
    MOVLW   'R'
    CALL    LCD_Caracter
    MOVLW   'M'
    CALL    LCD_Caracter
    MOVLW   'A'
    CALL    LCD_Caracter
    MOVLW   'T'
    CALL    LCD_Caracter
    MOVLW   'I'
    CALL    LCD_Caracter
    MOVLW   'V'
    CALL    LCD_Caracter
    MOVLW   'O'
    CALL    LCD_Caracter
    
    CALL    LCD_UnEspacioBlanco
    
  
    MOVLW   'D'
    CALL    LCD_Caracter
    MOVLW   'P'
    CALL    LCD_Caracter
    MOVLW   'E'
    CALL    LCD_Caracter
    
   
    GOTO    START
	

   INCLUDE  <C:\Assembler-Pic16F84A\Librerias\LCD.INC>
    INCLUDE  <C:\Assembler-Pic16F84A\Librerias\RETARDOS.INC>
 END
