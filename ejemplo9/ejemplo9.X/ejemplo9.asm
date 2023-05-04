list p=16f84
reg equ 0x0b

 ORG 0
;-----------------------------------------------
inicio
movlw b'00001110'
movwf reg
rlf reg,1
rlf reg,1
end