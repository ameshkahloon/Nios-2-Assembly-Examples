.text
.global _start
.org 0x0000

_start:
	movia		r2, LIST
	ldw		r3, NUMBER(r0)
	call		FINDMAX
    
_end:
	br	_end

FINDMAX:
	ldw		r4, 0(r2)
	LOOP:
	ldw		r5, 0(r2)
	bgt		r4, r5, ELSE		
	ldw		r4, 0(r2)
	ELSE:
	addi		r2, r2, 4
	subi		r3, r3, 1
	bgt		r3, r0, LOOP
	ret

.org 0x2000
LIST: 		.word 1, 0x12344, -5, 7
NUMBER: 	.word 4
.end	