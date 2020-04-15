;*******************************************************************
;*    Description : Using Timer0 and Port B interrupt 
;*    
;*******************************************************************
    
#include<p18f452.inc>
CONFIG  WDT = OFF
ORG 0
GOTO MAIN

ORG 8
BTFSC INTCON,RBIF ;HIGH INTERUPT
BRA BTN_ISR
RETFIE
 
ORG 18
BTFSC INTCON,TMR0IF ;LOW INTERUPT
BRA BLINK_ISR
RETFIE
 
ORG 100
MAIN BCF TRISC,RC5
BCF TRISC,RC6
MOVLW B'00100000'
MOVWF PORTC
 
;TMR 0
BSF INTCON, TMR0IE
BSF RCON,IPEN
BCF INTCON2,TMR0IP 
MOVLW 06
MOVWF T0CON
MOVLW 0FF
MOVWF TMR0H
MOVLW 0FF
MOVWF TMR0L
BCF INTCON, TMR0IF
BSF INTCON,GIEH
BSF INTCON,GIEL
BSF T0CON,TMR0ON
 
 
BCF INTCON ,RBIF
BSF INTCON, RBIE
 
HERE GOTO HERE
 
BTN_ISR BSF TRISC,RC6
MOVF PORTB,W
BCF INTCON,RBIF
RETFIE
 
BLINK_ISR BCF T0CON,TMR0ON
  BTG PORTC,RC5
  ;BCF TRISC,RC6
  BTG PORTC,RC6
  MOVLW 0B3
  MOVWF TMR0H
  MOVLW 0B4
  MOVWF TMR0L
  BCF INTCON, TMR0IF
  BSF T0CON,TMR0ON
  RETFIE

END
