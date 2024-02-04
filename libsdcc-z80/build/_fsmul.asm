;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fsmul
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsmul
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
	G$__fsmul$0$0	= .
	.globl	G$__fsmul$0$0
	C$_fsmul.c$57$0_0$21	= .
	.globl	C$_fsmul.c$57$0_0$21
;_fsmul.c:57: float __fsmul (float a1, float a2) {
;	---------------------------------
; Function __fsmul
; ---------------------------------
___fsmul::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-25
	add	hl, sp
	ld	sp, hl
	C$_fsmul.c$63$1_0$21	= .
	.globl	C$_fsmul.c$63$1_0$21
;_fsmul.c:63: fl1.f = a1;
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	hl, #0x001d
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsmul.c$64$1_0$21	= .
	.globl	C$_fsmul.c$64$1_0$21
;_fsmul.c:64: fl2.f = a2;
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	hl, #0x0021
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_fsmul.c$66$1_0$21	= .
	.globl	C$_fsmul.c$66$1_0$21
;_fsmul.c:66: if (!fl1.l || !fl2.l)
	ld	hl, #0x0008
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
	ld	hl, #0x0004
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
	jr	NZ,00102$
00101$:
	C$_fsmul.c$67$1_0$21	= .
	.globl	C$_fsmul.c$67$1_0$21
;_fsmul.c:67: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00113$
00102$:
	C$_fsmul.c$70$1_0$21	= .
	.globl	C$_fsmul.c$70$1_0$21
;_fsmul.c:70: sign = SIGN (fl1.l) ^ SIGN (fl2.l);
	ld	hl, #0x0008
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	rlc	a
	and	a, #0x01
	ld	-13 (ix), a
	ld	hl, #0x0004
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	rlc	a
	and	a, #0x01
	xor	a, -13 (ix)
	ld	c, a
	C$_fsmul.c$71$1_0$21	= .
	.globl	C$_fsmul.c$71$1_0$21
;_fsmul.c:71: exp = EXP (fl1.l) - EXCESS;
	ld	hl, #0x0008
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	b, #0x17
00149$:
	srl	h
	rr	l
	rr	d
	rr	e
	djnz	00149$
	ld	b, #0x00
	ld	a, e
	add	a, #0x82
	ld	-4 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-3 (ix), a
	C$_fsmul.c$72$1_0$21	= .
	.globl	C$_fsmul.c$72$1_0$21
;_fsmul.c:72: exp += EXP (fl2.l);
	ld	hl, #0x0004
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	b, #0x17
00151$:
	srl	h
	rr	l
	rr	d
	rr	e
	djnz	00151$
	ld	d, #0x00
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$_fsmul.c$74$1_0$21	= .
	.globl	C$_fsmul.c$74$1_0$21
;_fsmul.c:74: fl1.l = MANT (fl1.l);
	ld	hl, #0x0008
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #0x0008
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	b, #0x00
	ld	-12 (ix), e
	ld	-11 (ix), d
	ld	a, l
	or	a, #0x80
	ld	-10 (ix), a
	ld	-9 (ix), b
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #0x000f
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	C$_fsmul.c$75$1_0$21	= .
	.globl	C$_fsmul.c$75$1_0$21
;_fsmul.c:75: fl2.l = MANT (fl2.l);
	ld	hl, #0x0004
	add	hl, sp
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	hl, #0x0004
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	b, #0x00
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	a, l
	or	a, #0x80
	ld	-6 (ix), a
	ld	-5 (ix), b
	push	bc
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	hl, #0x0013
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	C$_fsmul.c$78$1_0$21	= .
	.globl	C$_fsmul.c$78$1_0$21
;_fsmul.c:78: result = (unsigned long)((unsigned short)(fl1.l >> 8)) * (unsigned short)(fl2.l >> 8);
	ld	hl, #0x0008
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	h, (hl)
	ld	-8 (ix), d
	ld	-7 (ix), h
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	hl,#0x0004+1+1
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	d, e
	ld	e, h
	ld	hl, #0x0000
	push	bc
	push	hl
	push	de
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-25 (ix), l
	ld	-24 (ix), h
	ld	-23 (ix), e
	ld	-22 (ix), d
	C$_fsmul.c$79$1_0$21	= .
	.globl	C$_fsmul.c$79$1_0$21
;_fsmul.c:79: result += ((unsigned long)((unsigned short)(fl1.l & 0xff)) * (unsigned short)(fl2.l >> 8)) >> 8;
	ld	hl, #0x0008
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, #0x00
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	hl,#0x0004+1+1
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	d, e
	ld	e, h
	ld	hl, #0x0000
	push	bc
	push	hl
	push	de
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-8 (ix), h
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	-5 (ix), #0x00
	ld	a, -25 (ix)
	add	a, -8 (ix)
	ld	-25 (ix), a
	ld	a, -24 (ix)
	adc	a, -7 (ix)
	ld	-24 (ix), a
	ld	a, -23 (ix)
	adc	a, -6 (ix)
	ld	-23 (ix), a
	ld	a, -22 (ix)
	adc	a, -5 (ix)
	ld	-22 (ix), a
	C$_fsmul.c$80$1_0$21	= .
	.globl	C$_fsmul.c$80$1_0$21
;_fsmul.c:80: result += ((unsigned long)((unsigned short)(fl2.l & 0xff)) * (unsigned short)(fl1.l >> 8)) >> 8;
	ld	hl, #0x0004
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, #0x00
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	hl,#0x0008+1+1
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	d, e
	ld	e, h
	ld	hl, #0x0000
	push	bc
	push	hl
	push	de
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-8 (ix), h
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	-5 (ix), #0x00
	ld	a, -25 (ix)
	add	a, -8 (ix)
	ld	-25 (ix), a
	ld	a, -24 (ix)
	adc	a, -7 (ix)
	ld	-24 (ix), a
	ld	a, -23 (ix)
	adc	a, -6 (ix)
	ld	-23 (ix), a
	ld	a, -22 (ix)
	adc	a, -5 (ix)
	ld	-22 (ix), a
	C$_fsmul.c$83$1_0$21	= .
	.globl	C$_fsmul.c$83$1_0$21
;_fsmul.c:83: result += 0x40;
	ld	a, -25 (ix)
	add	a, #0x40
	ld	-25 (ix), a
	ld	a, -24 (ix)
	adc	a, #0x00
	ld	-24 (ix), a
	ld	a, -23 (ix)
	adc	a, #0x00
	ld	-23 (ix), a
	jr	NC,00165$
	inc	-22 (ix)
00165$:
	C$_fsmul.c$85$1_0$21	= .
	.globl	C$_fsmul.c$85$1_0$21
;_fsmul.c:85: if (result & SIGNBIT)
	bit	7, -22 (ix)
	jr	Z,00105$
	C$_fsmul.c$88$2_0$22	= .
	.globl	C$_fsmul.c$88$2_0$22
;_fsmul.c:88: result += 0x40;
	ld	a, -25 (ix)
	add	a, #0x40
	ld	-25 (ix), a
	ld	a, -24 (ix)
	adc	a, #0x00
	ld	-24 (ix), a
	ld	a, -23 (ix)
	adc	a, #0x00
	ld	-23 (ix), a
	jr	NC,00167$
	inc	-22 (ix)
00167$:
	C$_fsmul.c$89$2_0$22	= .
	.globl	C$_fsmul.c$89$2_0$22
;_fsmul.c:89: result >>= 8;
	ld	b, #0x08
00168$:
	srl	-22 (ix)
	rr	-23 (ix)
	rr	-24 (ix)
	rr	-25 (ix)
	djnz	00168$
	jr	00106$
00105$:
	C$_fsmul.c$93$2_0$23	= .
	.globl	C$_fsmul.c$93$2_0$23
;_fsmul.c:93: result >>= 7;
	ld	b, #0x07
00170$:
	srl	-22 (ix)
	rr	-23 (ix)
	rr	-24 (ix)
	rr	-25 (ix)
	djnz	00170$
	C$_fsmul.c$94$2_0$23	= .
	.globl	C$_fsmul.c$94$2_0$23
;_fsmul.c:94: exp--;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
00106$:
	C$_fsmul.c$97$1_0$21	= .
	.globl	C$_fsmul.c$97$1_0$21
;_fsmul.c:97: result &= ~HIDDEN;
	ld	a, -25 (ix)
	ld	-25 (ix), a
	ld	a, -24 (ix)
	ld	-24 (ix), a
	ld	a, -23 (ix)
	and	a, #0x7f
	ld	-23 (ix), a
	ld	a, -22 (ix)
	ld	-22 (ix), a
	C$_fsmul.c$100$1_0$21	= .
	.globl	C$_fsmul.c$100$1_0$21
;_fsmul.c:100: if (exp >= 0x100)
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x81
	jr	C,00111$
	C$_fsmul.c$101$1_0$21	= .
	.globl	C$_fsmul.c$101$1_0$21
;_fsmul.c:101: fl1.l = (sign ? SIGNBIT : 0) | __INFINITY;
	ld	hl, #0x0008
	add	hl, sp
	ld	a, c
	or	a, a
	jr	Z,00115$
	ld	bc, #0x0000
	ld	de, #0x8000
	jr	00116$
00115$:
	ld	bc, #0x0000
	ld	de, #0x0000
00116$:
	set	7, e
	ld	a, d
	or	a, #0x7f
	ld	d, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00112$
00111$:
	C$_fsmul.c$102$1_0$21	= .
	.globl	C$_fsmul.c$102$1_0$21
;_fsmul.c:102: else if (exp < 0)
	bit	7, -1 (ix)
	jr	Z,00108$
	C$_fsmul.c$103$1_0$21	= .
	.globl	C$_fsmul.c$103$1_0$21
;_fsmul.c:103: fl1.l = 0;
	ld	hl, #0x0008
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), #0x00
	jr	00112$
00108$:
	C$_fsmul.c$105$1_0$21	= .
	.globl	C$_fsmul.c$105$1_0$21
;_fsmul.c:105: fl1.l = PACK (sign ? SIGNBIT : 0 , exp, result);
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	a, c
	or	a, a
	jr	Z,00117$
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x80
	jr	00118$
00117$:
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), a
00118$:
	ld	l, -2 (ix)
	ld	a, -1 (ix)
	ld	h, a
	rla
	sbc	a, a
	ld	bc, #0x0000
	ld	a, #0x07
00172$:
	add	hl, hl
	dec	a
	jr	NZ,00172$
	ld	a, c
	or	a, -8 (ix)
	ld	c, a
	ld	a, b
	or	a, -7 (ix)
	ld	b, a
	ld	a, l
	or	a, -6 (ix)
	ld	l, a
	ld	a, h
	or	a, -5 (ix)
	ld	h, a
	ld	a, c
	or	a, -25 (ix)
	ld	-8 (ix), a
	ld	a, b
	or	a, -24 (ix)
	ld	-7 (ix), a
	ld	a, l
	or	a, -23 (ix)
	ld	-6 (ix), a
	ld	a, h
	or	a, -22 (ix)
	ld	-5 (ix), a
	ld	hl, #0x0011
	add	hl, sp
	ld	bc, #0x0004
	ldir
00112$:
	C$_fsmul.c$106$1_0$21	= .
	.globl	C$_fsmul.c$106$1_0$21
;_fsmul.c:106: return (fl1.f);
	ld	hl, #0x0008
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
00113$:
	C$_fsmul.c$107$1_0$21	= .
	.globl	C$_fsmul.c$107$1_0$21
;_fsmul.c:107: }
	ld	sp, ix
	pop	ix
	C$_fsmul.c$107$1_0$21	= .
	.globl	C$_fsmul.c$107$1_0$21
	XG$__fsmul$0$0	= .
	.globl	XG$__fsmul$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
