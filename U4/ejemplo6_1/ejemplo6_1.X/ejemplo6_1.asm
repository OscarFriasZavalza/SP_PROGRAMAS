;Ej 6.1 Realizar un decrementador de 255 a 0 
LIST P =16F84A

COUNT EQU 0X0B
VAR1 EQU 0X0C
PORTB EQU H'06'

ORG 0

	BSF H'03',5
	MOVLW B'00000000'
	MOVWF PORTB
	BCF H'03',5
	
INICIO

	MOVLW B'11111111'
	MOVWF VAR1

LOOP

	DECF VAR1,1
	INCFSZ COUNT,1
	MOVF VAR1,0
	MOVWF PORTB
	GOTO LOOP

END


