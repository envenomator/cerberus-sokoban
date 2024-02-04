;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fs2slong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2slong
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
	G$__fs2slong$0$0	= .
	.globl	G$__fs2slong$0$0
	C$_fs2slong.c$34$0_0$21	= .
	.globl	C$_fs2slong.c$34$0_0$21
;_fs2slong.c:34: signed long __fs2slong (float f)
;	---------------------------------
; Function __fs2slong
; ---------------------------------
___fs2slong::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_fs2slong.c$37$1_0$21	= .
	.globl	C$_fs2slong.c$37$1_0$21
;_fs2slong.c:37: if (!f)
	ld	a, 7 (ix)
	res	7, a
	or	a, 6 (ix)
	or	a, 5 (ix)
	or	a, 4 (ix)
	jr	NZ,00102$
	C$_fs2slong.c$38$1_0$21	= .
	.globl	C$_fs2slong.c$38$1_0$21
;_fs2slong.c:38: return 0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jr	00106$
00102$:
	C$_fs2slong.c$40$1_0$21	= .
	.globl	C$_fs2slong.c$40$1_0$21
;_fs2slong.c:40: if (f<0) {
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, l
	or	a, a
	jr	Z,00104$
	C$_fs2slong.c$41$2_0$22	= .
	.globl	C$_fs2slong.c$41$2_0$22
;_fs2slong.c:41: return -__fs2ulong(-f);
	ld	a, 7 (ix)
	xor	a,#0x80
	ld	d, a
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	push	de
	push	bc
	call	___fs2ulong
	pop	af
	pop	af
	ld	c, e
	ld	b, d
	xor	a, a
	sub	a, l
	ld	e, a
	ld	a, #0x00
	sbc	a, h
	ld	d, a
	ld	hl, #0x0000
	sbc	hl, bc
	ex	de, hl
	jr	00106$
00104$:
	C$_fs2slong.c$43$2_0$23	= .
	.globl	C$_fs2slong.c$43$2_0$23
;_fs2slong.c:43: return __fs2ulong(f);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
00106$:
	C$_fs2slong.c$45$1_0$21	= .
	.globl	C$_fs2slong.c$45$1_0$21
;_fs2slong.c:45: }
	pop	ix
	C$_fs2slong.c$45$1_0$21	= .
	.globl	C$_fs2slong.c$45$1_0$21
	XG$__fs2slong$0$0	= .
	.globl	XG$__fs2slong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
