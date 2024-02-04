;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fseq
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fseq
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
	G$__fseq$0$0	= .
	.globl	G$__fseq$0$0
	C$_fseq.c$55$0_0$2	= .
	.globl	C$_fseq.c$55$0_0$2
;_fseq.c:55: __fseq (float a1, float a2)
;	---------------------------------
; Function __fseq
; ---------------------------------
___fseq::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$_fseq.c$59$1_0$2	= .
	.globl	C$_fseq.c$59$1_0$2
;_fseq.c:59: fl1.f = a1;
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0010
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fseq.c$60$1_0$2	= .
	.globl	C$_fseq.c$60$1_0$2
;_fseq.c:60: fl2.f = a2;
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0014
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fseq.c$62$1_0$2	= .
	.globl	C$_fseq.c$62$1_0$2
;_fseq.c:62: if (fl1.l == fl2.l)
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
	sub	a, d
	jr	NZ,00102$
	C$_fseq.c$63$1_0$2	= .
	.globl	C$_fseq.c$63$1_0$2
;_fseq.c:63: return (1);
	ld	l, #0x01
	jr	00106$
00102$:
	C$_fseq.c$65$1_0$2	= .
	.globl	C$_fseq.c$65$1_0$2
;_fseq.c:65: if ((fl1.l & 0x7fffffff) == 0 && (fl2.l & 0x7fffffff) == 0)
	ld	hl, #0x0004
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,b
	jr	NZ,00104$
	cp	a, a
	adc	hl, hl
	jr	NZ,00104$
	ld	hl, #0x0000
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,b
	jr	NZ,00104$
	cp	a, a
	adc	hl, hl
	C$_fseq.c$66$1_0$2	= .
	.globl	C$_fseq.c$66$1_0$2
;_fseq.c:66: return (1);
	C$_fseq.c$67$1_0$2	= .
	.globl	C$_fseq.c$67$1_0$2
;_fseq.c:67: return (0);
	jr	NZ, 00104$
	ld	l, #0x01
	.db	#0xc2
00104$:
	ld	l, #0x00
00106$:
	C$_fseq.c$68$1_0$2	= .
	.globl	C$_fseq.c$68$1_0$2
;_fseq.c:68: }
	ld	sp, ix
	pop	ix
	C$_fseq.c$68$1_0$2	= .
	.globl	C$_fseq.c$68$1_0$2
	XG$__fseq$0$0	= .
	.globl	XG$__fseq$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
