;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _rrslonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rrslonglong
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
	G$_rrslonglong$0$0	= .
	.globl	G$_rrslonglong$0$0
	C$_rrslonglong.c$3$0_0$2	= .
	.globl	C$_rrslonglong.c$3$0_0$2
;_rrslonglong.c:3: long long _rrslonglong(long long l, char s)
;	---------------------------------
; Function _rrslonglong
; ---------------------------------
__rrslonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
	C$_rrslonglong.c$5$1_0$2	= .
	.globl	C$_rrslonglong.c$5$1_0$2
;_rrslonglong.c:5: int32_t *top = (uint32_t *)((char *)(&l) + 4);
	ld	hl, #0x0014
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	C$_rrslonglong.c$6$1_0$2	= .
	.globl	C$_rrslonglong.c$6$1_0$2
;_rrslonglong.c:6: uint16_t *middle = (uint16_t *)((char *)(&l) + 3);
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$_rrslonglong.c$7$1_0$2	= .
	.globl	C$_rrslonglong.c$7$1_0$2
;_rrslonglong.c:7: uint32_t *bottom = (uint32_t *)(&l);
	ld	l, e
	ld	h, d
	ld	-4 (ix), l
	ld	-3 (ix), h
	C$_rrslonglong.c$8$1_0$2	= .
	.globl	C$_rrslonglong.c$8$1_0$2
;_rrslonglong.c:8: uint16_t *b = (uint16_t *)(&l);
	C$_rrslonglong.c$18$3_0$4	= .
	.globl	C$_rrslonglong.c$18$3_0$4
;_rrslonglong.c:18: (*bottom) >>= s;
	ld	hl, #0x0006
	add	hl, de
	ld	-12 (ix), l
	ld	-11 (ix), h
00103$:
	C$_rrslonglong.c$10$2_0$3	= .
	.globl	C$_rrslonglong.c$10$2_0$3
;_rrslonglong.c:10: for(;s >= 16; s-= 16)
	ld	a, 14 (ix)
	sub	a, #0x10
	jp	C, 00101$
	C$_rrslonglong.c$12$3_0$4	= .
	.globl	C$_rrslonglong.c$12$3_0$4
;_rrslonglong.c:12: b[0] = b[1];
	ld	hl, #0x0002
	add	hl, de
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-13 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -14 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -13 (ix)
	ld	(hl), a
	C$_rrslonglong.c$13$3_0$4	= .
	.globl	C$_rrslonglong.c$13$3_0$4
;_rrslonglong.c:13: b[1] = b[2];
	ld	iy, #0x0004
	add	iy, de
	ld	a, 0 (iy)
	ld	-14 (ix), a
	ld	a, 1 (iy)
	ld	-13 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -14 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -13 (ix)
	ld	(hl), a
	C$_rrslonglong.c$14$3_0$4	= .
	.globl	C$_rrslonglong.c$14$3_0$4
;_rrslonglong.c:14: b[2] = b[3];
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	0 (iy), l
	ld	1 (iy), h
	C$_rrslonglong.c$15$3_0$4	= .
	.globl	C$_rrslonglong.c$15$3_0$4
;_rrslonglong.c:15: b[3] = (b[3] & 0x8000) ? 0xffff : 0x000000;
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	jr	NC,00107$
	ld	hl, #0xffff
	ex	(sp), hl
	jr	00108$
00107$:
	ld	hl, #0x0000
	ex	(sp), hl
00108$:
	ld	a, -14 (ix)
	ld	0 (iy), a
	ld	a, -13 (ix)
	ld	1 (iy), a
	C$_rrslonglong.c$10$2_0$3	= .
	.globl	C$_rrslonglong.c$10$2_0$3
;_rrslonglong.c:10: for(;s >= 16; s-= 16)
	ld	a, 14 (ix)
	add	a, #0xf0
	ld	14 (ix), a
	jp	00103$
00101$:
	C$_rrslonglong.c$18$1_0$2	= .
	.globl	C$_rrslonglong.c$18$1_0$2
;_rrslonglong.c:18: (*bottom) >>= s;
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
	jr	00126$
00125$:
	srl	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
00126$:
	dec	a
	jr	NZ, 00125$
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #0x0006
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	C$_rrslonglong.c$19$1_0$2	= .
	.globl	C$_rrslonglong.c$19$1_0$2
;_rrslonglong.c:19: (*bottom) |= ((uint32_t)((*middle) >> s) << 16);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, 14 (ix)
	inc	a
	jr	00128$
00127$:
	srl	d
	rr	e
00128$:
	dec	a
	jr	NZ, 00127$
	ld	hl, #0x0000
	ld	a, -10 (ix)
	or	a, l
	ld	-10 (ix), a
	ld	a, -9 (ix)
	or	a, h
	ld	-9 (ix), a
	ld	a, -8 (ix)
	or	a, e
	ld	-8 (ix), a
	ld	a, -7 (ix)
	or	a, d
	ld	-7 (ix), a
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #0x0006
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	C$_rrslonglong.c$20$1_0$2	= .
	.globl	C$_rrslonglong.c$20$1_0$2
;_rrslonglong.c:20: (*top) |= (((*middle) & 0xffff0000) >> s);
	push	bc
	ld	e, c
	ld	d, b
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	ld	a, 14 (ix)
	inc	a
	jr	00132$
00131$:
	srl	h
	rr	l
	rr	d
	rr	e
00132$:
	dec	a
	jr	NZ, 00131$
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
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_rrslonglong.c$22$1_0$2	= .
	.globl	C$_rrslonglong.c$22$1_0$2
;_rrslonglong.c:22: return(l);
	ld	hl,#18
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #20
	add	hl, sp
	ld	bc, #8
	ldir
	C$_rrslonglong.c$23$1_0$2	= .
	.globl	C$_rrslonglong.c$23$1_0$2
;_rrslonglong.c:23: }
	ld	sp, ix
	pop	ix
	C$_rrslonglong.c$23$1_0$2	= .
	.globl	C$_rrslonglong.c$23$1_0$2
	XG$_rrslonglong$0$0	= .
	.globl	XG$_rrslonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
