.include "m8535def.inc"
.def dat = r16
.def cont = r17
.def datB = r21

reset:
	ldi dat,low(RAMEND)
	out spl,dat
	ldi dat,high(RAMEND)
	out sph,dat
	ser dat //dat <- FF
	out ddra, dat //a como salida
	out ddrc, dat
	out portb, dat //b pull ups

uno:
	clr cont

otro:
	ldi zh, high(tabla<<1)
	ldi zl,low(tabla<<1)
	in datB, pinb
	andi datB, $0f
	mov dat, cont
	out portc, datB
	add zl, dat
	lpm dat, z
	out porta, dat
	rcall delay
	cp cont, datB
	breq uno
	inc cont
	rjmp otro	

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

tabla:
.db $3f, 6, $5b, $4f, $66, $6d, $7d, $27, $7f, $6f
.db $f7, $7c, $39, $5e, $79, $71
