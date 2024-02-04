;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _mullong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullong
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	G$_mullong$0$0	= .
	.globl	G$_mullong$0$0
	C$_mullong.c$12$0_0$2	= .
	.globl	C$_mullong.c$12$0_0$2
;_mullong.c:12: _mullong (long a, long b)
;	---------------------------------
; Function _mullong
; ---------------------------------
__mullong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	C$_mullong.c$16$1_0$2	= .
	.globl	C$_mullong.c$16$1_0$2
;_mullong.c:16: bcast(a)->i.hi *= bcast(b)->i.lo;
	ld	hl, #0x000a
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, sp
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	push	de
	call	__mulint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_mullong.c$17$1_0$2	= .
	.globl	C$_mullong.c$17$1_0$2
;_mullong.c:17: bcast(a)->i.hi += bcast(b)->i.hi * bcast(a)->i.lo;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	call	__mulint
	pop	af
	pop	af
	pop	de
	pop	bc
	add	hl, de
	ex	de, hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_mullong.c$20$1_0$2	= .
	.globl	C$_mullong.c$20$1_0$2
;_mullong.c:20: bcast(a)->i.hi += bcast(a)->b.b1 * bcast(b)->b.b1;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	pop	hl
	push	hl
	inc	hl
	ld	h, (hl)
	push	de
	push	bc
	ld	e, -4 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00103$:
	add	hl, hl
	jr	NC,00104$
	add	hl, de
00104$:
	djnz	00103$
	pop	bc
	pop	de
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_mullong.c$22$1_0$2	= .
	.globl	C$_mullong.c$22$1_0$2
;_mullong.c:22: i12 = bcast(b)->b.b0 * bcast(a)->b.b1;
	pop	hl
	push	hl
	ld	e, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	h, (hl)
	push	bc
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00105$:
	add	hl, hl
	jr	NC,00106$
	add	hl, de
00106$:
	djnz	00105$
	pop	bc
	ex	de, hl
	C$_mullong.c$23$1_0$2	= .
	.globl	C$_mullong.c$23$1_0$2
;_mullong.c:23: bcast(b)->bi.i12 = bcast(a)->b.b0 * bcast(b)->b.b1;
	pop	hl
	push	hl
	inc	hl
	push	hl
	pop	iy
	ld	l, c
	ld	h, b
	ld	a, (hl)
	ld	-2 (ix), a
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	push	de
	push	bc
	ld	e, a
	ld	h, -2 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00107$:
	add	hl, hl
	jr	NC,00108$
	add	hl, de
00108$:
	djnz	00107$
	pop	bc
	pop	de
	ld	0 (iy), l
	ld	1 (iy), h
	C$_mullong.c$26$1_0$2	= .
	.globl	C$_mullong.c$26$1_0$2
;_mullong.c:26: bcast(b)->b.b3 = ((bcast(b)->bi.i12 += i12) < i12);
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	hl
	push	hl
	inc	hl
	push	hl
	pop	iy
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	0 (iy), l
	ld	1 (iy), h
	cp	a, a
	sbc	hl, de
	ld	a, #0x00
	rla
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
	C$_mullong.c$28$1_0$2	= .
	.globl	C$_mullong.c$28$1_0$2
;_mullong.c:28: bcast(a)->i.lo  = bcast(a)->b.b0 * bcast(b)->b.b0;
	ld	e, c
	ld	d, b
	ld	a, (bc)
	ld	c, a
	pop	hl
	push	hl
	ld	h, (hl)
	push	de
	ld	e, c
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00109$:
	add	hl, hl
	jr	NC,00110$
	add	hl, de
00110$:
	djnz	00109$
	pop	de
	ld	c, l
	ld	b, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	C$_mullong.c$30$1_0$2	= .
	.globl	C$_mullong.c$30$1_0$2
;_mullong.c:30: bcast(b)->bi.b0 = 0;
	pop	bc
	push	bc
	xor	a, a
	ld	(bc), a
	C$_mullong.c$32$1_0$2	= .
	.globl	C$_mullong.c$32$1_0$2
;_mullong.c:32: return a + b;
	ld	a, 4 (ix)
	add	a, 8 (ix)
	ld	l, a
	ld	a, 5 (ix)
	adc	a, 9 (ix)
	ld	h, a
	ld	a, 6 (ix)
	adc	a, 10 (ix)
	ld	e, a
	ld	a, 7 (ix)
	adc	a, 11 (ix)
	ld	d, a
	C$_mullong.c$33$1_0$2	= .
	.globl	C$_mullong.c$33$1_0$2
;_mullong.c:33: }
	ld	sp, ix
	pop	ix
	C$_mullong.c$33$1_0$2	= .
	.globl	C$_mullong.c$33$1_0$2
	XG$_mullong$0$0	= .
	.globl	XG$_mullong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
