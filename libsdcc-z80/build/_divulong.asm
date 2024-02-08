;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module _divulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divulong
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
	G$_divulong$0$0	= .
	.globl	G$_divulong$0$0
	C$_divulong.c$6$0_0$2	= .
	.globl	C$_divulong.c$6$0_0$2
;_divulong.c:6: _divulong (unsigned long x, unsigned long y)
;	---------------------------------
; Function _divulong
; ---------------------------------
__divulong::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	inc	sp
	push	de
	ld	-3 (ix), l
	ld	-2 (ix), h
	C$_divulong.c$8$2_0$2	= .
	.globl	C$_divulong.c$8$2_0$2
;_divulong.c:8: unsigned long reste = 0L;
	ld	bc, #0x0000
	ld	d, b
	ld	e, c
	C$_divulong.c$12$1_0$2	= .
	.globl	C$_divulong.c$12$1_0$2
;_divulong.c:12: do
	ld	-1 (ix), #0x20
00105$:
	C$_divulong.c$15$2_0$3	= .
	.globl	C$_divulong.c$15$2_0$3
;_divulong.c:15: c = MSB_SET(x);
	ld	a, -2 (ix)
	rlca
	and	a, #0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$_divulong.c$16$2_0$3	= .
	.globl	C$_divulong.c$16$2_0$3
;_divulong.c:16: x <<= 1;
	sla	-5 (ix)
	rl	-4 (ix)
	rl	-3 (ix)
	rl	-2 (ix)
	C$_divulong.c$17$2_0$3	= .
	.globl	C$_divulong.c$17$2_0$3
;_divulong.c:17: reste <<= 1;
	sla	c
	rl	b
	rl	e
	rl	d
	C$_divulong.c$18$2_0$3	= .
	.globl	C$_divulong.c$18$2_0$3
;_divulong.c:18: if (c)
	ld	a, l
	or	a, a
	jr	Z, 00102$
	C$_divulong.c$19$2_0$3	= .
	.globl	C$_divulong.c$19$2_0$3
;_divulong.c:19: reste |= 1L;
	set	0, c
00102$:
	C$_divulong.c$21$2_0$3	= .
	.globl	C$_divulong.c$21$2_0$3
;_divulong.c:21: if (reste >= y)
	ld	a, c
	sub	a, 4 (ix)
	ld	a, b
	sbc	a, 5 (ix)
	ld	a, e
	sbc	a, 6 (ix)
	ld	a, d
	sbc	a, 7 (ix)
	jr	C, 00106$
	C$_divulong.c$23$3_0$4	= .
	.globl	C$_divulong.c$23$3_0$4
;_divulong.c:23: reste -= y;
	ld	a, c
	sub	a, 4 (ix)
	ld	c, a
	ld	a, b
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, e
	sbc	a, 6 (ix)
	ld	e, a
	ld	a, d
	sbc	a, 7 (ix)
	ld	d, a
	C$_divulong.c$25$3_0$4	= .
	.globl	C$_divulong.c$25$3_0$4
;_divulong.c:25: x |= 1L;
	ld	a, -5 (ix)
	ld	-5 (ix), a
	set	0, -5 (ix)
00106$:
	C$_divulong.c$28$1_0$2	= .
	.globl	C$_divulong.c$28$1_0$2
;_divulong.c:28: while (--count);
	dec	-1 (ix)
	jr	NZ, 00105$
	C$_divulong.c$29$1_0$2	= .
	.globl	C$_divulong.c$29$1_0$2
;_divulong.c:29: return x;
	pop	de
	push	de
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	C$_divulong.c$30$1_0$2	= .
	.globl	C$_divulong.c$30$1_0$2
;_divulong.c:30: }
	ld	sp, ix
	pop	ix
	C$_divulong.c$30$1_0$2	= .
	.globl	C$_divulong.c$30$1_0$2
	XG$_divulong$0$0	= .
	.globl	XG$_divulong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
