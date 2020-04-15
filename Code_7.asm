;*******************************************************************
;*    Description : Multiply by 2 (doubling) using bit shifting
;*    
;*******************************************************************
    
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
;BIT SHIFT MULTIPLY BY 2 (MULTIPLY BY 2 USING REGISTERS)
CLRF STATUS
MOVWF STATUS
MOVLW .255
MOVWF 50H
RLCF 50H,1,0  ; Rotate MSB of low byte into carry
NOP
RLCF 51H,1,0  ; Rotate carry into high byte
NOP    
END



