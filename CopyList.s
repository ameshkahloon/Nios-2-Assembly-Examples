.equ LAST_RAM_WORD, 0x7FFFFC
.text
.global start_
.org 0x0000

_start:
	movia	sp, LAST_RAM_WORD
    	movia	r2, LIST1
    	movia	r3, LIST2
    	ldw	r4, N(r0)
    	call	CopyList
_end:
	br		_end
    
CopyList:
	subi	sp, sp, 4
    	stw	r5, 0(sp)
loop:
	ldw	r5, 0(r2)
    	stw	r5, 0(r3)
    	addi	r2, r2, 4
    	addi 	r3, r3, 4
    	subi	r4, r4, 1
    	bgt	r4, r0, loop
    	ldw	r5, 0(sp)
    	addi	sp, sp, 4
   	ret

.org 0x1000
	N: 	.word 5
	LIST1: 	.word 1, 2, 3, 4, 0x1000
	LIST2: 	.word 0, 0, 0, 0
.end