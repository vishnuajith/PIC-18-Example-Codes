;********************************************************************
;*    Description : Example of Nested SubRoutine
;*    
;********************************************************************
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
;NESTED SUB ROUTINE
NOP
    MOVLW .2
    MOVWF 50H;
    CALL DELAY
    NOP
    GOTO 0FFF
ORG 1E
DELAY NOP
      MOVLW .2
      MOVWF 51H
      CALL L1
      DECF 50H
      BNZ DELAY
      RETURN
ORG 2E
L1 DECF 51H
   BNZ L1
   RETURN
END
