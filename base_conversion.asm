;Hex to Decimal Conversion
;Splits 0xEC into Units, Tens, and Hundreds using repeated subtraction.

.include "m32def.inc"

.equ HEX_NUM = 0x200
.equ LSB = 0x220
.equ MIDSB = 0x221
.equ MSB = 0x222

.def NUM = R20
.def DENOMINATOR = R21
.def QUOTIENT = R22

ldi NUM,0xEC
sts HEX_NUM,NUM
ldi DENOMINATOR,10 ; Set divisor to 10
clr QUOTIENT

Least:
    inc QUOTIENT
    sub NUM, DENOMINATOR
    brcc Least ; Loop until NUM becomes negative

    dec QUOTIENT ; Fix over-counted quotient
    add NUM,DENOMINATOR ; Restore positive remainder
    sts LSB,NUM ; Store Units digit (6)

    mov NUM,QUOTIENT ; Set quotient as new dividend
    ldi QUOTIENT,0 ; Reset counter for next loop

Middle:
    inc QUOTIENT
    sub NUM, DENOMINATOR
    brcc Middle

    dec QUOTIENT
    add NUM,DENOMINATOR
    sts MIDSB,NUM ; Store Tens digit (3)

    sts MSB, QUOTIENT ; Store remaining Quotient as Hundreds (2)