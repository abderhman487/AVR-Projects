;A program for Counter0 in normal mode to count the pulses 
;on Rising Edge and display the state of the TCNT0 count on PORTD

.include "m32def.inc"

cbi ddrb,0 ;make T0(PB0) input
ldi r16,0xff
out ddrd,r16 ;make PORTD output
ldi r16,0b00000111
out tccr0,r16 ;counter, raising edge

again:  in r16,tcnt0
        out portd, r16 ;monitor the count number
        in r16,tifr
        sbis r16,tov0 ;skip if overflow in timer interrupt flag is set to 1
        rjmp again

        ldi r16,1<<tov0 
        out tifr,r16 ;clear TOV0 flag to detect next overflow
        rjmp again