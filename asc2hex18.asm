.include "m8535def.inc"
.def aux = r16
.def asc = r17
	ser aux
	out ddra,aux //puerto a como salida
	out portb,aux //pull ups port b
uno:
	in asc, pinb //asc <- pinb
	subi asc, -$30 //asc + 30
	cpi asc, $3A  //Si hex <3A Se trata de un numero
	brsh dos //so hex>=3A
	out porta, asc
	rjmp uno
dos:
	subi asc, -$07
	out porta, asc
	rjmp uno //salta a uno
