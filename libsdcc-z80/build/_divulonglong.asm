;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _divulonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divulonglong
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
	G$_divulonglong$0$0	= .
	.globl	G$_divulonglong$0$0
	C$_divulonglong.c$7$0_0$2	= .
	.globl	C$_divulonglong.c$7$0_0$2
;_divulonglong.c:7: _divulonglong (unsigned long long x, unsigned long long y)
;	---------------------------------
; Function _divulonglong
; ---------------------------------
__divulonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$_divulonglong.c$9$2_0$2	= .
	.globl	C$_divulonglong.c$9$2_0$2
;_divulonglong.c:9: unsigned long long reste = 0L;
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
	C$_divulonglong.c$10$2_0$2	= .
	.globl	C$_divulonglong.c$10$2_0$2
;_divulonglong.c:10: unsigned char count = 64;
	ld	c, #0x40
	C$_divulonglong.c$13$1_0$2	= .
	.globl	C$_divulonglong.c$13$1_0$2
;_divulonglong.c:13: do
00105$:
	C$_divulonglong.c$16$2_0$3	= .
	.globl	C$_divulonglong.c$16$2_0$3
;_divulonglong.c:16: c = MSB_SET(x);
	ld	a, 13 (ix)
	rlc	a
	and	a, #0x01
	ld	b, a
	ld	e, #0x00
	C$_divulonglong.c$17$2_0$3	= .
	.globl	C$_divulonglong.c$17$2_0$3
;_divulonglong.c:17: x <<= 1;
	sla	6 (ix)
	rl	7 (ix)
	rl	8 (ix)
	rl	9 (ix)
	rl	10 (ix)
	rl	11 (ix)
	rl	12 (ix)
	rl	13 (ix)
	C$_divulonglong.c$18$2_0$3	= .
	.globl	C$_divulonglong.c$18$2_0$3
;_divulonglong.c:18: reste <<= 1;
	sla	-8 (ix)
	rl	-7 (ix)
	rl	-6 (ix)
	rl	-5 (ix)
	rl	-4 (ix)
	rl	-3 (ix)
	rl	-2 (ix)
	rl	-1 (ix)
	C$_divulonglong.c$19$2_0$3	= .
	.globl	C$_divulonglong.c$19$2_0$3
;_divulonglong.c:19: if (c)
	ld	a, e
	or	a, b
	jr	Z,00102$
	C$_divulonglong.c$20$2_0$3	= .
	.globl	C$_divulonglong.c$20$2_0$3
;_divulonglong.c:20: reste |= 1L;
	ld	a, -8 (ix)
	or	a, #0x01
	ld	-8 (ix), a
	ld	a, -7 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	ld	-1 (ix), a
00102$:
	C$_divulonglong.c$22$2_0$3	= .
	.globl	C$_divulonglong.c$22$2_0$3
;_divulonglong.c:22: if (reste >= y)
	ld	a, -8 (ix)
	sub	a, 14 (ix)
	ld	a, -7 (ix)
	sbc	a, 15 (ix)
	ld	a, -6 (ix)
	sbc	a, 16 (ix)
	ld	a, -5 (ix)
	sbc	a, 17 (ix)
	ld	a, -4 (ix)
	sbc	a, 18 (ix)
	ld	a, -3 (ix)
	sbc	a, 19 (ix)
	ld	a, -2 (ix)
	sbc	a, 20 (ix)
	ld	a, -1 (ix)
	sbc	a, 21 (ix)
	jr	C,00106$
	C$_divulonglong.c$24$3_0$4	= .
	.globl	C$_divulonglong.c$24$3_0$4
;_divulonglong.c:24: reste -= y;
	ld	a, -8 (ix)
	sub	a, 14 (ix)
	ld	-8 (ix), a
	ld	a, -7 (ix)
	sbc	a, 15 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	sbc	a, 16 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sbc	a, 17 (ix)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	sbc	a, 18 (ix)
	ld	-4 (ix), a
	ld	a, -3 (ix)
	sbc	a, 19 (ix)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	sbc	a, 20 (ix)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	sbc	a, 21 (ix)
	ld	-1 (ix), a
	C$_divulonglong.c$26$3_0$4	= .
	.globl	C$_divulonglong.c$26$3_0$4
;_divulonglong.c:26: x |= 1L;
	ld	a, 6 (ix)
	or	a, #0x01
	ld	6 (ix), a
	ld	a, 7 (ix)
	ld	7 (ix), a
	ld	a, 8 (ix)
	ld	8 (ix), a
	ld	a, 9 (ix)
	ld	9 (ix), a
	ld	a, 10 (ix)
	ld	10 (ix), a
	ld	a, 11 (ix)
	ld	11 (ix), a
	ld	a, 12 (ix)
	ld	12 (ix), a
	ld	a, 13 (ix)
	ld	13 (ix), a
00106$:
	C$_divulonglong.c$29$1_0$2	= .
	.globl	C$_divulonglong.c$29$1_0$2
;_divulonglong.c:29: while (--count);
	ld	a, c
	dec	a
	ld	c, a
	or	a, a
	jp	NZ, 00105$
	C$_divulonglong.c$30$1_0$2	= .
	.globl	C$_divulonglong.c$30$1_0$2
;_divulonglong.c:30: return x;
	ld	hl,#12
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #14
	add	hl, sp
	ld	bc, #8
	ldir
	C$_divulonglong.c$31$1_0$2	= .
	.globl	C$_divulonglong.c$31$1_0$2
;_divulonglong.c:31: }
	ld	sp, ix
	pop	ix
	C$_divulonglong.c$31$1_0$2	= .
	.globl	C$_divulonglong.c$31$1_0$2
	XG$_divulonglong$0$0	= .
	.globl	XG$_divulonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
