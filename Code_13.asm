;********************************************************************
;*    Description : Division using Substraction
;*    
;********************************************************************

#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0 ; Divide by any number so we subtract till we get -ve using neg flag
MOVLW .50
MOVWF 50H
MOVLW .3
CLRF 51H
LOOP INCF 51H ; QUOTIEND
SUBWF 50H,F
BNN LOOP
ADDWF 50H,F;TO GET REMAINDER
DECF 51H ;TO CORRECT QOUTIENT
END



