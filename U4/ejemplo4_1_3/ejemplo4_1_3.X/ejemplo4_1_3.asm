;4.1.3 - Sumar 2 n�meros, almacenar el resultado en 0x0d, 
;borrar el registro SUM y borrar el acumulador W

LIST P=16F84

VAL1 EQU 0X0C
VAL2 EQU 0X0F
SUM EQU 0X0D

ORG 0

;INICIO
INICIO
	
MOVLW D'1';1->W
MOVWF VAL1;W->VAL1
MOVLW D'2';2->W
MOVWF VAL2;W->VAL2
ADDWF VAL1,W;W+VAL1 RESULTADO EN W
MOVWF SUM;W->SUM
CLRF SUM;LIMPIAMOS SUM
CLRW;LIMPIAMOSW

END