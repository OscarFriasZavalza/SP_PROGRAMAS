;PROGRAMA PARA SUMAR EN BINARIO 2 Y 3 RESULTADO GUARDADO EN 0X0D
  
    LIST P=16F84
    SUMA1 EQU 0X0C
    RESUL EQU 0X0D
 
    ORG 0
    
    MOVLW b'0010'  ; PONEMOS 2 EN W
    MOVWF SUMA1 ; PASAMOS W A SUMA 1
    MOVLW b'0011' ;PONEMOS 3 EN W
    ADDWF SUMA1,0 ;SUMAMOS W COM SUMA 1 Y RESULTADO EN W
    MOVWF RESUL; PASAMOS W->F RESUL=5
    END