;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _modulong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __modulong
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
	G$_modulong$0$0	= .
	.globl	G$_modulong$0$0
	C$_modulong.c$3$0_0$2	= .
	.globl	C$_modulong.c$3$0_0$2
;_modulong.c:3: unsigned long _modulong (unsigned long a, unsigned long b)
;	---------------------------------
; Function _modulong
; ---------------------------------
__modulong::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_modulong.c$5$2_0$2	= .
	.globl	C$_modulong.c$5$2_0$2
;_modulong.c:5: unsigned char count = 0;
	C$_modulong.c$7$1_0$2	= .
	.globl	C$_modulong.c$7$1_0$2
;_modulong.c:7: while (!MSB_SET(b))
	ld	bc, #0x0000
00103$:
	ld	a, 11 (ix)
	rlc	a
	and	a,#0x01
	jr	NZ,00117$
	C$_modulong.c$9$2_0$3	= .
	.globl	C$_modulong.c$9$2_0$3
;_modulong.c:9: b <<= 1;
	sla	8 (ix)
	rl	9 (ix)
	rl	10 (ix)
	rl	11 (ix)
	C$_modulong.c$10$2_0$3	= .
	.globl	C$_modulong.c$10$2_0$3
;_modulong.c:10: if (b > a)
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	ld	a, 5 (ix)
	sbc	a, 9 (ix)
	ld	a, 6 (ix)
	sbc	a, 10 (ix)
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	jr	NC,00102$
	C$_modulong.c$12$3_0$4	= .
	.globl	C$_modulong.c$12$3_0$4
;_modulong.c:12: b >>=1;
	srl	11 (ix)
	rr	10 (ix)
	rr	9 (ix)
	rr	8 (ix)
	C$_modulong.c$13$3_0$4	= .
	.globl	C$_modulong.c$13$3_0$4
;_modulong.c:13: break;
	jr	00117$
00102$:
	C$_modulong.c$15$2_0$3	= .
	.globl	C$_modulong.c$15$2_0$3
;_modulong.c:15: count++;
	inc	b
	ld	c, b
	jr	00103$
	C$_modulong.c$17$1_0$2	= .
	.globl	C$_modulong.c$17$1_0$2
;_modulong.c:17: do
00117$:
00108$:
	C$_modulong.c$19$2_0$5	= .
	.globl	C$_modulong.c$19$2_0$5
;_modulong.c:19: if (a >= b)
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	ld	a, 5 (ix)
	sbc	a, 9 (ix)
	ld	a, 6 (ix)
	sbc	a, 10 (ix)
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	jr	C,00107$
	C$_modulong.c$20$2_0$5	= .
	.globl	C$_modulong.c$20$2_0$5
;_modulong.c:20: a -= b;
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	ld	4 (ix), a
	ld	a, 5 (ix)
	sbc	a, 9 (ix)
	ld	5 (ix), a
	ld	a, 6 (ix)
	sbc	a, 10 (ix)
	ld	6 (ix), a
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	ld	7 (ix), a
00107$:
	C$_modulong.c$21$2_0$5	= .
	.globl	C$_modulong.c$21$2_0$5
;_modulong.c:21: b >>= 1;
	srl	11 (ix)
	rr	10 (ix)
	rr	9 (ix)
	rr	8 (ix)
	C$_modulong.c$23$1_0$2	= .
	.globl	C$_modulong.c$23$1_0$2
;_modulong.c:23: while (count--);
	ld	a, c
	dec	c
	or	a, a
	jr	NZ,00108$
	C$_modulong.c$25$1_0$2	= .
	.globl	C$_modulong.c$25$1_0$2
;_modulong.c:25: return a;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	C$_modulong.c$26$1_0$2	= .
	.globl	C$_modulong.c$26$1_0$2
;_modulong.c:26: }
	pop	ix
	C$_modulong.c$26$1_0$2	= .
	.globl	C$_modulong.c$26$1_0$2
	XG$_modulong$0$0	= .
	.globl	XG$_modulong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
