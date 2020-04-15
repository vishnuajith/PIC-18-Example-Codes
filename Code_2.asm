;********************************************************************
;*    Description : Doing multiplication in PIC 
;*    
;********************************************************************
    
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
MOVLW .3
MULLW .2 ; product
MOVFF PRODL,50H
NOP
MOVFF PRODH,51H
END


