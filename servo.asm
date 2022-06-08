	.include"m8535def.inc"
	.def aux = r16
.macro pulso
	sbi porta,4
	ldi aux,@0
uno:
	rcall medms
	dec aux
	brne uno
    cbi porta,4
	ldi aux,@1
cta1:
	rcall medms
	dec aux
	brne cta1
.endm

	ldi aux,low(ramend)
	out spl,aux
	ldi aux,high(ramend)
	out sph,aux
	ser aux
	out ddra,aux
	out portb,aux
checa:
	sbis pinb,0
	rcall cero
	sbis pinb,1
	rcall noventa
	sbis pinb,2
	rcall cien80
	rjmp checa
cero:
	pulso 2,38
	ret
noventa:
	pulso 3,37
	ret
cien80:
	pulso 4,36
	ret
medms:
; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 493 cycles
; 492us 999 0/1 ns
; at 1 MHz

    ldi  r18, 164
L1: dec  r18
    brne L1
    nop
    ret
