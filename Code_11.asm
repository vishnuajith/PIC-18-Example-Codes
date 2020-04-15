;********************************************************************
;*    Description : Example for use of table pointer and table write
;*    
;********************************************************************

#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ;tableptr and TBLEwt
CLRF TBLPTRL
CLRF TBLPTRH
CLRF TBLPTRU
MOVLW 0x51
MOVWF TBLPTRL
MOVLW 55
MOVWF TABLAT    
TBLWT*
NOP
tblrd* 
MOVLW 0
nop
nop
tblrd* 
g goto g
org 50
    
ENd