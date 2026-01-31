; XTAL = 8 MHZ, prescale = 1024
; Timer Tick = 1024 / 8 MHZ = 128 us
; Required count = 5ms / 128 us = 39 clock
; TCNT0 = 256 - 39 = 217

.include "m32def.inc"

ldi r16, 217
out tcnt0, r16
ldi r16, 0b00000101
out tccr0, r16

polling:
    in r16, tifr
    sbrs r16, tov0
    rjmp polling

    ldi r16, 1<<tov0
    out tifr, r16