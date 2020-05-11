.text
.global _start
.org 0x0000

_start:
	ldw	r2, A(r0)
	ldw	r3, B(r0)
	call	Max
    
_end:
	br	_end
    
Max:
	IF:
	bne	r2, r3, ELSE1
	THEN:
	mov	r4, r3
	br	END
	ELSE1:
	blt	r2, r3, ELSE3
	ELSE2:
	mov 	r4, r2
	br END
	ELSE3:
	mov	r4, r3
	END:
	ret

.org 0x1000

A: .word 6
B: .word 10