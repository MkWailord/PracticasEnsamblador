.include"m8535def.inc"
.def aux = r16

;contador de la pila
	ldi aux, low(ramend)
	out spl, aux
	ldi aux, high(ramend)
	out sph, aux
	ser aux
	out ddra,aux
	out portb, aux

main: 
	sbis pinb,0
	rcall cero

	sbis pinb,1
	rcall uno

	sbis pinb,2
	rcall dos

	sbis pinb,3
	rcall tres

	sbis pinb,4
	rcall cuatro

	sbis pinb,5
	rcall cinco
	
	sbis pinb,6
	rcall seis
	
	sbis pinb,7
	rcall ciento_ochenta
	
	rjmp main
	
cero:
	sbi porta,0
	ldi aux,7
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,133
	rcall ciclarRetardos
	ret
uno:
	sbi porta,0
	ldi aux,8
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,132
	rcall ciclarRetardos
	ret
dos:
	sbi porta,0
	ldi aux,9
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,131
	rcall ciclarRetardos
	ret
tres:
	sbi porta,0
	ldi aux,10
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,130
	rcall ciclarRetardos
	ret
cuatro:
	sbi porta,0
	ldi aux,11
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,129
	rcall ciclarRetardos
	ret
cinco:
	sbi porta,0
	ldi aux,12
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,128
	rcall ciclarRetardos
	ret
seis:
	sbi porta,0
	ldi aux,13
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,127
	rcall ciclarRetardos
	ret
ciento_ochenta:
	sbi porta,0
	ldi aux,14
	rcall ciclarRetardos
	
	cbi porta,0
	ldi aux,126
	rcall ciclarRetardos
	ret
ciclarRetardos:
	rcall retardo
	dec aux
	brne ciclarRetardos
	ret
retardo:
	ldi r17,44
L1:	dec r17
	brne L1

	ret

