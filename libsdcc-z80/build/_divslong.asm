;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
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
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	C$_divslong.c$6$1_0$2	= .
	.globl	C$_divslong.c$6$1_0$2
;_divslong.c:6: r = (unsigned long)(x < 0 ? -x : x) / (unsigned long)(y < 0 ? -y : y);
	ld	a, 7 (ix)
	rlca
	and	a,#0x01
	ld	-6 (ix), a
	or	a, a
	jr	Z,00106$
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 7 (ix)
	ld	d, a
	jr	00107$
00106$:
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
00107$:
	ld	a, 11 (ix)
	rlca
	and	a,#0x01
	ld	-1 (ix), a
	or	a, a
	jr	Z,00108$
	xor	a, a
	sub	a, 8 (ix)
	ld	-5 (ix), a
	ld	a, #0x00
	sbc	a, 9 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, 10 (ix)
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, 11 (ix)
	ld	-2 (ix), a
	jr	00109$
00108$:
	ld	a, 8 (ix)
	ld	-5 (ix), a
	ld	a, 9 (ix)
	ld	-4 (ix), a
	ld	a, 10 (ix)
	ld	-3 (ix), a
	ld	a, 11 (ix)
	ld	-2 (ix), a
00109$:
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	push	de
	push	bc
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	C$_divslong.c$7$1_0$2	= .
	.globl	C$_divslong.c$7$1_0$2
;_divslong.c:7: if ((x < 0) ^ (y < 0))
	ld	a, -6 (ix)
	xor	a,-1 (ix)
	jr	Z,00102$
	C$_divslong.c$8$1_0$2	= .
	.globl	C$_divslong.c$8$1_0$2
;_divslong.c:8: return -r;
	xor	a, a
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	ld	a, #0x00
	sbc	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
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
