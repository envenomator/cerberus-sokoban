;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fs2ulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
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
	G$__fs2ulong$0$0	= .
	.globl	G$__fs2ulong$0$0
	C$_fs2ulong.c$60$0_0$21	= .
	.globl	C$_fs2ulong.c$60$0_0$21
;_fs2ulong.c:60: __fs2ulong (float a1)
;	---------------------------------
; Function __fs2ulong
; ---------------------------------
___fs2ulong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
	C$_fs2ulong.c$66$1_0$21	= .
	.globl	C$_fs2ulong.c$66$1_0$21
;_fs2ulong.c:66: fl1.f = a1;
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	hl, #0x000e
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fs2ulong.c$68$1_0$21	= .
	.globl	C$_fs2ulong.c$68$1_0$21
;_fs2ulong.c:68: if (!fl1.l || SIGN(fl1.l))
	ld	hl, #0x0006
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	or	a, b
	or	a, c
	jr	Z,00101$
	ld	hl, #0x0006
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	rlc	a
	and	a,#0x01
	jr	Z,00102$
00101$:
	C$_fs2ulong.c$69$1_0$21	= .
	.globl	C$_fs2ulong.c$69$1_0$21
;_fs2ulong.c:69: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jr	00104$
00102$:
	C$_fs2ulong.c$71$1_0$21	= .
	.globl	C$_fs2ulong.c$71$1_0$21
;_fs2ulong.c:71: exp = EXP (fl1.l) - EXCESS - 24;
	ld	hl, #0x0006
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x07
00111$:
	srl	d
	rr	e
	djnz	00111$
	ld	c, #0x00
	ld	a, e
	add	a, #0x6a
	ld	-6 (ix), a
	ld	a, c
	adc	a, #0xff
	ld	-5 (ix), a
	C$_fs2ulong.c$72$1_0$21	= .
	.globl	C$_fs2ulong.c$72$1_0$21
;_fs2ulong.c:72: l = MANT (fl1.l);
	ld	hl, #0x0006
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	d, #0x00
	ld	-10 (ix), c
	ld	-9 (ix), b
	ld	a, e
	or	a, #0x80
	ld	-8 (ix), a
	ld	-7 (ix), d
	C$_fs2ulong.c$74$1_0$21	= .
	.globl	C$_fs2ulong.c$74$1_0$21
;_fs2ulong.c:74: l >>= -exp;
	xor	a, a
	sub	a, -6 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, -5 (ix)
	inc	b
	jr	00114$
00113$:
	sra	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
00114$:
	djnz	00113$
	C$_fs2ulong.c$76$1_0$21	= .
	.globl	C$_fs2ulong.c$76$1_0$21
;_fs2ulong.c:76: return l;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	e, -8 (ix)
	ld	d, -7 (ix)
00104$:
	C$_fs2ulong.c$77$1_0$21	= .
	.globl	C$_fs2ulong.c$77$1_0$21
;_fs2ulong.c:77: }
	ld	sp, ix
	pop	ix
	C$_fs2ulong.c$77$1_0$21	= .
	.globl	C$_fs2ulong.c$77$1_0$21
	XG$__fs2ulong$0$0	= .
	.globl	XG$__fs2ulong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
