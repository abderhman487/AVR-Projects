; XTAL = 8 MHZ, prescale = 64
; Timer Tick = 64 / 8 MHZ = 8 us
; Required count = (1/250) / (8 us * 2) = 250 clock [square wave]
; OCF0 = 250-1 = 249

.include "m32def.inc"

.macro init_stack
ldi r16,HIGH(RAMEND)
out sph,r16
ldi r16,LOW(RAMEND)
out spl,r16
.endmacro

init_stack
sbi ddra,5
ldi r17,1<<5

Polling:
    rcall Delay
    in r16,porta
    eor r16,r17
    out porta,r16
    rjmp Polling
Delay:
    ldi r16,0
    out tcnt0,r16
    ldi r16,0b00001011 ; CTC Mode, 64 prescaler
    out tccr0,r16
    ldi r16,249
    out ocr0,r16
    again:    
        in r16,tifr
        sbrs r16,ocf0 ; skip next instruction if OCF0 is set (Timer reached 199)
        rjmp again
    ldi r16,1<<ocf0
    out tifr,r16
    ret