.include "m8535def.inc"
.def aux = r16
.def hex = r17
	ser aux
	out ddra,aux //puerto a como salida
	out portb,aux //pull ups port b
uno:
	in hex, pinb //hex <- pinb
	subi hex, $30 //hex - 30
	cpi hex, $0A //es hex <0A
	brlo dos //si hex <0A (C=1) salta a dos
	subi hex,7 //hex-7 (hex es una letra
dos:
	out porta, hex //porta <- hex
	rjmp uno //salta a uno
