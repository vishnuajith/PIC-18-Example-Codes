;*********************************************************************
;*    Description : Example of LOOK UP TABLE store 8 value of X^2-2X+5  
;*     and returns it according to input in PORTB
;*    
;*********************************************************************
 
#include<p18f452.inc>
CONFIG WDT=OFF
ORG 0 ;FOR GENERATING LOOK UP TABLE  TO RETURN VALUE OF X^2-2X+5 ( USING DB ) X IS INPUT IN PORTB  PIN0
SETF TRISB
MOVF PORTB,W
;MOVLW B'0' ;REMOVE COMMENT FOR TESTING
ANDLW 0X07
MULLW .2
 MOVF PRODL,W
ADDLW 50
MOVWF TBLPTRL
TBLRD*
MOVF TABLAT ,W
 HERE GOTO HERE
ORG 50
S1 
DB 5 ;0
DB 4 ;1
DB 5 ;2
DB 8 ;3
DB 13 ;4
DB 20 ;5
DB 29 ;6
DB 40 ;7
END