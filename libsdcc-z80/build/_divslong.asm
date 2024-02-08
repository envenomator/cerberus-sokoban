;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module _divslong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divslong
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
	G$_divslong$0$0	= .
	.globl	G$_divslong$0$0
	C$_divslong.c$2$0_0$2	= .
	.globl	C$_divslong.c$2$0_0$2
;_divslong.c:2: _divslong (long x, long y)
;	---------------------------------
; Function _divslong
; ---------------------------------
__divslong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	c, e
	ld	b, d
	ex	de,hl
	C$_divslong.c$6$1_0$2	= .
	.globl	C$_divslong.c$6$1_0$2
;_divslong.c:6: r = (unsigned long)(x < 0 ? -x : x) / (unsigned long)(y < 0 ? -y : y);
	ld	a, d
	rlca
	and	a,#0x01
	ld	-6 (ix), a
	or	a, a
	jr	Z, 00106$
	xor	a, a
	sub	a, c
	ld	-10 (ix), a
	ld	a, #0x00
	sbc	a, b
	ld	-9 (ix), a
	ld	a, #0x00
	sbc	a, e
	ld	-8 (ix), a
	sbc	a, a
	sub	a, d
	ld	-7 (ix), a
	jr	00107$
00106$:
	inc	sp
	inc	sp
	push	bc
	ld	-8 (ix), e
	ld	-7 (ix), d
00107$:
	ld	hl, #5
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a, 7 (ix)
	rlca
	and	a,#0x01
	ld	-1 (ix), a
	or	a, a
	jr	Z, 00108$
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	e, a
	sbc	a, a
	sub	a, 7 (ix)
	ld	d, a
	jr	00109$
00108$:
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
00109$:
	push	de
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	C$_divslong.c$7$1_0$2	= .
	.globl	C$_divslong.c$7$1_0$2
;_divslong.c:7: if ((x < 0) ^ (y < 0))
	ld	a, -6 (ix)
	xor	a,-1 (ix)
	jr	Z, 00102$
	C$_divslong.c$8$1_0$2	= .
	.globl	C$_divslong.c$8$1_0$2
;_divslong.c:8: return -r;
	xor	a, a
	sub	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
	ld	a, #0x00
	sbc	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sbc	a, a
	sub	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	C$_divslong.c$10$1_0$2	= .
	.globl	C$_divslong.c$10$1_0$2
;_divslong.c:10: return r;
00102$:
	C$_divslong.c$11$1_0$2	= .
	.globl	C$_divslong.c$11$1_0$2
;_divslong.c:11: }
	ld	sp, ix
	pop	ix
	C$_divslong.c$11$1_0$2	= .
	.globl	C$_divslong.c$11$1_0$2
	XG$_divslong$0$0	= .
	.globl	XG$_divslong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
