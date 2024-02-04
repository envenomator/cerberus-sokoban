;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
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
	dec	sp
	C$_divulong.c$8$2_0$2	= .
	.globl	C$_divulong.c$8$2_0$2
;_divulong.c:8: unsigned long reste = 0L;
	ld	bc, #0x0000
	ld	de, #0x0000
	C$_divulong.c$9$2_0$2	= .
	.globl	C$_divulong.c$9$2_0$2
;_divulong.c:9: unsigned char count = 32;
	ld	-1 (ix), #0x20
	C$_divulong.c$12$1_0$2	= .
	.globl	C$_divulong.c$12$1_0$2
;_divulong.c:12: do
00105$:
	C$_divulong.c$15$2_0$3	= .
	.globl	C$_divulong.c$15$2_0$3
;_divulong.c:15: c = MSB_SET(x);
	ld	a, 7 (ix)
	rlc	a
	and	a, #0x01
	ld	l, a
	ld	h, #0x00
	C$_divulong.c$16$2_0$3	= .
	.globl	C$_divulong.c$16$2_0$3
;_divulong.c:16: x <<= 1;
	sla	4 (ix)
	rl	5 (ix)
	rl	6 (ix)
	rl	7 (ix)
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
	ld	a, h
	or	a, l
	jr	Z,00102$
	C$_divulong.c$19$2_0$3	= .
	.globl	C$_divulong.c$19$2_0$3
;_divulong.c:19: reste |= 1L;
	set	0, c
00102$:
	C$_divulong.c$21$2_0$3	= .
	.globl	C$_divulong.c$21$2_0$3
;_divulong.c:21: if (reste >= y)
	ld	a, c
	sub	a, 8 (ix)
	ld	a, b
	sbc	a, 9 (ix)
	ld	a, e
	sbc	a, 10 (ix)
	ld	a, d
	sbc	a, 11 (ix)
	jr	C,00106$
	C$_divulong.c$23$3_0$4	= .
	.globl	C$_divulong.c$23$3_0$4
;_divulong.c:23: reste -= y;
	ld	a, c
	sub	a, 8 (ix)
	ld	c, a
	ld	a, b
	sbc	a, 9 (ix)
	ld	b, a
	ld	a, e
	sbc	a, 10 (ix)
	ld	e, a
	ld	a, d
	sbc	a, 11 (ix)
	ld	d, a
	C$_divulong.c$25$3_0$4	= .
	.globl	C$_divulong.c$25$3_0$4
;_divulong.c:25: x |= 1L;
	ld	a, 4 (ix)
	or	a, #0x01
	ld	4 (ix), a
	ld	a, 5 (ix)
	ld	5 (ix), a
	ld	a, 6 (ix)
	ld	6 (ix), a
	ld	a, 7 (ix)
	ld	7 (ix), a
00106$:
	C$_divulong.c$28$1_0$2	= .
	.globl	C$_divulong.c$28$1_0$2
;_divulong.c:28: while (--count);
	dec	-1 (ix)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ,00105$
	C$_divulong.c$29$1_0$2	= .
	.globl	C$_divulong.c$29$1_0$2
;_divulong.c:29: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	C$_divulong.c$30$1_0$2	= .
	.globl	C$_divulong.c$30$1_0$2
;_divulong.c:30: }
	inc	sp
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
