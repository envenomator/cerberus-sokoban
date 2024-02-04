;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fs2schar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
	.globl ___fs2schar
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
	G$__fs2schar$0$0	= .
	.globl	G$__fs2schar$0$0
	C$_fs2schar.c$34$0_0$21	= .
	.globl	C$_fs2schar.c$34$0_0$21
;_fs2schar.c:34: signed char __fs2schar (float f)
;	---------------------------------
; Function __fs2schar
; ---------------------------------
___fs2schar::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_fs2schar.c$36$1_0$21	= .
	.globl	C$_fs2schar.c$36$1_0$21
;_fs2schar.c:36: signed long sl=__fs2slong(f);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fs2slong
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	C$_fs2schar.c$37$1_0$21	= .
	.globl	C$_fs2schar.c$37$1_0$21
;_fs2schar.c:37: if (sl>=SCHAR_MAX)
	ld	a, c
	sub	a, #0x7f
	ld	a, b
	sbc	a, #0x00
	ld	a, e
	sbc	a, #0x00
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
	C$_fs2schar.c$38$1_0$21	= .
	.globl	C$_fs2schar.c$38$1_0$21
;_fs2schar.c:38: return SCHAR_MAX;
	ld	l, #0x7f
	jr	00105$
00102$:
	C$_fs2schar.c$39$1_0$21	= .
	.globl	C$_fs2schar.c$39$1_0$21
;_fs2schar.c:39: if (sl<=SCHAR_MIN)
	ld	a, #0x80
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	ld	a, #0xff
	sbc	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	M, 00104$
	C$_fs2schar.c$40$1_0$21	= .
	.globl	C$_fs2schar.c$40$1_0$21
;_fs2schar.c:40: return -SCHAR_MIN;
	ld	l, #0x80
	jr	00105$
00104$:
	C$_fs2schar.c$41$1_0$21	= .
	.globl	C$_fs2schar.c$41$1_0$21
;_fs2schar.c:41: return sl;
	ld	l, c
00105$:
	C$_fs2schar.c$42$1_0$21	= .
	.globl	C$_fs2schar.c$42$1_0$21
;_fs2schar.c:42: }
	pop	ix
	C$_fs2schar.c$42$1_0$21	= .
	.globl	C$_fs2schar.c$42$1_0$21
	XG$__fs2schar$0$0	= .
	.globl	XG$__fs2schar$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
