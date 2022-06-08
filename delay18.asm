.include"m8535def.inc"
	ldi r16, low(RAMEND)
	out spl, r16
	ldi r16, high(RAMEND)
	out sph, r16
main:
	ldi r16, 5
	nop
	rcall delay
	nop
fin:
	rjmp fin
delay:
	; Assembly code auto-generated
	; by utility from Bret Mulvey
	; Delay 999 993 cycles
	; 249ms 998us 250 ns at 4 MHz

	    ldi  r18, 6
	    ldi  r19, 19
	    ldi  r20, 172
	L1: dec  r20
	    brne L1
	    dec  r19
	    brne L1
	    dec  r18
	    brne L1
	    nop
		ret

