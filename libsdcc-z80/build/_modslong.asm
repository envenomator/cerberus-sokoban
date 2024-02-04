;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _modslong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __modslong
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
	G$_modslong$0$0	= .
	.globl	G$_modslong$0$0
	C$_modslong.c$2$0_0$2	= .
	.globl	C$_modslong.c$2$0_0$2
;_modslong.c:2: _modslong (long a, long b)
;	---------------------------------
; Function _modslong
; ---------------------------------
__modslong::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	C$_modslong.c$6$1_0$2	= .
	.globl	C$_modslong.c$6$1_0$2
;_modslong.c:6: r = (unsigned long)(a < 0 ? -a : a) % (unsigned long)(b < 0 ? -b : b);
	ld	a, 7 (ix)
	rlca
	and	a,#0x01
	ld	-1 (ix), a
	or	a, a
	jr	Z,00106$
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 7 (ix)
	ld	d, a
	jr	00107$
00106$:
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
00107$:
	ld	-5 (ix), c
	ld	-4 (ix), b
	ld	-3 (ix), e
	ld	-2 (ix), d
	bit	7, 11 (ix)
	jr	Z,00108$
	xor	a, a
	sub	a, 8 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 9 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, 10 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 11 (ix)
	ld	d, a
	jr	00109$
00108$:
	ld	c, 8 (ix)
	ld	b, 9 (ix)
	ld	e, 10 (ix)
	ld	d, 11 (ix)
00109$:
	push	de
	push	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	call	__modulong
	pop	af
	pop	af
	pop	af
	pop	af
	C$_modslong.c$8$1_0$2	= .
	.globl	C$_modslong.c$8$1_0$2
;_modslong.c:8: if (a < 0)
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00102$
	C$_modslong.c$9$1_0$2	= .
	.globl	C$_modslong.c$9$1_0$2
;_modslong.c:9: return -r;
	xor	a, a
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	ld	a, #0x00
	sbc	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
	C$_modslong.c$11$1_0$2	= .
	.globl	C$_modslong.c$11$1_0$2
;_modslong.c:11: return r;
00102$:
	C$_modslong.c$12$1_0$2	= .
	.globl	C$_modslong.c$12$1_0$2
;_modslong.c:12: }
	ld	sp, ix
	pop	ix
	C$_modslong.c$12$1_0$2	= .
	.globl	C$_modslong.c$12$1_0$2
	XG$_modslong$0$0	= .
	.globl	XG$_modslong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
