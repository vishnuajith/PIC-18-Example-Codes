;********************************************************************
;*    Description : Selecting Bank 2 and put value into register 202H
;*    
;********************************************************************
    
#include<p18f452.inc>
ORG 0
MOVLW .55
ADDLW .55
MOVLB 2H ; SELECTING BANK 2
MOVWF 2H, 1 ; PUT VALURE INTO BANK 2 @ 200H+2H=202H
END


