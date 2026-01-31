.include "m32def.inc"

.macro init_stack
ldi r16,HIGH(RAMEND)
out sph,r16
ldi r16,LOW(RAMEND)
out spl,r16
.endmacro

init_stack

ldi r16,0xff
out ddrb,r16
ldi r20,0    

Send:
out portb,r20
rcall Delay
inc r20
breq end
rjmp Send

Delay:
    ldi r16,100
    outer: ldi r17,100
        inner:
            dec r17
            brne inner
    dec r16
    brne outer
    ret

end: rjmp end