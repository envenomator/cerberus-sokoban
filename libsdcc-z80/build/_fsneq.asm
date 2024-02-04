;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fsneq
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsneq
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
	G$__fsneq$0$0	= .
	.globl	G$__fsneq$0$0
	C$_fsneq.c$54$0_0$2	= .
	.globl	C$_fsneq.c$54$0_0$2
;_fsneq.c:54: char __fsneq (float a1, float a2)
;	---------------------------------
; Function __fsneq
; ---------------------------------
___fsneq::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$_fsneq.c$58$1_0$2	= .
	.globl	C$_fsneq.c$58$1_0$2
;_fsneq.c:58: fl1.f = a1;
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0010
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsneq.c$59$1_0$2	= .
	.globl	C$_fsneq.c$59$1_0$2
;_fsneq.c:59: fl2.f = a2;
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0014
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsneq.c$61$1_0$2	= .
	.globl	C$_fsneq.c$61$1_0$2
;_fsneq.c:61: if (fl1.l == fl2.l)
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #0x0000
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -4 (ix)
	sub	a, c
	jr	NZ,00102$
	ld	a, -3 (ix)
	sub	a, b
	jr	NZ,00102$
	ld	a, -2 (ix)
	sub	a, e
	jr	NZ,00102$
	ld	a, -1 (ix)
	C$_fsneq.c$62$1_0$2	= .
	.globl	C$_fsneq.c$62$1_0$2
;_fsneq.c:62: return (0);
	sub	a,d
	jr	NZ,00102$
	ld	l,a
	jr	00105$
00102$:
	C$_fsneq.c$63$1_0$2	= .
	.globl	C$_fsneq.c$63$1_0$2
;_fsneq.c:63: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #0x0000
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -4 (ix)
	or	a, c
	ld	c, a
	ld	a, -3 (ix)
	or	a, b
	ld	b, a
	ld	a, -2 (ix)
	or	a, e
	ld	l, a
	ld	a, -1 (ix)
	or	a, d
	ld	h, a
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,b
	jr	NZ,00104$
	cp	a, a
	adc	hl, hl
	C$_fsneq.c$64$1_0$2	= .
	.globl	C$_fsneq.c$64$1_0$2
;_fsneq.c:64: return (0);
	C$_fsneq.c$65$1_0$2	= .
	.globl	C$_fsneq.c$65$1_0$2
;_fsneq.c:65: return (1);
	jr	NZ, 00104$
	ld	l, #0x00
	.db	#0xc2
00104$:
	ld	l, #0x01
00105$:
	C$_fsneq.c$66$1_0$2	= .
	.globl	C$_fsneq.c$66$1_0$2
;_fsneq.c:66: }
	ld	sp, ix
	pop	ix
	C$_fsneq.c$66$1_0$2	= .
	.globl	C$_fsneq.c$66$1_0$2
	XG$__fsneq$0$0	= .
	.globl	XG$__fsneq$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
