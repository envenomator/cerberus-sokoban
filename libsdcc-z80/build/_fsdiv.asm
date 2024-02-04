;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fsdiv
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsdiv
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
	G$__fsdiv$0$0	= .
	.globl	G$__fsdiv$0$0
	C$_fsdiv.c$133$1_0$29	= .
	.globl	C$_fsdiv.c$133$1_0$29
;_fsdiv.c:133: float __fsdiv (float a1, float a2)
;	---------------------------------
; Function __fsdiv
; ---------------------------------
___fsdiv::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	C$_fsdiv.c$135$1_0$29	= .
	.globl	C$_fsdiv.c$135$1_0$29
;_fsdiv.c:135: unsigned long _AUTOMEM *p2 = (unsigned long *) &a2;
	ld	hl, #0x000c
	add	hl, sp
	C$_fsdiv.c$137$1_0$29	= .
	.globl	C$_fsdiv.c$137$1_0$29
;_fsdiv.c:137: if (EXP (*p2) == 0) // a2 is denormal or zero, treat as zero
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x07
00126$:
	srl	d
	rr	e
	djnz	00126$
	ld	a, e
	or	a, a
	jp	NZ,00108$
	C$_fsdiv.c$140$2_0$30	= .
	.globl	C$_fsdiv.c$140$2_0$30
;_fsdiv.c:140: unsigned long _AUTOMEM *p = (unsigned long *) &f;
	ld	hl, #0x0000
	add	hl, sp
	ld	b, l
	ld	c, h
	C$_fsdiv.c$141$1_0$29	= .
	.globl	C$_fsdiv.c$141$1_0$29
;_fsdiv.c:141: if (a1 > 0.0f)
	push	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x0000
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, l
	pop	bc
	or	a, a
	jr	Z,00105$
	C$_fsdiv.c$142$2_0$30	= .
	.globl	C$_fsdiv.c$142$2_0$30
;_fsdiv.c:142: *p = __INFINITY;           // +inf
	ld	l, b
	ld	h, c
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), #0x80
	inc	hl
	ld	(hl), #0x7f
	jr	00106$
00105$:
	C$_fsdiv.c$143$1_0$29	= .
	.globl	C$_fsdiv.c$143$1_0$29
;_fsdiv.c:143: else if (a1 < 0.0f)
	push	bc
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
	pop	bc
	or	a, a
	jr	Z,00102$
	C$_fsdiv.c$144$2_0$30	= .
	.globl	C$_fsdiv.c$144$2_0$30
;_fsdiv.c:144: *p = SIGNBIT | __INFINITY; // -inf
	ld	l, b
	ld	h, c
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), #0x80
	inc	hl
	ld	(hl), #0xff
	jr	00106$
00102$:
	C$_fsdiv.c$146$2_0$30	= .
	.globl	C$_fsdiv.c$146$2_0$30
;_fsdiv.c:146: *p = __NAN;                // nan
	ld	l, b
	ld	h, c
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), #0xc0
	inc	hl
	ld	(hl), #0xff
00106$:
	C$_fsdiv.c$147$2_0$30	= .
	.globl	C$_fsdiv.c$147$2_0$30
;_fsdiv.c:147: return f;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	jr	00109$
00108$:
	C$_fsdiv.c$149$1_0$29	= .
	.globl	C$_fsdiv.c$149$1_0$29
;_fsdiv.c:149: return __fsdiv_org (a1, a2);
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fsdiv_org
	pop	af
	pop	af
	pop	af
	pop	af
00109$:
	C$_fsdiv.c$150$1_0$29	= .
	.globl	C$_fsdiv.c$150$1_0$29
;_fsdiv.c:150: }
	ld	sp, ix
	pop	ix
	C$_fsdiv.c$150$1_0$29	= .
	.globl	C$_fsdiv.c$150$1_0$29
	XG$__fsdiv$0$0	= .
	.globl	XG$__fsdiv$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	F_fsdiv$__fsdiv_org$0$0	= .
	.globl	F_fsdiv$__fsdiv_org$0$0
	C$_fsdiv.c$58$0_0$21	= .
	.globl	C$_fsdiv.c$58$0_0$21
;_fsdiv.c:58: static float __fsdiv_org (float a1, float a2)
;	---------------------------------
; Function __fsdiv_org
; ---------------------------------
___fsdiv_org:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-47
	add	hl, sp
	ld	sp, hl
	C$_fsdiv.c$67$1_0$21	= .
	.globl	C$_fsdiv.c$67$1_0$21
;_fsdiv.c:67: fl1.f = a1;
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0033
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsdiv.c$69$1_0$21	= .
	.globl	C$_fsdiv.c$69$1_0$21
;_fsdiv.c:69: exp = EXP (fl1.l);
	ld	hl, #0x0004
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x07
00174$:
	srl	d
	rr	e
	djnz	00174$
	ld	-27 (ix), e
	C$_fsdiv.c$71$1_0$21	= .
	.globl	C$_fsdiv.c$71$1_0$21
;_fsdiv.c:71: if (!exp)
	ld	-26 (ix), #0x00
	ld	a, #0x00
	or	a, -27 (ix)
	jr	NZ,00102$
	C$_fsdiv.c$72$1_0$21	= .
	.globl	C$_fsdiv.c$72$1_0$21
;_fsdiv.c:72: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00118$
00102$:
	C$_fsdiv.c$74$1_0$21	= .
	.globl	C$_fsdiv.c$74$1_0$21
;_fsdiv.c:74: fl2.f = a2;
	ld	hl, #0x0000
	add	hl, sp
	ld	-25 (ix), l
	ld	-24 (ix), h
	ex	de,hl
	ld	hl, #0x0037
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsdiv.c$76$1_0$21	= .
	.globl	C$_fsdiv.c$76$1_0$21
;_fsdiv.c:76: exp -= EXP (fl2.l);
	ld	hl, #0x0000
	add	hl, sp
	ld	-25 (ix), l
	ld	-24 (ix), h
	ex	de,hl
	ld	hl, #0x0010
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	b, #0x17
00176$:
	srl	-28 (ix)
	rr	-29 (ix)
	rr	-30 (ix)
	rr	-31 (ix)
	djnz	00176$
	ld	a, -31 (ix)
	ld	-31 (ix), a
	ld	a, -30 (ix)
	ld	-30 (ix), a
	ld	a, -31 (ix)
	ld	-31 (ix), a
	ld	-30 (ix), #0x00
	ld	a, -27 (ix)
	sub	a, -31 (ix)
	ld	-31 (ix), a
	ld	a, -26 (ix)
	sbc	a, -30 (ix)
	ld	-30 (ix), a
	ld	a, -31 (ix)
	ld	-18 (ix), a
	ld	a, -30 (ix)
	ld	-17 (ix), a
	C$_fsdiv.c$77$1_0$21	= .
	.globl	C$_fsdiv.c$77$1_0$21
;_fsdiv.c:77: exp += EXCESS;
	ld	a, -18 (ix)
	add	a, #0x7e
	ld	-31 (ix), a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	-30 (ix), a
	C$_fsdiv.c$80$1_0$21	= .
	.globl	C$_fsdiv.c$80$1_0$21
;_fsdiv.c:80: sign = SIGN (fl1.l) ^ SIGN (fl2.l);
	ld	hl, #0x0004
	add	hl, sp
	ld	-25 (ix), l
	ld	-24 (ix), h
	ex	de,hl
	ld	hl, #0x000c
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a, -32 (ix)
	rlc	a
	and	a, #0x01
	ld	-35 (ix), a
	ld	hl, #0x0000
	add	hl, sp
	ld	-25 (ix), l
	ld	-24 (ix), h
	ex	de,hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a, -36 (ix)
	rlc	a
	and	a, #0x01
	xor	a, -35 (ix)
	ld	-19 (ix), a
	C$_fsdiv.c$83$1_0$21	= .
	.globl	C$_fsdiv.c$83$1_0$21
;_fsdiv.c:83: mant1 = MANT (fl1.l);
	ld	hl, #0x0004
	add	hl, sp
	ld	-39 (ix), l
	ld	-38 (ix), h
	ex	de,hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a, -39 (ix)
	ld	-39 (ix), a
	ld	a, -38 (ix)
	ld	-38 (ix), a
	ld	a, -37 (ix)
	ld	-37 (ix), a
	ld	-36 (ix), #0x00
	ld	a, -39 (ix)
	ld	-12 (ix), a
	ld	a, -38 (ix)
	ld	-11 (ix), a
	ld	a, -37 (ix)
	or	a, #0x80
	ld	-10 (ix), a
	ld	a, -36 (ix)
	ld	-9 (ix), a
	C$_fsdiv.c$84$1_0$21	= .
	.globl	C$_fsdiv.c$84$1_0$21
;_fsdiv.c:84: mant2 = MANT (fl2.l);
	ld	hl, #0x0000
	add	hl, sp
	ld	-39 (ix), l
	ld	-38 (ix), h
	ex	de,hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a, -39 (ix)
	ld	-39 (ix), a
	ld	a, -38 (ix)
	ld	-38 (ix), a
	ld	a, -37 (ix)
	ld	-37 (ix), a
	ld	-36 (ix), #0x00
	ld	a, -39 (ix)
	ld	-16 (ix), a
	ld	a, -38 (ix)
	ld	-15 (ix), a
	ld	a, -37 (ix)
	or	a, #0x80
	ld	-14 (ix), a
	ld	a, -36 (ix)
	ld	-13 (ix), a
	C$_fsdiv.c$87$1_0$21	= .
	.globl	C$_fsdiv.c$87$1_0$21
;_fsdiv.c:87: if (mant1 < mant2)
	ld	a, -12 (ix)
	sub	a, -16 (ix)
	ld	a, -11 (ix)
	sbc	a, -15 (ix)
	ld	a, -10 (ix)
	sbc	a, -14 (ix)
	ld	a, -9 (ix)
	sbc	a, -13 (ix)
	jr	NC,00104$
	C$_fsdiv.c$89$2_0$22	= .
	.globl	C$_fsdiv.c$89$2_0$22
;_fsdiv.c:89: mask = 0x1000000;
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x01
	jr	00105$
00104$:
	C$_fsdiv.c$93$2_0$23	= .
	.globl	C$_fsdiv.c$93$2_0$23
;_fsdiv.c:93: mask = 0x0800000;
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x80
	ld	-5 (ix), #0x00
	C$_fsdiv.c$94$2_0$23	= .
	.globl	C$_fsdiv.c$94$2_0$23
;_fsdiv.c:94: exp++;
	inc	-31 (ix)
	jr	NZ,00178$
	inc	-30 (ix)
00178$:
00105$:
	C$_fsdiv.c$97$1_0$21	= .
	.globl	C$_fsdiv.c$97$1_0$21
;_fsdiv.c:97: if (exp < 1) /* denormal */
	ld	a, -31 (ix)
	sub	a, #0x01
	ld	a, -30 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
	C$_fsdiv.c$98$1_0$21	= .
	.globl	C$_fsdiv.c$98$1_0$21
;_fsdiv.c:98: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00118$
00107$:
	C$_fsdiv.c$100$1_0$21	= .
	.globl	C$_fsdiv.c$100$1_0$21
;_fsdiv.c:100: if (exp >= 255)
	ld	a, -31 (ix)
	sub	a, #0xff
	ld	a, -30 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00116$
	C$_fsdiv.c$102$2_0$24	= .
	.globl	C$_fsdiv.c$102$2_0$24
;_fsdiv.c:102: fl1.l = sign ? SIGNBIT | __INFINITY : __INFINITY;
	ld	hl, #0x0004
	add	hl, sp
	ld	-39 (ix), l
	ld	-38 (ix), h
	ld	a, -19 (ix)
	or	a, a
	jr	Z,00120$
	ld	-35 (ix), #0x00
	ld	-34 (ix), #0x00
	ld	-33 (ix), #0x80
	ld	-32 (ix), #0xff
	jr	00121$
00120$:
	ld	-35 (ix), #0x00
	ld	-34 (ix), #0x00
	ld	-33 (ix), #0x80
	ld	-32 (ix), #0x7f
00121$:
	ld	e, -39 (ix)
	ld	d, -38 (ix)
	ld	hl, #0x000c
	add	hl, sp
	ld	bc, #0x0004
	ldir
	jp	00117$
00116$:
	C$_fsdiv.c$107$2_0$25	= .
	.globl	C$_fsdiv.c$107$2_0$25
;_fsdiv.c:107: result = 0;
	ld	bc, #0x0000
	ld	de, #0x0000
	C$_fsdiv.c$108$2_0$25	= .
	.globl	C$_fsdiv.c$108$2_0$25
;_fsdiv.c:108: do
00110$:
	C$_fsdiv.c$110$3_0$26	= .
	.globl	C$_fsdiv.c$110$3_0$26
;_fsdiv.c:110: long diff = mant1 - mant2;
	ld	a, -12 (ix)
	sub	a, -16 (ix)
	ld	-23 (ix), a
	ld	a, -11 (ix)
	sbc	a, -15 (ix)
	ld	-22 (ix), a
	ld	a, -10 (ix)
	sbc	a, -14 (ix)
	ld	-21 (ix), a
	ld	a, -9 (ix)
	sbc	a, -13 (ix)
	ld	-20 (ix), a
	C$_fsdiv.c$111$3_0$26	= .
	.globl	C$_fsdiv.c$111$3_0$26
;_fsdiv.c:111: if (diff >= 0)
	bit	7, -20 (ix)
	jr	NZ,00109$
	C$_fsdiv.c$113$4_0$27	= .
	.globl	C$_fsdiv.c$113$4_0$27
;_fsdiv.c:113: mant1 = diff;
	ld	a, -23 (ix)
	ld	-12 (ix), a
	ld	a, -22 (ix)
	ld	-11 (ix), a
	ld	a, -21 (ix)
	ld	-10 (ix), a
	ld	a, -20 (ix)
	ld	-9 (ix), a
	C$_fsdiv.c$114$4_0$27	= .
	.globl	C$_fsdiv.c$114$4_0$27
;_fsdiv.c:114: result |= mask;
	ld	a, c
	or	a, -8 (ix)
	ld	c, a
	ld	a, b
	or	a, -7 (ix)
	ld	b, a
	ld	a, e
	or	a, -6 (ix)
	ld	e, a
	ld	a, d
	or	a, -5 (ix)
	ld	d, a
00109$:
	C$_fsdiv.c$116$3_0$26	= .
	.globl	C$_fsdiv.c$116$3_0$26
;_fsdiv.c:116: mant1 <<= 1;
	sla	-12 (ix)
	rl	-11 (ix)
	rl	-10 (ix)
	rl	-9 (ix)
	C$_fsdiv.c$117$3_0$26	= .
	.globl	C$_fsdiv.c$117$3_0$26
;_fsdiv.c:117: mask >>= 1;
	srl	-5 (ix)
	rr	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
	C$_fsdiv.c$119$2_0$25	= .
	.globl	C$_fsdiv.c$119$2_0$25
;_fsdiv.c:119: while (mask);
	ld	a, -5 (ix)
	or	a, -6 (ix)
	or	a, -7 (ix)
	or	a, -8 (ix)
	jp	NZ, 00110$
	C$_fsdiv.c$122$2_0$25	= .
	.globl	C$_fsdiv.c$122$2_0$25
;_fsdiv.c:122: if (mant1 >= mant2)
	ld	a, -12 (ix)
	sub	a, -16 (ix)
	ld	a, -11 (ix)
	sbc	a, -15 (ix)
	ld	a, -10 (ix)
	sbc	a, -14 (ix)
	ld	a, -9 (ix)
	sbc	a, -13 (ix)
	jr	C,00114$
	C$_fsdiv.c$123$2_0$25	= .
	.globl	C$_fsdiv.c$123$2_0$25
;_fsdiv.c:123: result += 1;
	inc	c
	jr	NZ,00183$
	inc	b
	jr	NZ,00183$
	inc	de
00183$:
00114$:
	C$_fsdiv.c$125$2_0$25	= .
	.globl	C$_fsdiv.c$125$2_0$25
;_fsdiv.c:125: result &= ~HIDDEN;
	ld	-4 (ix), c
	ld	-3 (ix), b
	ld	a, e
	and	a, #0x7f
	ld	-2 (ix), a
	ld	-1 (ix), d
	C$_fsdiv.c$128$2_0$25	= .
	.globl	C$_fsdiv.c$128$2_0$25
;_fsdiv.c:128: fl1.l = PACK (sign ? SIGNBIT : 0 , exp, result);
	ld	hl, #0x0004
	add	hl, sp
	ld	-39 (ix), l
	ld	-38 (ix), h
	ld	a, -19 (ix)
	or	a, a
	jr	Z,00122$
	ld	-35 (ix), #0x00
	ld	-34 (ix), #0x00
	ld	-33 (ix), #0x00
	ld	-32 (ix), #0x80
	jr	00123$
00122$:
	xor	a, a
	ld	-35 (ix), a
	ld	-34 (ix), a
	ld	-33 (ix), a
	ld	-32 (ix), a
00123$:
	ld	c, -31 (ix)
	ld	a, -30 (ix)
	ld	b, a
	rla
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	-29 (ix), c
	ld	-28 (ix), b
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x00
	ld	b, #0x07
00184$:
	sla	-29 (ix)
	rl	-28 (ix)
	djnz	00184$
	ld	a, -35 (ix)
	or	a, -31 (ix)
	ld	-35 (ix), a
	ld	a, -34 (ix)
	or	a, -30 (ix)
	ld	-34 (ix), a
	ld	a, -33 (ix)
	or	a, -29 (ix)
	ld	-33 (ix), a
	ld	a, -32 (ix)
	or	a, -28 (ix)
	ld	-32 (ix), a
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #43
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a, -35 (ix)
	or	a, -31 (ix)
	ld	-35 (ix), a
	ld	a, -34 (ix)
	or	a, -30 (ix)
	ld	-34 (ix), a
	ld	a, -33 (ix)
	or	a, -29 (ix)
	ld	-33 (ix), a
	ld	a, -32 (ix)
	or	a, -28 (ix)
	ld	-32 (ix), a
	ld	e, -39 (ix)
	ld	d, -38 (ix)
	ld	hl, #0x000c
	add	hl, sp
	ld	bc, #0x0004
	ldir
00117$:
	C$_fsdiv.c$130$1_0$21	= .
	.globl	C$_fsdiv.c$130$1_0$21
;_fsdiv.c:130: return (fl1.f);
	ld	hl, #0x0004
	add	hl, sp
	ld	-39 (ix), l
	ld	-38 (ix), h
	ex	de,hl
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	l, -39 (ix)
	ld	h, -38 (ix)
	ld	e, -37 (ix)
	ld	d, -36 (ix)
00118$:
	C$_fsdiv.c$131$1_0$21	= .
	.globl	C$_fsdiv.c$131$1_0$21
;_fsdiv.c:131: }
	ld	sp, ix
	pop	ix
	C$_fsdiv.c$131$1_0$21	= .
	.globl	C$_fsdiv.c$131$1_0$21
	XF_fsdiv$__fsdiv_org$0$0	= .
	.globl	XF_fsdiv$__fsdiv_org$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
