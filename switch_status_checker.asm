;check the status of the switch on PB2:
;(a) If switch = 0, send letter ‘N’ to Port D.
;(b) If switch = 1, send letter ‘Y’ to Port D.


.include "m32def.inc"

cbi ddrb,2
ldi r16,0xff
out ddrd,r16

n:
    in r20,pinb
    sbrc r20,2 ;skip next line if Bit PB2 is clear
    rjmp y

    ldi r16,"N"
    out portd,r16 ;issue R16 to PORTD
    rjmp n

    y:
        ldi r16,"Y"
        out portd,r16 ;issue R16 to PORTD
        rjmp n