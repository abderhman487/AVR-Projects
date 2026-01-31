.include "m32def.inc"

ldi r16,0x41
ldi r17,8
clc
sbi ddrb,1

sbi portb,1
main:
ror r16
brcc send0
sbi portb,1

rjmp next

send0:
    cbi portb,1

next:
    dec r17
    brne main

sbi portb,1
end: jmp end