.include"m8535def.inc"
.def minu=r0
.def mind=r1
.def horu=r2
.def hord=r3
.def tch=r4
.def tcl=r5
.def aux =r16
.def col=r17
.def disp=r18
.def cseg=r19
.def sgnd=r20

reset:
	rjmp main
	rjmp reloj
.org $008
	rjmp time
	rjmp barre
main:
	ldi aux,low(RAMEND)
	out spl,aux
	ldi aux,high(RAMEND)
	out sph,aux
	ser aux
	out portc, aux
	out ddra,aux
	out ddrb,aux
	ldi aux,$C2
	mov tch,aux
	ldi aux,$F7
	mov tcl,aux
	

	ldi aux, 0b00001010
	out mcucr,aux
	ldi aux, 0b01000000
	out gicr, aux

	ldi aux,2
	out tccr0,aux
	ldi aux,3
	out tccr1b,aux
	out tcnt1l,tcl
	out tcnt1h,tch
	ldi aux,1
	out timsk,aux
	sei
	clr minu
	clr mind
	ldi aux,2
	mov horu,aux
	ldi aux,1
	mov hord,aux
	ldi zh,high(tabla<<1)
	ldi zl,low(tabla<<1)
	clr yl
	ld aux,y+
	//ldi col,1
	ldi col, $E
	add zl,aux
	lpm disp,Z
	ldi cseg,1
	ldi sgnd,$80
	
checa:
	sbis pinc,0
	rcall ajustUmin
	sbis pinc,1
	rcall ajustDmin
	sbis pinc,2
	rcall ajustH
	rjmp checa
ajustUmin:
	sbis pinc, 0
	rjmp ajustUmin
	inc minu
	mov aux, minu
	cpi aux,10
	brne checa
	clr minu
	ret
ajustDmin:
	sbis pinc, 1
	rjmp ajustDmin
	inc mind
	mov aux, mind
	cpi aux,6
	brne checa
	clr mind
	ret
ajustH:
	sbis pinc, 2
	rjmp ajustH
	inc horu
	mov aux,horu
	cpi aux,3
	breq chhdd
	cpi aux,10
	brne checa
	ldi aux,1
	mov hord,aux
	clr horu
	ret
chhdd:
	mov aux,hord
	cpi aux,1
	breq nodd
	rjmp sale
nodd:
	ldi aux,1
	mov horu,aux
	clr hord
	rjmp checa

ciclo:
	nop
	nop
	nop
	rjmp ciclo
time:
	out tcnt1l,tcl
	out tcnt1h,tch
	ldi aux,$80
	eor sgnd,aux
	dec cseg
	brne sale
	ldi cseg,1
	inc minu
	mov aux,minu
	cpi aux,10
	brne sale
	clr minu
	inc mind
	mov aux,mind
	cpi aux,6
	brne sale
	clr mind
	inc horu
	mov aux,horu
	cpi aux,3
	breq chhd
	cpi aux,10
	brne sale
	ldi aux,1
	mov hord,aux
	clr horu
	rjmp sale
nod:
	ldi aux,1
	mov horu,aux
	clr hord
sale:
	reti
chhd:
	mov aux,hord
	cpi aux,1
	breq nod
	rjmp sale
barre:
	ser aux
	out portb,aux
	lsl col
	//..
	inc col
	cpi col,$EF
	//cpi col, $10
	breq nvo
salb:
	ld aux,y+
	ldi zl,low(tabla<<1)
	add zl,aux
	lpm disp,z
	eor disp,sgnd
	out porta,col
	out portb,disp
	reti
nvo:
	clr yl
	//ldi col, 1
	ldi col,$E
	rjmp salb
reloj:
	ldi aux,5
	out timsk,aux
	rjmp time
tabla:
	//.db $C0,$F9,$A4,$B0,$99,$92,$82,$D8,$80,$90
    .db $3f, 6, $5b,$4f,$66,$6d,$7d,$27,$7f,$6f
