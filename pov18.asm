.include"m8535def.inc"
.def aux = r16
.def kat = r17
.def cero = r18

	ldi aux,low(RAMEND)
	out spl, aux
	ldi aux, high(RAMEND)
	out sph, aux
	ser aux
	out ddra, aux
	out ddrc, aux
	clr cero
nvo:ldi kat, 1
	ldi zh, high(msj<<1)
	ldi zl, low(msj<<1)
sig:lpm aux, z+
	com kat
	out portc, kat
	com kat
	out porta, aux
	rcall delay
	out porta, cero
	lsl kat
	cpi kat, $40
	breq nvo
	rjmp sig
delay:
; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 3 993 cycles
; 3ms 993us at 1 MHz

    ldi  r19, 6
    ldi  r20, 46
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    rjmp PC+1
	ret

msj:
.db $70,$76,$3F,$38,$77,$46
