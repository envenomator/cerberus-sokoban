;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _rrulonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rrulonglong
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
	G$_rrulonglong$0$0	= .
	.globl	G$_rrulonglong$0$0
	C$_rrulonglong.c$3$0_0$2	= .
	.globl	C$_rrulonglong.c$3$0_0$2
;_rrulonglong.c:3: unsigned long long _rrulonglong(unsigned long long l, char s)
;	---------------------------------
; Function _rrulonglong
; ---------------------------------
__rrulonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$_rrulonglong.c$5$1_0$2	= .
	.globl	C$_rrulonglong.c$5$1_0$2
;_rrulonglong.c:5: uint32_t *const top = (uint32_t *)((char *)(&l) + 4);
	ld	hl, #0x0012
	add	hl, sp
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	C$_rrulonglong.c$6$1_0$2	= .
	.globl	C$_rrulonglong.c$6$1_0$2
;_rrulonglong.c:6: uint16_t *const middle = (uint16_t *)((char *)(&l) + 4);
	ld	e, l
	ld	d, h
	inc	de
	inc	de
	inc	de
	inc	de
	ld	-2 (ix), e
	ld	-1 (ix), d
	C$_rrulonglong.c$7$1_0$2	= .
	.globl	C$_rrulonglong.c$7$1_0$2
;_rrulonglong.c:7: uint32_t *const bottom = (uint32_t *)(&l);
	ld	e, l
	ld	d, h
	ld	-4 (ix), e
	ld	-3 (ix), d
	C$_rrulonglong.c$8$1_0$2	= .
	.globl	C$_rrulonglong.c$8$1_0$2
;_rrulonglong.c:8: uint16_t *const b = (uint16_t *)(&l);
	ld	-6 (ix), l
	ld	-5 (ix), h
	C$_rrulonglong.c$18$2_0$3	= .
	.globl	C$_rrulonglong.c$18$2_0$3
;_rrulonglong.c:18: (*bottom) >>= s;
00103$:
	C$_rrulonglong.c$10$2_0$3	= .
	.globl	C$_rrulonglong.c$10$2_0$3
;_rrulonglong.c:10: for(;s >= 16; s -= 16)
	ld	a, 14 (ix)
	sub	a, #0x10
	jr	C,00101$
	C$_rrulonglong.c$12$3_0$4	= .
	.globl	C$_rrulonglong.c$12$3_0$4
;_rrulonglong.c:12: b[0] = b[1];
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-12 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_rrulonglong.c$13$3_0$4	= .
	.globl	C$_rrulonglong.c$13$3_0$4
;_rrulonglong.c:13: b[1] = b[2];
	ld	iy, #0x0004
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	add	iy, de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_rrulonglong.c$14$3_0$4	= .
	.globl	C$_rrulonglong.c$14$3_0$4
;_rrulonglong.c:14: b[2] = b[3];
	ld	a, -6 (ix)
	add	a, #0x06
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	ld	0 (iy), e
	ld	1 (iy), d
	C$_rrulonglong.c$15$3_0$4	= .
	.globl	C$_rrulonglong.c$15$3_0$4
;_rrulonglong.c:15: b[3] = 0x000000;
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$_rrulonglong.c$10$2_0$3	= .
	.globl	C$_rrulonglong.c$10$2_0$3
;_rrulonglong.c:10: for(;s >= 16; s -= 16)
	ld	a, 14 (ix)
	add	a, #0xf0
	ld	14 (ix), a
	jr	00103$
00101$:
	C$_rrulonglong.c$18$1_0$2	= .
	.globl	C$_rrulonglong.c$18$1_0$2
;_rrulonglong.c:18: (*bottom) >>= s;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	a, 14 (ix)
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	-8 (ix), l
	ld	-7 (ix), h
	inc	a
	jr	00118$
00117$:
	srl	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
00118$:
	dec	a
	jr	NZ, 00117$
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	C$_rrulonglong.c$19$1_0$2	= .
	.globl	C$_rrulonglong.c$19$1_0$2
;_rrulonglong.c:19: (*middle) |= (uint16_t)(((uint32_t)(*middle) << 16) >> s);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	hl, #0x0000
	ld	a, 14 (ix)
	inc	a
	jr	00122$
00121$:
	srl	d
	rr	e
	rr	h
	rr	l
00122$:
	dec	a
	jr	NZ, 00121$
	ld	a, -10 (ix)
	or	a, l
	ld	e, a
	ld	a, -9 (ix)
	or	a, h
	ld	d, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$_rrulonglong.c$20$1_0$2	= .
	.globl	C$_rrulonglong.c$20$1_0$2
;_rrulonglong.c:20: (*top) |= (((*middle) & 0xffff0000ul) >> s);
	push	de
	push	bc
	ld	e, c
	ld	d, b
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	ld	a, 14 (ix)
	inc	a
	jr	00124$
00123$:
	srl	h
	rr	l
	rr	d
	rr	e
00124$:
	dec	a
	jr	NZ, 00123$
	ld	a, -10 (ix)
	or	a, e
	ld	-10 (ix), a
	ld	a, -9 (ix)
	or	a, d
	ld	-9 (ix), a
	ld	a, -8 (ix)
	or	a, l
	ld	-8 (ix), a
	ld	a, -7 (ix)
	or	a, h
	ld	-7 (ix), a
	ld	e, c
	ld	d, b
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_rrulonglong.c$22$1_0$2	= .
	.globl	C$_rrulonglong.c$22$1_0$2
;_rrulonglong.c:22: return(l);
	ld	hl,#16
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #18
	add	hl, sp
	ld	bc, #8
	ldir
	C$_rrulonglong.c$23$1_0$2	= .
	.globl	C$_rrulonglong.c$23$1_0$2
;_rrulonglong.c:23: }
	ld	sp, ix
	pop	ix
	C$_rrulonglong.c$23$1_0$2	= .
	.globl	C$_rrulonglong.c$23$1_0$2
	XG$_rrulonglong$0$0	= .
	.globl	XG$_rrulonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
