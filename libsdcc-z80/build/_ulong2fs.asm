;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _ulong2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
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
	G$__ulong2fs$0$0	= .
	.globl	G$__ulong2fs$0$0
	C$_ulong2fs.c$58$0_0$21	= .
	.globl	C$_ulong2fs.c$58$0_0$21
;_ulong2fs.c:58: float __ulong2fs (unsigned long a )
;	---------------------------------
; Function __ulong2fs
; ---------------------------------
___ulong2fs::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	C$_ulong2fs.c$63$1_0$21	= .
	.globl	C$_ulong2fs.c$63$1_0$21
;_ulong2fs.c:63: if (!a)
	ld	a, 7 (ix)
	or	a, 6 (ix)
	or	a, 5 (ix)
	or	a, 4 (ix)
	jr	NZ,00115$
	C$_ulong2fs.c$65$2_0$22	= .
	.globl	C$_ulong2fs.c$65$2_0$22
;_ulong2fs.c:65: return 0.0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00111$
	C$_ulong2fs.c$68$1_0$21	= .
	.globl	C$_ulong2fs.c$68$1_0$21
;_ulong2fs.c:68: while (a < HIDDEN)
00115$:
	ld	c, #0x96
00103$:
	ld	a, 6 (ix)
	sub	a, #0x80
	ld	a, 7 (ix)
	sbc	a, #0x00
	jr	NC,00118$
	C$_ulong2fs.c$70$2_0$23	= .
	.globl	C$_ulong2fs.c$70$2_0$23
;_ulong2fs.c:70: a <<= 1;
	sla	4 (ix)
	rl	5 (ix)
	rl	6 (ix)
	rl	7 (ix)
	C$_ulong2fs.c$71$2_0$23	= .
	.globl	C$_ulong2fs.c$71$2_0$23
;_ulong2fs.c:71: exp--;
	dec	c
	jr	00103$
	C$_ulong2fs.c$74$1_0$21	= .
	.globl	C$_ulong2fs.c$74$1_0$21
;_ulong2fs.c:74: while (a & NORM)
00118$:
00108$:
	ld	a, 7 (ix)
	or	a, a
	jr	Z,00110$
	C$_ulong2fs.c$77$2_0$24	= .
	.globl	C$_ulong2fs.c$77$2_0$24
;_ulong2fs.c:77: if (a & 1)
	bit	0, 4 (ix)
	jr	Z,00107$
	C$_ulong2fs.c$78$2_0$24	= .
	.globl	C$_ulong2fs.c$78$2_0$24
;_ulong2fs.c:78: a += 2;
	ld	a, 4 (ix)
	add	a, #0x02
	ld	4 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	5 (ix), a
	ld	a, 6 (ix)
	adc	a, #0x00
	ld	6 (ix), a
	jr	NC,00149$
	inc	7 (ix)
00149$:
00107$:
	C$_ulong2fs.c$79$2_0$24	= .
	.globl	C$_ulong2fs.c$79$2_0$24
;_ulong2fs.c:79: a >>= 1;
	srl	7 (ix)
	rr	6 (ix)
	rr	5 (ix)
	rr	4 (ix)
	C$_ulong2fs.c$80$2_0$24	= .
	.globl	C$_ulong2fs.c$80$2_0$24
;_ulong2fs.c:80: exp++;
	inc	c
	jr	00108$
00110$:
	C$_ulong2fs.c$83$1_0$21	= .
	.globl	C$_ulong2fs.c$83$1_0$21
;_ulong2fs.c:83: a &= ~HIDDEN ;
	ld	a, 4 (ix)
	ld	4 (ix), a
	ld	a, 5 (ix)
	ld	5 (ix), a
	ld	a, 6 (ix)
	and	a, #0x7f
	ld	6 (ix), a
	ld	a, 7 (ix)
	ld	7 (ix), a
	C$_ulong2fs.c$85$1_0$21	= .
	.globl	C$_ulong2fs.c$85$1_0$21
;_ulong2fs.c:85: fl.l = PACK(0,(unsigned long)exp, a);
	ld	hl, #0x0000
	add	hl, sp
	ld	b, #0x00
	ld	de, #0x0000
	ld	a, #0x17
00152$:
	sla	c
	rl	b
	rl	e
	rl	d
	dec	a
	jr	NZ,00152$
	ld	a, c
	or	a, 4 (ix)
	ld	c, a
	ld	a, b
	or	a, 5 (ix)
	ld	b, a
	ld	a, e
	or	a, 6 (ix)
	ld	e, a
	ld	a, d
	or	a, 7 (ix)
	ld	d, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_ulong2fs.c$87$1_0$21	= .
	.globl	C$_ulong2fs.c$87$1_0$21
;_ulong2fs.c:87: return (fl.f);
	ld	hl, #0x0000
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
00111$:
	C$_ulong2fs.c$88$1_0$21	= .
	.globl	C$_ulong2fs.c$88$1_0$21
;_ulong2fs.c:88: }
	ld	sp, ix
	pop	ix
	C$_ulong2fs.c$88$1_0$21	= .
	.globl	C$_ulong2fs.c$88$1_0$21
	XG$__ulong2fs$0$0	= .
	.globl	XG$__ulong2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
