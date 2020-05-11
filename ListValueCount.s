.equ	LAST_RAM_WORD, 0x7FFFFC
.text
.global _start
.org 0x0000

_start:
	movia 	sp, LAST_RAM_WORD
        movia 	r2, LIST
        ldw	r3, N(r0)
        ldw	r4, V(r0)
        call	ListValueCount
_end:
	br	_end

ListValueCount:
	subi	sp, sp, 8
        stw 	r5, 4(sp)
        stw	r6, 0(sp)
        movi	r6, 0
loop:
	ldw	r5, 0(r2)
IF:
	bne	r5, r4, ELSE
THEN:
	addi	r6, r6, 1
ELSE:
	addi	r2, r2, 4
        subi	r3, r3, 1
        bgt	r3, r0, loop
        mov	r2, r6
        ldw	r6, 4(sp)
        ldw	r5, 0(sp)
        addi	sp, sp, 8
        ret

.org 0x1000
LIST: 	.word 2, 2, 3, 2, 5
N:	.word 5
V: 	.word 2
.end