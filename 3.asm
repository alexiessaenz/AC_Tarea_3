	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase1
	call 	phrase2
	call 	phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr1:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 12d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase1:mov 	di, 29d
	mov	si, 0d
lupi1:	mov 	cl, [msg1+di-29d]
	
	call    m_cursr1
	call 	w_char
	inc	di
	;inc	si
	cmp 	di, len1
	jb	lupi1
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 13d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase2:mov 	di, 31d
	mov	si, 0d
lupi2:	mov 	cl, [msg2+di-31d]
	
	call    m_cursr2
	call 	w_char
	inc	di
	;inc	si
	cmp 	di, len2
	jb	lupi2
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 14d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase3:mov 	di, 43d
	mov	si, 0d
lupi3:	mov 	cl, [msg3+di-43d]
	
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret


section .data
msg1	db 	"-El cafe con leche es como"
len1	equ	$-msg1+29d
msg2	db 	"el cafe...pero con leche-"
len2	equ	$-msg2+31d
msg3	db 	"paulo cohelo."
len3	equ	$-msg3+43d
