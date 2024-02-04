;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _mullonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullonglong
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
	G$_mullonglong$0$0	= .
	.globl	G$_mullonglong$0$0
	C$_mullonglong.c$1$0_0$2	= .
	.globl	C$_mullonglong.c$1$0_0$2
;_mullonglong.c:1: long long _mullonglong(long long ll, long long lr)
;	---------------------------------
; Function _mullonglong
; ---------------------------------
__mullonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-17
	add	hl, sp
	ld	sp, hl
	C$_mullonglong.c$3$2_0$2	= .
	.globl	C$_mullonglong.c$3$2_0$2
;_mullonglong.c:3: unsigned long long ret = 0ull;
	xor	a, a
	ld	-17 (ix), a
	ld	-16 (ix), a
	ld	-15 (ix), a
	ld	-14 (ix), a
	ld	-13 (ix), a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	-10 (ix), a
	C$_mullonglong.c$6$1_0$2	= .
	.globl	C$_mullonglong.c$6$1_0$2
;_mullonglong.c:6: for (i = 0; i < sizeof (long long); i++)
	ld	c, #0x00
00106$:
	C$_mullonglong.c$8$3_0$4	= .
	.globl	C$_mullonglong.c$8$3_0$4
;_mullonglong.c:8: unsigned char l = ll >> (i * 8);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, 6 (ix)
	ld	-9 (ix), a
	ld	a, 7 (ix)
	ld	-8 (ix), a
	ld	a, 8 (ix)
	ld	-7 (ix), a
	ld	a, 9 (ix)
	ld	-6 (ix), a
	ld	a, 10 (ix)
	ld	-5 (ix), a
	ld	a, 11 (ix)
	ld	-4 (ix), a
	ld	a, 12 (ix)
	ld	-3 (ix), a
	ld	a, 13 (ix)
	ld	-2 (ix), a
	inc	b
	jr	00133$
00132$:
	sra	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	rr	-5 (ix)
	rr	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
00133$:
	djnz	00132$
	ld	a, -9 (ix)
	ld	-1 (ix), a
	C$_mullonglong.c$9$1_0$2	= .
	.globl	C$_mullonglong.c$9$1_0$2
;_mullonglong.c:9: for(j = 0; (i + j) < sizeof (long long); j++)
	ld	e, #0x00
00104$:
	ld	l, c
	ld	h, #0x00
	ld	a, e
	ld	d, #0x00
	add	a, l
	ld	l, a
	ld	a, d
	adc	a, h
	ld	h, a
	ld	a, l
	sub	a, #0x08
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00107$
	C$_mullonglong.c$11$5_0$6	= .
	.globl	C$_mullonglong.c$11$5_0$6
;_mullonglong.c:11: unsigned char r = lr >> (j * 8);
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, 14 (ix)
	ld	-9 (ix), a
	ld	a, 15 (ix)
	ld	-8 (ix), a
	ld	a, 16 (ix)
	ld	-7 (ix), a
	ld	a, 17 (ix)
	ld	-6 (ix), a
	ld	a, 18 (ix)
	ld	-5 (ix), a
	ld	a, 19 (ix)
	ld	-4 (ix), a
	ld	a, 20 (ix)
	ld	-3 (ix), a
	ld	a, 21 (ix)
	ld	-2 (ix), a
	inc	b
	jr	00135$
00134$:
	sra	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	rr	-5 (ix)
	rr	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
00135$:
	djnz	00134$
	ld	h, -9 (ix)
	C$_mullonglong.c$12$5_0$6	= .
	.globl	C$_mullonglong.c$12$5_0$6
;_mullonglong.c:12: ret += (unsigned long long)((unsigned short)(l * r)) << ((i + j) * 8);
	push	de
	ld	e, -1 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00136$:
	add	hl, hl
	jr	NC,00137$
	add	hl, de
00137$:
	djnz	00136$
	pop	de
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	a, c
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	inc	b
	jr	00139$
00138$:
	sla	-9 (ix)
	rl	-8 (ix)
	rl	-7 (ix)
	rl	-6 (ix)
	rl	-5 (ix)
	rl	-4 (ix)
	rl	-3 (ix)
	rl	-2 (ix)
00139$:
	djnz	00138$
	ld	a, -17 (ix)
	add	a, -9 (ix)
	ld	-17 (ix), a
	ld	a, -16 (ix)
	adc	a, -8 (ix)
	ld	-16 (ix), a
	ld	a, -15 (ix)
	adc	a, -7 (ix)
	ld	-15 (ix), a
	ld	a, -14 (ix)
	adc	a, -6 (ix)
	ld	-14 (ix), a
	ld	a, -13 (ix)
	adc	a, -5 (ix)
	ld	-13 (ix), a
	ld	a, -12 (ix)
	adc	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -11 (ix)
	adc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, -10 (ix)
	adc	a, -2 (ix)
	ld	-10 (ix), a
	C$_mullonglong.c$9$4_0$5	= .
	.globl	C$_mullonglong.c$9$4_0$5
;_mullonglong.c:9: for(j = 0; (i + j) < sizeof (long long); j++)
	inc	e
	jp	00104$
00107$:
	C$_mullonglong.c$6$2_0$3	= .
	.globl	C$_mullonglong.c$6$2_0$3
;_mullonglong.c:6: for (i = 0; i < sizeof (long long); i++)
	inc	c
	ld	a, c
	sub	a, #0x08
	jp	C, 00106$
	C$_mullonglong.c$16$1_0$2	= .
	.globl	C$_mullonglong.c$16$1_0$2
;_mullonglong.c:16: return(ret);
	ld	hl,#21
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0
	add	hl, sp
	ld	bc, #8
	ldir
	C$_mullonglong.c$17$1_0$2	= .
	.globl	C$_mullonglong.c$17$1_0$2
;_mullonglong.c:17: }
	ld	sp, ix
	pop	ix
	C$_mullonglong.c$17$1_0$2	= .
	.globl	C$_mullonglong.c$17$1_0$2
	XG$_mullonglong$0$0	= .
	.globl	XG$_mullonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
