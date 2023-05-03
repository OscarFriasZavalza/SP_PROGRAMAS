; Programa que guarda las entradas de RB0 a RB3 en la variable "entrada"
; y las entradas de RB4 a RB7 en la variable "entrada2".
; Luego realiza una operación AND entre "entrada" y "entrada2" y muestra el resultado en PORTA.

    LIST P=16F84A      ; Procesador PIC16F84A
    INCLUDE "P16F84A.INC"  ; Incluye las librerías

; CONFIGURACIÓN DEL PIC16F84A
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF

; Variables
    CBLOCK 0x0C
        entrada     ; Variable para almacenar las entradas de RB0 a RB3
        entrada2    ; Variable para almacenar las entradas de RB4 a RB7
        salida      ; Variable para almacenar el resultado de la operación AND
    ENDC

; Código
    ORG 0x00

START
    BSF STATUS, RP0     ; Cambiar a Banco 1
    CLRF TRISA          ; Configurar todos los pines de PORTA como salida
    MOVLW B'00001111'
    MOVWF TRISB         ; Configurar los pines RB0-RB3 como entrada

    BCF STATUS, RP0     ; Cambiar a Banco 0

; Leer los valores de entrada en RB0-RB3 y guardarlos en la variable "entrada"
    MOVF PORTB, W       ; Leer el valor de PORTB
    ANDLW B'00001111'   ; Aplicar una máscara para obtener los bits RB0-RB3
    MOVWF entrada       ; Guardar los bits RB0-RB3 en la variable "entrada"

; Leer los valores de entrada en RB4-RB7 y guardarlos en la variable "entrada2"
    SWAPF PORTB, W      ; Intercambiar los nibbles del valor de PORTB
    ANDLW B'00001111'   ; Aplicar una máscara para obtener los bits RB4-RB7
    MOVWF entrada2      ; Guardar los bits RB4-RB7 en la variable "entrada2"

; Realizar operación AND entre "entrada" y "entrada2" y guardar el resultado en "salida"
    MOVF entrada, W     ; Cargar el valor de "entrada" en W
    ANDWF entrada2, W   ; Realizar la operación AND con "entrada2" y guardar el resultado en W
    MOVWF salida        ; Guardar el resultado en la variable "salida"

; Mostrar el contenido de la variable "salida" en los pines de salida del PORTA (RA0 a RA3)
    MOVF salida, W      ; Cargar el valor de "salida" en W
    MOVWF PORTA         ; Mostrar el contenido de W en los pines de salida del PORTA

; Aquí puedes realizar cualquier operación o manipulación con las variables "entrada", "entrada2" y "salida"

    GOTO START          ; Volver al inicio
end