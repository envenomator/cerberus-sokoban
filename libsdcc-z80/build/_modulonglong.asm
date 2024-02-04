;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _modulonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __modulonglong
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
	G$_modulonglong$0$0	= .
	.globl	G$_modulonglong$0$0
	C$_modulonglong.c$4$0_0$2	= .
	.globl	C$_modulonglong.c$4$0_0$2
;_modulonglong.c:4: _modulonglong (unsigned long long a, unsigned long long b)
;	---------------------------------
; Function _modulonglong
; ---------------------------------
__modulonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_modulonglong.c$6$2_0$2	= .
	.globl	C$_modulonglong.c$6$2_0$2
;_modulonglong.c:6: unsigned char count = 0;
	C$_modulonglong.c$8$1_0$2	= .
	.globl	C$_modulonglong.c$8$1_0$2
;_modulonglong.c:8: while (!MSB_SET(b))
	ld	bc, #0x0000
00103$:
	ld	a, 21 (ix)
	rlc	a
	and	a,#0x01
	jr	NZ,00117$
	C$_modulonglong.c$10$2_0$3	= .
	.globl	C$_modulonglong.c$10$2_0$3
;_modulonglong.c:10: b <<= 1;
	sla	14 (ix)
	rl	15 (ix)
	rl	16 (ix)
	rl	17 (ix)
	rl	18 (ix)
	rl	19 (ix)
	rl	20 (ix)
	rl	21 (ix)
	C$_modulonglong.c$11$2_0$3	= .
	.globl	C$_modulonglong.c$11$2_0$3
;_modulonglong.c:11: if (b > a)
	ld	a, 6 (ix)
	sub	a, 14 (ix)
	ld	a, 7 (ix)
	sbc	a, 15 (ix)
	ld	a, 8 (ix)
	sbc	a, 16 (ix)
	ld	a, 9 (ix)
	sbc	a, 17 (ix)
	ld	a, 10 (ix)
	sbc	a, 18 (ix)
	ld	a, 11 (ix)
	sbc	a, 19 (ix)
	ld	a, 12 (ix)
	sbc	a, 20 (ix)
	ld	a, 13 (ix)
	sbc	a, 21 (ix)
	jr	NC,00102$
	C$_modulonglong.c$13$3_0$4	= .
	.globl	C$_modulonglong.c$13$3_0$4
;_modulonglong.c:13: b >>=1;
	srl	21 (ix)
	rr	20 (ix)
	rr	19 (ix)
	rr	18 (ix)
	rr	17 (ix)
	rr	16 (ix)
	rr	15 (ix)
	rr	14 (ix)
	C$_modulonglong.c$14$3_0$4	= .
	.globl	C$_modulonglong.c$14$3_0$4
;_modulonglong.c:14: break;
	jr	00117$
00102$:
	C$_modulonglong.c$16$2_0$3	= .
	.globl	C$_modulonglong.c$16$2_0$3
;_modulonglong.c:16: count++;
	inc	b
	ld	c, b
	jp	00103$
	C$_modulonglong.c$18$1_0$2	= .
	.globl	C$_modulonglong.c$18$1_0$2
;_modulonglong.c:18: do
00117$:
00108$:
	C$_modulonglong.c$20$2_0$5	= .
	.globl	C$_modulonglong.c$20$2_0$5
;_modulonglong.c:20: if (a >= b)
	ld	a, 6 (ix)
	sub	a, 14 (ix)
	ld	a, 7 (ix)
	sbc	a, 15 (ix)
	ld	a, 8 (ix)
	sbc	a, 16 (ix)
	ld	a, 9 (ix)
	sbc	a, 17 (ix)
	ld	a, 10 (ix)
	sbc	a, 18 (ix)
	ld	a, 11 (ix)
	sbc	a, 19 (ix)
	ld	a, 12 (ix)
	sbc	a, 20 (ix)
	ld	a, 13 (ix)
	sbc	a, 21 (ix)
	jr	C,00107$
	C$_modulonglong.c$21$2_0$5	= .
	.globl	C$_modulonglong.c$21$2_0$5
;_modulonglong.c:21: a -= b;
	ld	a, 6 (ix)
	sub	a, 14 (ix)
	ld	6 (ix), a
	ld	a, 7 (ix)
	sbc	a, 15 (ix)
	ld	7 (ix), a
	ld	a, 8 (ix)
	sbc	a, 16 (ix)
	ld	8 (ix), a
	ld	a, 9 (ix)
	sbc	a, 17 (ix)
	ld	9 (ix), a
	ld	a, 10 (ix)
	sbc	a, 18 (ix)
	ld	10 (ix), a
	ld	a, 11 (ix)
	sbc	a, 19 (ix)
	ld	11 (ix), a
	ld	a, 12 (ix)
	sbc	a, 20 (ix)
	ld	12 (ix), a
	ld	a, 13 (ix)
	sbc	a, 21 (ix)
	ld	13 (ix), a
00107$:
	C$_modulonglong.c$22$2_0$5	= .
	.globl	C$_modulonglong.c$22$2_0$5
;_modulonglong.c:22: b >>= 1;
	srl	21 (ix)
	rr	20 (ix)
	rr	19 (ix)
	rr	18 (ix)
	rr	17 (ix)
	rr	16 (ix)
	rr	15 (ix)
	rr	14 (ix)
	C$_modulonglong.c$24$1_0$2	= .
	.globl	C$_modulonglong.c$24$1_0$2
;_modulonglong.c:24: while (count--);
	ld	a, c
	dec	c
	or	a, a
	jp	NZ, 00108$
	C$_modulonglong.c$26$1_0$2	= .
	.globl	C$_modulonglong.c$26$1_0$2
;_modulonglong.c:26: return a;
	ld	hl,#4
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #6
	add	hl, sp
	ld	bc, #8
	ldir
	C$_modulonglong.c$27$1_0$2	= .
	.globl	C$_modulonglong.c$27$1_0$2
;_modulonglong.c:27: }
	pop	ix
	C$_modulonglong.c$27$1_0$2	= .
	.globl	C$_modulonglong.c$27$1_0$2
	XG$_modulonglong$0$0	= .
	.globl	XG$_modulonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
