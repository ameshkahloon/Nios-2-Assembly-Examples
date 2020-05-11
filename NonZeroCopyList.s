.equ LAST_WORD_RAM,	0x7FFFFC
.text
.global _start
.org 0x0000

_start:
	movia	r2, LIST1
        movia 	r3, LIST2
        ldw	r4, N(r0)
        call	NonZeroCopyList
_end:
	br	_end
        
NonZeroCopyList:
	subi	sp, sp, 8
        stw	r5, 4(sp)
        stw	r6, 0(sp)
        movi 	r6, 0
loop:
	ldw	r5, 0(r2)
IF:
	beq	r5, r0, ELSE
THEN:
	stw	r5, 0(r3)
        addi	r6, r6, 1
        addi	r3, r3, 4
ELSE:
	addi	r2, r2, 4
        subi	r4, r4, 1
        bgt	r4, r0, loop
        mov	r2, r6
        ldw	r6, 0(sp)
        ldw	r5, 4(sp)
        addi	sp, sp, 8
        ret
        
.org 0x1000

N: 	.word 5
LIST1:	.word 0, 2, 0, 0, 5
LIST2:	.skip 20