;*******************************************************************
;*    Description : Sets RB5 as output and outputs HIGH then stalls
;*    
;*******************************************************************
 #include<p18f452.inc> ;change to int0
CONFIG  WDT = OFF, oscs=off, osc=hs
ORG 0
    BCF TRISB,4
    BSF PORTB,4
    HERE GOTO HERE
    END
    
    


