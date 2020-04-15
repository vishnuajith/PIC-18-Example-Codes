;********************************************************************
;*    Description : Implementing 2s Complement
;*    
;********************************************************************
    
#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ; twos complement
NUM EQU 2H
 MOVLW NUM
 MOVWF 50H
 COMF 50H,W
 ADDLW 1H
 MOVWF 50H
END



