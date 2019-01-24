	model	TINY
	dataseg
Ferz	db	8 dup(1)
Founded	db	13,10
Output	db	81 dup(?)

	codeseg
	org	100h
Main:
	lea	si, Ferz
	mov	bp, si
	mov	cx, 8
Next1:
	cmp	byte ptr [si], 10000000b
	jne	NSHL
	mov	byte ptr [si], 1
	inc	si
	loop	Next1
	ret
NSHL:
	shl	byte ptr [si], 1
	call	Proverka
	jmp short Main

FuckOf:
	jmp	FuckOff
FuckCode:
	pop	di
	jmp short ModCode

Proverka:
	mov	dl, 8
	mov	si, bp
QWERT1:
	mov	cl, 8
	mov	al, [si]
	mov	di, bp
QWERT:
	cmp	dl, cl
	je	Next666
	cmp	[di], al
	je	FuckOf
Next666:
	inc	di
	loop	QWERT
	inc	si
	dec	dx
	cmp	dl, ch
	jne	QWERT1

	mov	cl, 8
	mov	si, bp
	lea	di, Output
ASDF:
	push	cx
	mov	cl, 8
	mov	al, 1
ASDF1:
	cmp	[si], al
	je	Iks
	mov	byte ptr [di], '.'
	jmp short lASDF1
Iks:
	cmp	cl, ch
	je	NextC
	cmp	cl, 8
	je	NextC
	mov	word ptr [ModCode], 9090h
	mov	byte ptr [ModCode2-1], 11
	mov	dx, 8
	sub	dx, cx
HackF11:
	xor	bx, bx
Hack11:
	add	bx, 10
ModCode2:
	push	di
	sub	di, bx
	cmp	byte ptr [di], 'x'
	je	FuckOff2
	cmp	di, si
	jna	FuckCode
	pop	di
	dec	dx
	cmp	dl, ch
	jne	Hack11
ModCode:
	nop
	nop
NextC:
	mov	dx, cx
	mov	word ptr [ModCode], 0FEBh
	mov	byte ptr [ModCode2-1], 9
	jmp short HackF11
NextFC:
	mov	byte ptr [di], 'x'
lASDF1:
	shl	al, 1
	inc	di
	loop	ASDF1
	pop	cx
	inc	si
	mov	ax, 0A0Dh
	stosw
	loop	ASDF
	mov	al, '$'
	stosb
	mov	ah, 9
	lea	dx, Founded
	int	21h
FuckOff:
	ret
FuckOff2:
	pop	di
	pop	cx
	ret

	end	Main