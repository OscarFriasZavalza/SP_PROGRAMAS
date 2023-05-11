;Suma de los números 3 y 5 en decimal y almacenamos el resultado en
;0x12.
    LIST P=16F84
    SUM EQU 0X10
    RESUL EQU 0X12
    ORG 0
    
    MOVLW D'3';3->W
    MOVWF SUM;W->SUM
    MOVLW D'5';5->W
    ADDWF SUM,0 ;W+SUM RESULTADO EN W
    MOVWF RESUL ;W->RESUL RESUL=8
    END;