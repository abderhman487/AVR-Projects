; Generate 25.6 ms delay using Timer0 in CTC Mode
; XTAL = 8 MHz, Prescaler = 1024
; Timer Tick = 1024 / 8 MHz = 128 us
; Required Count = 25.6 ms / 128 us = 200 clock
; OCR0 Value = 200 - 1 = 199 clock

.include "m32def.inc"

Delay: 
    ldi r16,0
    out tcnt0,r16 ; clear timer0 to start counting from 0
    ldi r16,199
    out ocr0,r16 ; set Output Compare Register0 to 199 clocks
    ldi r16, 0b00001101
    out tccr0,r16 ; set timer0 to CTC mode, prescaler = 1024
Polling: 
    in r16,tifr
    sbis r16,ocf0 ; skip next instruction if OCF0 is set (Timer reached 199)
    rjmp Polling

    ldi r16,0
    out tccr0,r16 ; stop timer0 (No clock source)
    ldi r16,1>>ocf0
    out tifr,r16 ; clear OCF0 flag (Must write 1 to clear it)
    ret