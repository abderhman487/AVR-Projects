;temperature sensor sorting
;Reads data from PORTB and distributes it to registers
;(R16, R17, R18) based on comparison with value 75.

.include "m32def.inc"

ldi r16,0
out ddrb,r16
clr r16
clr r17
clr r18

in r20, pinb
cpi r20,75 ;compare R20 (PORTB) and 75
brsh same_higher 

mov r18,r20 ;executes when R20 < 75
rjmp end 

same_higher: ;executes when R20 >= 75
    breq equal
    mov r17,r20 ;executes when R20 = 75
    rjmp end

    equal: 
        mov r16,r20 ;executes when R20 > 75
        rjmp end

end: jmp end