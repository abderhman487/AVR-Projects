; Configuring Timer0 in Normal mode with Prescaler 256
; using internal clock source to set TCCR0 value

ldi r16, 0b00000100 ; Value = 0x04 (Prescaler 256, Normal Mode)
out tccr0, r16