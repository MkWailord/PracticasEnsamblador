.macro ldb
	ldi r16, @1
	mov @0, r16
.endmacro

	ldb r7, $3a
	ldb r5, $32
	ldb r0, 9
