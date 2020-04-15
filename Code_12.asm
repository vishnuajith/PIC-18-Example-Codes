;********************************************************************
;*    Description : Packed BCD to unpacked BCD
;*    
;********************************************************************
    
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0 ; Converting 2 packed BCD to unpacked BCD
MOVLW 75H
MOVWF 50H
MOVLW -.4 ;FOR LOOP
MOVWF 55H
CLRF 51H
BCF STATUS,0
L1 RRCF 50H
   RRCF 51H
   INCF 55H
   BNZ L1
MOVLW .4   
MOVWF 55H
L2 RRNCF 51H
   INCF 55H
   BNZ L2
NOP    
END    


