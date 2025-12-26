;program to bring in a byte of data serially via pin RC7 and save it in R20 register. 
;The byte comes in with the LSB first.

.include "m32def.inc"

cbi ddrc,7
ldi r16,8
ldi r20,0

again:
    sbis pinc,7 ;skip the next line if bit 7 of Port C is 0
    clc         ;set carry flag to one
    sbic pinc,7 ;skip the next line if bit 7 of Port C is 1
    sec         ;clear carry flag to zero
    ror r20     ;rotate right R20. move C flag to MSB of R21
    dec r16
    brne again