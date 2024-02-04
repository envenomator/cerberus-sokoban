;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fslt
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fslt
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
	G$__fslt$0$0	= .
	.globl	G$__fslt$0$0
	C$_fslt.c$54$0_0$2	= .
	.globl	C$_fslt.c$54$0_0$2
;_fslt.c:54: char __fslt (float a1, float a2)
;	---------------------------------
; Function __fslt
; ---------------------------------
___fslt::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$_fslt.c$58$1_0$2	= .
	.globl	C$_fslt.c$58$1_0$2
;_fslt.c:58: fl1.f = a1;
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0010
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fslt.c$59$1_0$2	= .
	.globl	C$_fslt.c$59$1_0$2
;_fslt.c:59: fl2.f = a2;
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0014
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fslt.c$61$1_0$2	= .
	.globl	C$_fslt.c$61$1_0$2
;_fslt.c:61: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
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
	jr	NZ,00102$
	or	a,b
	jr	NZ,00102$
	cp	a, a
	adc	hl, hl
	jr	NZ,00102$
	C$_fslt.c$62$1_0$2	= .
	.globl	C$_fslt.c$62$1_0$2
;_fslt.c:62: return (0);
	ld	l, #0x00
	jp	00110$
00102$:
	C$_fslt.c$64$1_0$2	= .
	.globl	C$_fslt.c$64$1_0$2
;_fslt.c:64: if (fl1.l<0 && fl2.l<0) {
	ld	hl, #0x0004
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	bit	7, d
	jr	Z,00106$
	ld	hl, #0x0000
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	bit	7, d
	jr	Z,00106$
	C$_fslt.c$65$2_0$3	= .
	.globl	C$_fslt.c$65$2_0$3
;_fslt.c:65: if (fl2.l < fl1.l)
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #0x0004
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
	ld	a, -3 (ix)
	sbc	a, b
	ld	a, -2 (ix)
	sbc	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	P, 00104$
	C$_fslt.c$66$2_0$3	= .
	.globl	C$_fslt.c$66$2_0$3
;_fslt.c:66: return (1);
	ld	l, #0x01
	jr	00110$
00104$:
	C$_fslt.c$67$2_0$3	= .
	.globl	C$_fslt.c$67$2_0$3
;_fslt.c:67: return (0);
	ld	l, #0x00
	jr	00110$
00106$:
	C$_fslt.c$70$1_0$2	= .
	.globl	C$_fslt.c$70$1_0$2
;_fslt.c:70: if (fl1.l < fl2.l)
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
	ld	a, -3 (ix)
	sbc	a, b
	ld	a, -2 (ix)
	sbc	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P, 00109$
	C$_fslt.c$71$1_0$2	= .
	.globl	C$_fslt.c$71$1_0$2
;_fslt.c:71: return (1);
	ld	l, #0x01
	jr	00110$
00109$:
	C$_fslt.c$72$1_0$2	= .
	.globl	C$_fslt.c$72$1_0$2
;_fslt.c:72: return (0);
	ld	l, #0x00
00110$:
	C$_fslt.c$73$1_0$2	= .
	.globl	C$_fslt.c$73$1_0$2
;_fslt.c:73: }
	ld	sp, ix
	pop	ix
	C$_fslt.c$73$1_0$2	= .
	.globl	C$_fslt.c$73$1_0$2
	XG$__fslt$0$0	= .
	.globl	XG$__fslt$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
