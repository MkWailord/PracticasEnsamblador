.include"m8535def.inc"
.def aux = r16
reset:
	rjmp main //Direccion 0
	rjmp sube //Direccion 1
	rjmp baja //Direccion 2
.org $12
	rjmp doble
main:
	ldi aux,low(RAMEND)
	out spl, aux
	ldi aux, high(RAMEND)
	out sph,aux
	ser aux
	out ddra,aux
	out portd, aux
	ldi aux, 0b00001010
	out mcucr,aux
	ldi aux, 0b11100000
	out gicr, aux
	sei
ciclo:
	nop
 	rjmp ciclo
baja:
	in aux, pina
	dec aux
	out porta, aux
	reti
sube:
	in aux, pina
	inc aux
	out porta, aux
	reti
doble:
	in aux, pina
	lsl aux
	out porta, aux
	reti

tabla:
.db $3f, 6, $5b, $4f, $66, $6d, $7d, $27, $7f, $6f
.db $f7, $7c, $39, $5e, $79, $71
