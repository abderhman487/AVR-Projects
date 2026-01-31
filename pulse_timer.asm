.include "m32def.inc"

cbi ddrb,0
ldi r16,0xff
out ddra,r16
out ddrc,r16
ldi r16,0b00000111
out tccr0,r16

clr r17

loop:
    in r16,tcnt0
    out porta,r16
    out portc,r17

    in r16,tifr
    sbrs r16,tov0
    rjmp loop

    inc r17
    ldi r16,1<<tov0
    out tifr,r16
    rjmp loop