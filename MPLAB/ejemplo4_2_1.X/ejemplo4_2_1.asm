;4.2.1 Restar dos n�meros binarios 
;y almacenar el resultado en la direcci�n 0x10
LIST P=16F84

VAL1 EQU 0X0A
VAL2 EQU 0X0B
RES1 EQU 0X10

ORG 0

;INICIO
INICIO

MOVLW B'0011';0011->W
MOVWF VAL1;W->VAL1
MOVLW B'0010';0010->W
MOVWF VAL2;W->VAL2
MOVF VAL2,W;VAL2->W
SUBWF VAL1,W;VAL1-W 
MOVWF RES1;RES1=1

END