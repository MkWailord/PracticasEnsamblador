.include "m8535def.inc"
.def dat = r16
	ser dat //dat <- FF
	out ddra, dat //a como salida
	out ddrc, dat
	out portb, dat //b pull ups



otro:
	ldi zh, high(tabla<<1)
	ldi zl,low(tabla<<1)

	in dat, pinb
	andi dat, $0f
	out portc, dat

	add zl, dat
	lpm dat, z
	out porta, dat
	rjmp otro	

tabla:
.db $3f, 6, $5b, $4f, $66, $6d, $7d, $27, $7f, $6f
.db $f7, $7c, $39, $5e, $79, $71
