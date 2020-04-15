;////////////////////////////////////////////////////
;//    STEPPER MOTOR CONTROL USING BLUETOOTH       // 
;//                                                //
;//           MPMC SPECIAL PROJECT                 //
;//                                                //
;//         Author : Vishnu Ajith                  //
;//                                                //
;////////////////////////////////////////////////////     
;****************************************************************************
;*   Description : Special Project done for MPMC Course ,Topic is controlling
;*    of Stepper motor using an android app trough bluetooth.Project Uses
;*    UART to receive data from app. App was made on MIT App Inventor.
;*      Changing direction and speed control was possible. 
;****************************************************************************
      

#INCLUDE<p18f452.inc> 
CONFIG  WDT = OFF, OSCS=OFF, OSC=HS

; VARIABLES
; STEP
; TMR1HV
; TMR1LV
     
STEP EQU 50H
TMR1HV EQU 51H
TMR1LV EQU 52H
UART EQU 53H
ORG 0
GOTO MAIN

ORG 8
BTFSC PIR1,RCIF
GOTO RC_INT 
RETFIE
     
; PINS 
; STEP RD0
; DIR RD1
; RX  RC7
 
ORG 100
MAIN  BSF TRISC,RC7
    
      BSF INTCON,GIE
      BSF INTCON,PEIE
    
      ;31 FOR 9600BPS IS AT SPBRG = 0x1F
    
      MOVLW D'31'
      MOVWF SPBRG ;SP BAUD RATE GENERATOR
    
    
      BSF RCSTA,SPEN
      BSF RCSTA,CREN

      ;INTERUPT
      BCF PIR1,RCIF
      BSF PIE1,RCIE 
     
      MOVLW 088
      MOVWF TMR1HV
      MOVLW 053
      MOVWF TMR1LV

      BCF TRISD,RD0
      BCF TRISD,RD1
REPEAT CALL TMR_CONF
      CALL ROTATE
      BRA REPEAT
          
TMR_CONF MOVLW 0 ;TIMER 1 CONFIGURE
      MOVWF T1CON 
      MOVFF TMR1HV,TMR1H
      MOVFF TMR1LV,TMR1L
      BCF PIR1,TMR1IF
      BCF PIE1,TMR1IE
RETURN     
    

ROTATE MOVLW D'200' ;200*1.8 = 360 DEGREE  = 1 ROTATION
       MOVWF STEP
  LOOP BSF PORTD,RD0;STEP SETTED
       BSF T1CON,TMR1ON
    L2 BTFSS PIR1,TMR1IF
       BRA L2
   CALL TMR_CONF
       BCF PORTD,RD0;STEP CLEARED
       BSF T1CON,TMR1ON
    L1 BTFSS PIR1,TMR1IF
       BRA L1
       CALL TMR_CONF
       DECF STEP,F
BNZ ROTATE

 
RC_INT MOVFF RCREG,UART  ; UART = 1,2,4 DIR,SP+,SP+ RESPECTIVELY 
       BTFSC UART,0
       BRA CH_DIR
       BTFSC UART,1
       BRA CH_SP_INC
       BTFSC UART,2
       BRA CH_SP_DEC
       BCF PIR1,RCIF
       RETFIE
       
CH_DIR BTG PORTD,RD1
       BCF PIR1,RCIF
       RETFIE
       
CH_SP_INC BCF T1CON,TMR1ON; DECREASE TIMER DELAY
       MOVLW 10
       ADDWF TMR1HV
       MOVFF TMR1HV,TMR1H
       MOVFF TMR1LV,TMR1L
       BCF PIR1,TMR1IF
       BCF PIE1,TMR1IE;;
       BSF T1CON,TMR1ON
       BCF INTCON,INT0IF
       BCF PIR1,RCIF
       RETFIE

CH_SP_DEC BCF T1CON,TMR1ON; INCREASE TIMER DELAY
       MOVLW 10
       SUBWF TMR1HV,F
       MOVFF TMR1HV,TMR1H
       MOVFF TMR1LV,TMR1L
       BCF PIR1,TMR1IF
       BCF PIE1,TMR1IE;;
       BSF T1CON,TMR1ON
       BCF INTCON,INT0IF
       BCF PIR1,RCIF
       RETFIE
       
END