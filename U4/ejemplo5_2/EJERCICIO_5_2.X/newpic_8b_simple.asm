__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF

    LIST P=16F84A
   #include "p16f84a.inc"
   ORG 0
   ;CONFIGURAMOS PORTA Y PORTB
   BSF STATUS,RP0
   MOVLW B'00001111'
   MOVWF TRISA
   MOVLW B'00000000'
   MOVWF TRISB
   BCF STATUS,RP0
   
   INICIO
   MOVF PORTA,0
   ANDLW B'00001111'
   MOVWF PORTB 
   GOTO INICIO
   END
   