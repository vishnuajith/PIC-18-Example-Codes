;*********************************************************************
;*    Description : Example of LOOK UP TABLE store 8 value of X^2-2X+5  
;*     and returns it according to input in PORTB Modified code8
;*    
;*********************************************************************
    
#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ;FOR GENERATING LOOK UP TABLE  TO RETURN VALUE OF X^2-2X+5=0 ( USING RETLW ) X IS INPUT IN PORTB  PIN0
SETF TRISB
MOVF PORTB,W
;MOVLW B'111' ;REMOVE COMMENT FOR TESTING
ANDLW 0X07
    RCALL S1
HERE GOTO HERE
ORG 50
S1 MULLW .2
  MOVF PRODL,W
  ADDWF PCL,F
RETLW 5 ;0
RETLW 4 ;1
RETLW 5 ;2
RETLW 8 ;3
RETLW 13 ;4
RETLW 20 ;5
RETLW 29 ;6
RETLW 40 ;7
END