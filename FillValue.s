.text
.global _start
.org 0x0000

_start:
	movia	r2, LIST
	ldw	r3, N(r0)
	ldw	r4, V(r0)
	call	FillValue

_end:
	br	_end

FillValue:
	IF:
	bne	r3, r0, ELSE
	THEN:
	ret
	ELSE:
	stw	r4, 0(r2)
	addi	r2, r2, 4
	subi	r3, r3, 1
	bgt	r3, r0, ELSE
	ret

.org 0x1000

LIST:	.word 1, 1, 1
N:	.word 3
V:	.word 12
.end									