; -----------------------------------
; -- Programa para leer entradas
; -- y obtener salidas complementadas
; ------------------------------------
list p=16f84A
    #include "p16f84a.inc"
org 0
; -- configuramos porta y portb -----
bsf STATUS,RP0 
movlw b'11111111' 
movwf PORTB 
movlw b'00000000'
movwf PORTA 
bcf STATUS,RP0
    
inicio 
comf PORTB,0 
movwf PORTA 
goto inicio
end