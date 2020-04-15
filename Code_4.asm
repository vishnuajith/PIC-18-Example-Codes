;*********************************************************************
;*    Description : Using include to add more files also Blinking Led
;*     using Subroutine
;*    
;*********************************************************************
    
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
;CALL SUBROUTINE
;BLINK
BCF TRISA,RB0
BSF PORTA,RB0
LOOP CALL DELAY
    BTG PORTA,RB0
    BRA LOOP
NOP
ORG 20H
#INCLUDE<DELAY1.asm>
END

