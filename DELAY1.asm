;********************************************************************
;*    Description : Implements Delay without timer
;*    
;********************************************************************

;#include<p18f452Z.inc> ;"INCLUDED TO CODE CODE-8.asm"
;ORG 0
DELAY MOVLW .1
MOVWF 50H
MOVLW .1
MOVWF 51H
MOVLW .1
MOVWF 52H     
CLRF 53H
L MOVLW .1
       MOVWF 51H
    L1 MOVLW .10
       MOVWF 52H
	L2 INCF 53H
	DECF 52H
	BNZ L2
    DECF 51H
    BNZ L1
    DECF  50H,F
    BNZ L
RETURN
;END


