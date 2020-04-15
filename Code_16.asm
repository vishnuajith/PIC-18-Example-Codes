;*******************************************************************
;*    Description : Square wave output on PIN RB1 using Delay.asm
;*    
;*******************************************************************
    
#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ; Square wave On PIN 2
CLRF TRISB
BCF PORTB,1
LED BTG PORTB,1
CALL DELAY ; DELAYS
;CALL DELAY
;CALL DELAY
;CALL DELAY
;CALL DELAY
;CALL DELAY 
BRA LED
ORG 0FEH
#INCLUDE<DELAY1.asm>
END



