;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fsadd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsadd
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
	G$__fsadd$0$0	= .
	.globl	G$__fsadd$0$0
	C$_fsadd.c$58$0_0$21	= .
	.globl	C$_fsadd.c$58$0_0$21
;_fsadd.c:58: float __fsadd (float a1, float a2)
;	---------------------------------
; Function __fsadd
; ---------------------------------
___fsadd::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-28
	add	hl, sp
	ld	sp, hl
	C$_fsadd.c$66$1_0$21	= .
	.globl	C$_fsadd.c$66$1_0$21
;_fsadd.c:66: pfl2 = (long _AUTOMEM *)&a2;
	ld	hl, #0x0024
	add	hl, sp
	ex	de, hl
	C$_fsadd.c$67$1_0$21	= .
	.globl	C$_fsadd.c$67$1_0$21
;_fsadd.c:67: exp2 = EXP (*pfl2);
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #4
	add	hl, sp
	ld	bc, #4
	ldir
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	ld	b, #0x07
00240$:
	srl	d
	rr	e
	djnz	00240$
	ld	-14 (ix), e
	ld	-13 (ix), #0x00
	C$_fsadd.c$68$1_0$21	= .
	.globl	C$_fsadd.c$68$1_0$21
;_fsadd.c:68: mant2 = MANT (*pfl2) << 4;
	ld	c, -24 (ix)
	ld	b, -23 (ix)
	ld	e, -22 (ix)
	ld	d, #0x00
	set	7, e
	ld	-8 (ix), c
	ld	-7 (ix), b
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	b, #0x04
00242$:
	sla	-8 (ix)
	rl	-7 (ix)
	rl	-6 (ix)
	rl	-5 (ix)
	djnz	00242$
	C$_fsadd.c$69$1_0$21	= .
	.globl	C$_fsadd.c$69$1_0$21
;_fsadd.c:69: if (SIGN (*pfl2))
	ld	a, -17 (ix)
	rlc	a
	and	a,#0x01
	jr	Z,00102$
	C$_fsadd.c$70$1_0$21	= .
	.globl	C$_fsadd.c$70$1_0$21
;_fsadd.c:70: mant2 = -mant2;
	xor	a, a
	sub	a, -8 (ix)
	ld	-8 (ix), a
	ld	a, #0x00
	sbc	a, -7 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	sbc	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, #0x00
	sbc	a, -5 (ix)
	ld	-5 (ix), a
00102$:
	C$_fsadd.c$72$1_0$21	= .
	.globl	C$_fsadd.c$72$1_0$21
;_fsadd.c:72: if (!*pfl2)
	ld	a, -21 (ix)
	or	a, -22 (ix)
	or	a, -23 (ix)
	or	a, -24 (ix)
	jr	NZ,00104$
	C$_fsadd.c$73$1_0$21	= .
	.globl	C$_fsadd.c$73$1_0$21
;_fsadd.c:73: return (a1);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	jp	00137$
00104$:
	C$_fsadd.c$75$1_0$21	= .
	.globl	C$_fsadd.c$75$1_0$21
;_fsadd.c:75: pfl1 = (long _AUTOMEM *)&a1;
	ld	hl, #0x0020
	add	hl, sp
	C$_fsadd.c$76$1_0$21	= .
	.globl	C$_fsadd.c$76$1_0$21
;_fsadd.c:76: exp1 = EXP (*pfl1);
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	-20 (ix), c
	ld	-19 (ix), b
	ld	-18 (ix), e
	ld	-17 (ix), d
	ld	a, -18 (ix)
	ld	-24 (ix), a
	ld	a, -17 (ix)
	ld	-23 (ix), a
	ld	-22 (ix), #0x00
	ld	-21 (ix), #0x00
	ld	a, #0x07
00244$:
	srl	-23 (ix)
	rr	-24 (ix)
	dec	a
	jr	NZ, 00244$
	ld	l, -24 (ix)
	ld	-24 (ix), l
	ld	-23 (ix), #0x00
	C$_fsadd.c$77$1_0$21	= .
	.globl	C$_fsadd.c$77$1_0$21
;_fsadd.c:77: mant1 = MANT (*pfl1) << 4;
	ld	-28 (ix), c
	ld	-27 (ix), b
	ld	-26 (ix), e
	ld	-25 (ix), #0x00
	ld	a, -28 (ix)
	ld	-28 (ix), a
	ld	a, -27 (ix)
	ld	-27 (ix), a
	ld	a, -26 (ix)
	or	a, #0x80
	ld	-26 (ix), a
	ld	a, -25 (ix)
	ld	-25 (ix), a
	ld	a, #0x04
00246$:
	sla	-28 (ix)
	rl	-27 (ix)
	rl	-26 (ix)
	rl	-25 (ix)
	dec	a
	jr	NZ,00246$
	C$_fsadd.c$78$1_0$21	= .
	.globl	C$_fsadd.c$78$1_0$21
;_fsadd.c:78: if (SIGN(*pfl1))
	ld	a, -17 (ix)
	rlc	a
	and	a,#0x01
	jr	Z,00108$
	C$_fsadd.c$79$1_0$21	= .
	.globl	C$_fsadd.c$79$1_0$21
;_fsadd.c:79: if (*pfl1 & 0x80000000)
	bit	7, d
	jr	Z,00108$
	C$_fsadd.c$80$1_0$21	= .
	.globl	C$_fsadd.c$80$1_0$21
;_fsadd.c:80: mant1 = -mant1;
	xor	a, a
	sub	a, -28 (ix)
	ld	-28 (ix), a
	ld	a, #0x00
	sbc	a, -27 (ix)
	ld	-27 (ix), a
	ld	a, #0x00
	sbc	a, -26 (ix)
	ld	-26 (ix), a
	ld	a, #0x00
	sbc	a, -25 (ix)
	ld	-25 (ix), a
00108$:
	C$_fsadd.c$82$1_0$21	= .
	.globl	C$_fsadd.c$82$1_0$21
;_fsadd.c:82: if (!*pfl1)
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	NZ,00110$
	C$_fsadd.c$83$1_0$21	= .
	.globl	C$_fsadd.c$83$1_0$21
;_fsadd.c:83: return (a2);
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	e, 10 (ix)
	ld	d, 11 (ix)
	jp	00137$
00110$:
	C$_fsadd.c$85$1_0$21	= .
	.globl	C$_fsadd.c$85$1_0$21
;_fsadd.c:85: expd = exp1 - exp2;
	ld	a, -24 (ix)
	sub	a, -14 (ix)
	ld	-20 (ix), a
	ld	a, -23 (ix)
	sbc	a, -13 (ix)
	ld	-19 (ix), a
	C$_fsadd.c$86$1_0$21	= .
	.globl	C$_fsadd.c$86$1_0$21
;_fsadd.c:86: if (expd > 25)
	ld	a, #0x19
	cp	a, -20 (ix)
	ld	a, #0x00
	sbc	a, -19 (ix)
	jp	PO, 00249$
	xor	a, #0x80
00249$:
	jp	P, 00112$
	C$_fsadd.c$87$1_0$21	= .
	.globl	C$_fsadd.c$87$1_0$21
;_fsadd.c:87: return (a1);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	jp	00137$
00112$:
	C$_fsadd.c$88$1_0$21	= .
	.globl	C$_fsadd.c$88$1_0$21
;_fsadd.c:88: if (expd < -25)
	ld	a, -20 (ix)
	sub	a, #0xe7
	ld	a, -19 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC,00114$
	C$_fsadd.c$89$1_0$21	= .
	.globl	C$_fsadd.c$89$1_0$21
;_fsadd.c:89: return (a2);
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	e, 10 (ix)
	ld	d, 11 (ix)
	jp	00137$
00114$:
	C$_fsadd.c$91$1_0$21	= .
	.globl	C$_fsadd.c$91$1_0$21
;_fsadd.c:91: if (expd < 0)
	bit	7, -19 (ix)
	jr	Z,00116$
	C$_fsadd.c$93$2_0$22	= .
	.globl	C$_fsadd.c$93$2_0$22
;_fsadd.c:93: expd = -expd;
	xor	a, a
	sub	a, -20 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, -19 (ix)
	ld	b, a
	C$_fsadd.c$94$2_0$22	= .
	.globl	C$_fsadd.c$94$2_0$22
;_fsadd.c:94: exp1 += expd;
	ld	a, -24 (ix)
	add	a, c
	ld	-24 (ix), a
	ld	a, -23 (ix)
	adc	a, b
	ld	-23 (ix), a
	C$_fsadd.c$95$2_0$22	= .
	.globl	C$_fsadd.c$95$2_0$22
;_fsadd.c:95: mant1 >>= expd;
	inc	c
	jr	00251$
00250$:
	sra	-25 (ix)
	rr	-26 (ix)
	rr	-27 (ix)
	rr	-28 (ix)
00251$:
	dec	c
	jr	NZ, 00250$
	jr	00117$
00116$:
	C$_fsadd.c$99$2_0$23	= .
	.globl	C$_fsadd.c$99$2_0$23
;_fsadd.c:99: mant2 >>= expd;
	ld	b, -20 (ix)
	inc	b
	jr	00253$
00252$:
	sra	-5 (ix)
	rr	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
00253$:
	djnz	00252$
00117$:
	C$_fsadd.c$101$1_0$21	= .
	.globl	C$_fsadd.c$101$1_0$21
;_fsadd.c:101: mant1 += mant2;
	ld	a, -28 (ix)
	add	a, -8 (ix)
	ld	-28 (ix), a
	ld	a, -27 (ix)
	adc	a, -7 (ix)
	ld	-27 (ix), a
	ld	a, -26 (ix)
	adc	a, -6 (ix)
	ld	-26 (ix), a
	ld	a, -25 (ix)
	adc	a, -5 (ix)
	ld	-25 (ix), a
	ld	hl, #24
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #4
	ldir
	C$_fsadd.c$103$1_0$21	= .
	.globl	C$_fsadd.c$103$1_0$21
;_fsadd.c:103: sign = false;
	ld	-16 (ix), #0x00
	ld	-15 (ix), #0x00
	C$_fsadd.c$105$1_0$21	= .
	.globl	C$_fsadd.c$105$1_0$21
;_fsadd.c:105: if (mant1 < 0)
	bit	7, -1 (ix)
	jr	Z,00121$
	C$_fsadd.c$107$2_0$24	= .
	.globl	C$_fsadd.c$107$2_0$24
;_fsadd.c:107: mant1 = -mant1;
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, #0x00
	sbc	a, -1 (ix)
	ld	-1 (ix), a
	C$_fsadd.c$108$2_0$24	= .
	.globl	C$_fsadd.c$108$2_0$24
;_fsadd.c:108: sign = true;
	ld	-16 (ix), #0x01
	ld	-15 (ix), #0x00
	jr	00154$
00121$:
	C$_fsadd.c$110$1_0$21	= .
	.globl	C$_fsadd.c$110$1_0$21
;_fsadd.c:110: else if (!mant1)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	or	a, -3 (ix)
	or	a, -4 (ix)
	jr	NZ,00154$
	C$_fsadd.c$111$1_0$21	= .
	.globl	C$_fsadd.c$111$1_0$21
;_fsadd.c:111: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00137$
	C$_fsadd.c$114$1_0$21	= .
	.globl	C$_fsadd.c$114$1_0$21
;_fsadd.c:114: while (mant1 < (HIDDEN<<4)) {
00154$:
	ld	a, -24 (ix)
	ld	-28 (ix), a
	ld	a, -23 (ix)
	ld	-27 (ix), a
00123$:
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #24
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a, -17 (ix)
	sub	a, #0x08
	jr	NC,00157$
	C$_fsadd.c$115$2_0$25	= .
	.globl	C$_fsadd.c$115$2_0$25
;_fsadd.c:115: mant1 <<= 1;
	sla	-4 (ix)
	rl	-3 (ix)
	rl	-2 (ix)
	rl	-1 (ix)
	C$_fsadd.c$116$2_0$25	= .
	.globl	C$_fsadd.c$116$2_0$25
;_fsadd.c:116: exp1--;
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
	jr	00123$
	C$_fsadd.c$120$1_0$21	= .
	.globl	C$_fsadd.c$120$1_0$21
;_fsadd.c:120: while (mant1 & 0xf0000000) {
00157$:
	ld	a, -28 (ix)
	ld	-12 (ix), a
	ld	a, -27 (ix)
	ld	-11 (ix), a
00128$:
	ld	a, -1 (ix)
	and	a, #0xf0
	jr	Z,00163$
	C$_fsadd.c$121$2_0$26	= .
	.globl	C$_fsadd.c$121$2_0$26
;_fsadd.c:121: if (mant1&1)
	bit	0, -4 (ix)
	jr	Z,00127$
	C$_fsadd.c$122$2_0$26	= .
	.globl	C$_fsadd.c$122$2_0$26
;_fsadd.c:122: mant1 += 2;
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	jr	NC,00258$
	inc	-1 (ix)
00258$:
00127$:
	C$_fsadd.c$123$2_0$26	= .
	.globl	C$_fsadd.c$123$2_0$26
;_fsadd.c:123: mant1 >>= 1;
	sra	-1 (ix)
	rr	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	C$_fsadd.c$124$2_0$26	= .
	.globl	C$_fsadd.c$124$2_0$26
;_fsadd.c:124: exp1++;
	inc	-12 (ix)
	jr	NZ,00128$
	inc	-11 (ix)
	jr	00128$
00163$:
	ld	a, -12 (ix)
	ld	-28 (ix), a
	ld	a, -11 (ix)
	ld	-27 (ix), a
	C$_fsadd.c$128$1_0$21	= .
	.globl	C$_fsadd.c$128$1_0$21
;_fsadd.c:128: mant1 &= ~(HIDDEN<<4);
	ld	a, -4 (ix)
	ld	-20 (ix), a
	ld	a, -3 (ix)
	ld	-19 (ix), a
	ld	a, -2 (ix)
	ld	-18 (ix), a
	ld	a, -1 (ix)
	and	a, #0xf7
	ld	-17 (ix), a
	C$_fsadd.c$131$1_0$21	= .
	.globl	C$_fsadd.c$131$1_0$21
;_fsadd.c:131: if (exp1 >= 0x100)
	ld	a, -11 (ix)
	xor	a, #0x80
	sub	a, #0x81
	jr	C,00135$
	C$_fsadd.c$132$1_0$21	= .
	.globl	C$_fsadd.c$132$1_0$21
;_fsadd.c:132: *pfl1 = (sign ? (SIGNBIT | __INFINITY) : __INFINITY);
	ld	a, -15 (ix)
	or	a, -16 (ix)
	jr	Z,00139$
	ld	-24 (ix), #0x00
	ld	-23 (ix), #0x00
	ld	-22 (ix), #0x80
	ld	-21 (ix), #0xff
	jr	00140$
00139$:
	ld	-24 (ix), #0x00
	ld	-23 (ix), #0x00
	ld	-22 (ix), #0x80
	ld	-21 (ix), #0x7f
00140$:
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	jp	00136$
00135$:
	C$_fsadd.c$133$1_0$21	= .
	.globl	C$_fsadd.c$133$1_0$21
;_fsadd.c:133: else if (exp1 < 0)
	bit	7, -11 (ix)
	jr	Z,00132$
	C$_fsadd.c$134$1_0$21	= .
	.globl	C$_fsadd.c$134$1_0$21
;_fsadd.c:134: *pfl1 = 0;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), #0x00
	jp	00136$
00132$:
	C$_fsadd.c$136$1_0$21	= .
	.globl	C$_fsadd.c$136$1_0$21
;_fsadd.c:136: *pfl1 = PACK (sign ? SIGNBIT : 0 , exp1, mant1>>4);
	ld	a, -15 (ix)
	or	a, -16 (ix)
	jr	Z,00141$
	ld	-24 (ix), #0x00
	ld	-23 (ix), #0x00
	ld	-22 (ix), #0x00
	ld	-21 (ix), #0x80
	jr	00142$
00141$:
	xor	a, a
	ld	-24 (ix), a
	ld	-23 (ix), a
	ld	-22 (ix), a
	ld	-21 (ix), a
00142$:
	ld	a, -28 (ix)
	ld	-28 (ix), a
	ld	a, -27 (ix)
	ld	-27 (ix), a
	rla
	sbc	a, a
	ld	-26 (ix), a
	ld	-25 (ix), a
	ld	b, #0x17
00262$:
	sla	-28 (ix)
	rl	-27 (ix)
	rl	-26 (ix)
	rl	-25 (ix)
	djnz	00262$
	ld	a, -28 (ix)
	or	a, -24 (ix)
	ld	-28 (ix), a
	ld	a, -27 (ix)
	or	a, -23 (ix)
	ld	-27 (ix), a
	ld	a, -26 (ix)
	or	a, -22 (ix)
	ld	-26 (ix), a
	ld	a, -25 (ix)
	or	a, -21 (ix)
	ld	-25 (ix), a
	ld	b, #0x04
00264$:
	sra	-17 (ix)
	rr	-18 (ix)
	rr	-19 (ix)
	rr	-20 (ix)
	djnz	00264$
	ld	a, -28 (ix)
	or	a, -20 (ix)
	ld	-28 (ix), a
	ld	a, -27 (ix)
	or	a, -19 (ix)
	ld	-27 (ix), a
	ld	a, -26 (ix)
	or	a, -18 (ix)
	ld	-26 (ix), a
	ld	a, -25 (ix)
	or	a, -17 (ix)
	ld	-25 (ix), a
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	hl, #0x0000
	add	hl, sp
	ld	bc, #0x0004
	ldir
00136$:
	C$_fsadd.c$137$1_0$21	= .
	.globl	C$_fsadd.c$137$1_0$21
;_fsadd.c:137: return (a1);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
00137$:
	C$_fsadd.c$138$1_0$21	= .
	.globl	C$_fsadd.c$138$1_0$21
;_fsadd.c:138: }
	ld	sp, ix
	pop	ix
	C$_fsadd.c$138$1_0$21	= .
	.globl	C$_fsadd.c$138$1_0$21
	XG$__fsadd$0$0	= .
	.globl	XG$__fsadd$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
