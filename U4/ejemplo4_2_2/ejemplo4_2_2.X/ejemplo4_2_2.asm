;4.2.2 Decrementar el valor 10 cinco veces 
;y almacenarlo en la direcci�n 0x2b
LIST P= 16F84

COUNT EQU 0X0B
VAL1 EQU 0X0C
VAL2 EQU 0X2B

ORG 0

;INICIO
INICIO

MOVLW D'10';10->W
MOVWF VAL1;W->VAL1
MOVLW D'5';5->W
MOVWF COUNT;W->COUNT

LOOP
DECF VAL1,1;VAL1 SE DECREMENTA EN UNA UNIDAD Y SE GUARDA EN VAR1
DECFSZ COUNT,1;DECREMENTA COUNT, SI RESULTADO ES CERO EL PROGRAMA SALTA UNA INSTRUCCION, SI ES DIFERENTE A CERO SE EJECUTA NORMAL
GOTO LOOP;NOS MANDA AL CICLO LOOP

MOVF VAL1,0;EL CONTENIDO DE VAL1 SE CARGA A W
MOVWF VAL2;EL CONTENIDO DE W SE CARGA EN VAL2

END