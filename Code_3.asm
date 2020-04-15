;*******************************************************************
;*    Description : Aplication of MOVF to check if the register has 
;*     Zero.
;*    
;********************************************************************
    

#include<p18f452.inc>
ORG 0  ;Zero status checker
MOVLW 0X80
MOVWF 15H
MOVF 55H ,f,BANKED ;TESTING ZERO STATUS (To check if it is zero)
NOP
NOP
ADDLW 1
END