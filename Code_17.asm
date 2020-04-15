;*******************************************************************
;*    Description : Using PORTA and LATA
;*    
;*******************************************************************
       
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
MOVLW .55
ADDLW .55
MOVLB 2H ; SELECTING BANK 2
MOVWF 2H, 1 ; PUT VALURE INTO BANK 2 @ 200H+2H=202H
NOP
LOOP CLRF TRISA
MOVLW 0FFH
MOVWF PORTA ;
MOVLW .43
MOVWF 50H
CLRF 53H
L MOVLW .2
       MOVWF 51H
    L1 MOVLW .2
       MOVWF 52H
	L2 NOP
	DECF 52H
	BNZ L2
    DECF 51H
    BNZ L1
    DECF  50H,F
    BNZ L
MOVLW 0H    
MOVWF LATA
MOVLW .43
MOVWF 50H
CLRF 53H
O MOVLW .2
       MOVWF 51H
   O1 MOVLW .2
       MOVWF 52H
	O2 NOP
	DECF 52H
	BNZ O2
    DECF 51H
    BNZ O1
    DECF  50H,F
    BNZ O
BRA LOOP
END