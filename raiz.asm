
.include "m8535def.inc"
.def aux = r16
.def rad = r17
.def i = r18
.def sum = r19
.def cont = r20

	ser aux
	out ddra, aux
	out portb, aux
cero:
	clr cont
	clr sum
	ldi i, $01
uno:
	in rad, pinb
	cp sum, rad
	brsh dos
	add sum, i
	subi i, -$02
	inc cont
	rjmp uno
dos:
	out porta, cont
	rjmp cero
