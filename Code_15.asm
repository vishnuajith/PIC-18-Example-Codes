;********************************************************************
;*    Description : ASCII to UNPACKED BCD
;*    
;********************************************************************

#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ;ASCII OF A TO UNPACKED BCD
MOVLW -.4
MOVWF 52H
MOVWF 53H
MOVLW 'A'
MOVWF 50H
MOVWF 55H
BCF STATUS,0
L1 RRCF 50H
   RRCF 51H
   INCF 52H
   BN L1
L2 RRNCF 51H
   INCF 53H
   BN L2
END
    


