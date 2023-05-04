; -------------------------
; -- programa contador ----
; -- visualizar por leds --
; -- la cuenta en PORTB ---
; -------------------------
LIST p=16f84
TMRO EQU H'01' ;Registro de configuración y contador
STATUS EQU H'03' ;Registro de STATUS
PORTB EQU H'06' ;Registro Puerto B de salida
org 0
; -- CONFIGURACION DEL CONTADOR Y EL PUERTO SALIDA
BSF STATUS,5 ;Acceso al banco 1
MOVLW b'00111000' ;Configuramos TMRO como contador
MOVWF TMRO ;por flanco ascendente
MOVLW b'00000000' ;configuramos como salida
MOVWF PORTB ;el puerto B
BCF STATUS,5 ;Pasamos al banco 0
CLRF TMRO ;iniciamos el contador a 0
;-- Programa principal ---
inicio MOVF TMRO,0 ;Cargamos el contador en w
MOVWF PORTB ;Pasamos el valor cuenta al PORTB
GOTO inicio ;Bucle
END ;Final de programa