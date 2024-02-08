;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module _divslonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divslonglong
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
	G$_divslonglong$0$0	= .
	.globl	G$_divslonglong$0$0
	C$_divslonglong.c$5$0_0$2	= .
	.globl	C$_divslonglong.c$5$0_0$2
;_divslonglong.c:5: _divslonglong (long long numerator, long long denominator)
;	---------------------------------
; Function _divslonglong
; ---------------------------------
__divslonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
	C$_divslonglong.c$7$1_0$2	= .
	.globl	C$_divslonglong.c$7$1_0$2
;_divslonglong.c:7: bool numeratorneg = (numerator < 0);
	ld	a, 13 (ix)
	rlca
	and	a,#0x01
	ld	c, a
	C$_divslonglong.c$8$1_0$2	= .
	.globl	C$_divslonglong.c$8$1_0$2
;_divslonglong.c:8: bool denominatorneg = (denominator < 0);
	ld	a, 21 (ix)
	rlca
	and	a,#0x01
	ld	b, a
	C$_divslonglong.c$11$1_0$2	= .
	.globl	C$_divslonglong.c$11$1_0$2
;_divslonglong.c:11: if (numeratorneg)
	ld	a, c
	or	a, a
	jr	Z, 00102$
	C$_divslonglong.c$12$1_0$2	= .
	.globl	C$_divslonglong.c$12$1_0$2
;_divslonglong.c:12: numerator = -numerator;
	xor	a, a
	sub	a, 6 (ix)
	ld	6 (ix), a
	ld	a, #0x00
	sbc	a, 7 (ix)
	ld	7 (ix), a
	ld	a, #0x00
	sbc	a, 8 (ix)
	ld	8 (ix), a
	ld	a, #0x00
	sbc	a, 9 (ix)
	ld	9 (ix), a
	ld	a, #0x00
	sbc	a, 10 (ix)
	ld	10 (ix), a
	ld	a, #0x00
	sbc	a, 11 (ix)
	ld	11 (ix), a
	ld	a, #0x00
	sbc	a, 12 (ix)
	ld	12 (ix), a
	sbc	a, a
	sub	a, 13 (ix)
	ld	13 (ix), a
00102$:
	C$_divslonglong.c$13$1_0$2	= .
	.globl	C$_divslonglong.c$13$1_0$2
;_divslonglong.c:13: if (denominatorneg)
	ld	a, b
	or	a, a
	jr	Z, 00104$
	C$_divslonglong.c$14$1_0$2	= .
	.globl	C$_divslonglong.c$14$1_0$2
;_divslonglong.c:14: denominator = -denominator;
	xor	a, a
	sub	a, 14 (ix)
	ld	14 (ix), a
	ld	a, #0x00
	sbc	a, 15 (ix)
	ld	15 (ix), a
	ld	a, #0x00
	sbc	a, 16 (ix)
	ld	16 (ix), a
	ld	a, #0x00
	sbc	a, 17 (ix)
	ld	17 (ix), a
	ld	a, #0x00
	sbc	a, 18 (ix)
	ld	18 (ix), a
	ld	a, #0x00
	sbc	a, 19 (ix)
	ld	19 (ix), a
	ld	a, #0x00
	sbc	a, 20 (ix)
	ld	20 (ix), a
	sbc	a, a
	sub	a, 21 (ix)
	ld	21 (ix), a
00104$:
	C$_divslonglong.c$16$1_0$2	= .
	.globl	C$_divslonglong.c$16$1_0$2
;_divslonglong.c:16: d = (unsigned long long)numerator / (unsigned long long)denominator;
	push	bc
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	hl, #24
	add	hl, sp
	ld	bc, #8
	ldir
	ld	hl, #10
	add	hl, sp
	ex	de, hl
	ld	hl, #32
	add	hl, sp
	ld	bc, #8
	ldir
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	hl, #0x001a
	add	hl, sp
	push	hl
	call	__divulonglong
	ld	hl, #18
	add	hl, sp
	ld	sp, hl
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	hl, #10
	add	hl, sp
	ld	bc, #8
	ldir
	pop	bc
	C$_divslonglong.c$18$1_0$2	= .
	.globl	C$_divslonglong.c$18$1_0$2
;_divslonglong.c:18: return ((numeratorneg ^ denominatorneg) ? -d : d);
	ld	a, c
	xor	a,b
	jr	Z, 00107$
	xor	a, a
	sub	a, -16 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	sbc	a, -15 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	sbc	a, -14 (ix)
	ld	-6 (ix), a
	ld	a, #0x00
	sbc	a, -13 (ix)
	ld	-5 (ix), a
	ld	a, #0x00
	sbc	a, -12 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, -10 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -9 (ix)
	ld	-1 (ix), a
	jr	00108$
00107$:
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #8
	ldir
00108$:
	ld	hl, #20
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #8
	add	hl, sp
	ld	bc, #8
	ldir
	C$_divslonglong.c$19$1_0$2	= .
	.globl	C$_divslonglong.c$19$1_0$2
;_divslonglong.c:19: }
	ld	sp, ix
	pop	ix
	C$_divslonglong.c$19$1_0$2	= .
	.globl	C$_divslonglong.c$19$1_0$2
	XG$_divslonglong$0$0	= .
	.globl	XG$_divslonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
