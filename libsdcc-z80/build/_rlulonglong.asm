;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _rlulonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rlulonglong
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
	G$_rlulonglong$0$0	= .
	.globl	G$_rlulonglong$0$0
	C$_rlulonglong.c$3$0_0$2	= .
	.globl	C$_rlulonglong.c$3$0_0$2
;_rlulonglong.c:3: unsigned long long _rlulonglong(unsigned long long l, char s)
;	---------------------------------
; Function _rlulonglong
; ---------------------------------
__rlulonglong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
	C$_rlulonglong.c$5$1_0$2	= .
	.globl	C$_rlulonglong.c$5$1_0$2
;_rlulonglong.c:5: uint32_t *const top = (uint32_t *)((char *)(&l) + 4);
	ld	hl, #0x0016
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	-2 (ix), c
	ld	-1 (ix), b
	C$_rlulonglong.c$6$1_0$2	= .
	.globl	C$_rlulonglong.c$6$1_0$2
;_rlulonglong.c:6: uint16_t *const middle = (uint16_t *)((char *)(&l) + 2);
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	-4 (ix), c
	ld	-3 (ix), b
	C$_rlulonglong.c$7$1_0$2	= .
	.globl	C$_rlulonglong.c$7$1_0$2
;_rlulonglong.c:7: uint32_t *const bottom = (uint32_t *)(&l);
	ld	c, e
	ld	b, d
	ld	-6 (ix), c
	ld	-5 (ix), b
	C$_rlulonglong.c$8$1_0$2	= .
	.globl	C$_rlulonglong.c$8$1_0$2
;_rlulonglong.c:8: uint16_t *const b = (uint16_t *)(&l);
	C$_rlulonglong.c$18$2_0$3	= .
	.globl	C$_rlulonglong.c$18$2_0$3
;_rlulonglong.c:18: (*top) <<= s;
00103$:
	C$_rlulonglong.c$10$2_0$3	= .
	.globl	C$_rlulonglong.c$10$2_0$3
;_rlulonglong.c:10: for(;s >= 16; s-= 16)
	ld	a, 14 (ix)
	sub	a, #0x10
	jr	C,00101$
	C$_rlulonglong.c$12$3_0$4	= .
	.globl	C$_rlulonglong.c$12$3_0$4
;_rlulonglong.c:12: b[3] = b[2];
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	iy, #0x0004
	add	iy, de
	ld	a, 0 (iy)
	ld	-8 (ix), a
	ld	a, 1 (iy)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -7 (ix)
	ld	(bc), a
	C$_rlulonglong.c$13$3_0$4	= .
	.globl	C$_rlulonglong.c$13$3_0$4
;_rlulonglong.c:13: b[2] = b[1];
	ld	hl, #0x0002
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	0 (iy), c
	ld	1 (iy), b
	C$_rlulonglong.c$14$3_0$4	= .
	.globl	C$_rlulonglong.c$14$3_0$4
;_rlulonglong.c:14: b[1] = b[0];
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$_rlulonglong.c$15$3_0$4	= .
	.globl	C$_rlulonglong.c$15$3_0$4
;_rlulonglong.c:15: b[0] = 0;
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$_rlulonglong.c$10$2_0$3	= .
	.globl	C$_rlulonglong.c$10$2_0$3
;_rlulonglong.c:10: for(;s >= 16; s-= 16)
	ld	a, 14 (ix)
	add	a, #0xf0
	ld	14 (ix), a
	jr	00103$
00101$:
	C$_rlulonglong.c$18$1_0$2	= .
	.globl	C$_rlulonglong.c$18$1_0$2
;_rlulonglong.c:18: (*top) <<= s;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, 14 (ix)
	ld	-8 (ix), a
	ld	-16 (ix), c
	ld	-15 (ix), b
	ld	-14 (ix), e
	ld	-13 (ix), d
	inc	a
	jr	00118$
00117$:
	sla	-16 (ix)
	rl	-15 (ix)
	rl	-14 (ix)
	rl	-13 (ix)
00118$:
	dec	a
	jr	NZ,00117$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x0000
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_rlulonglong.c$19$1_0$2	= .
	.globl	C$_rlulonglong.c$19$1_0$2
;_rlulonglong.c:19: (*top) |= (((uint32_t)((*middle) & 0xffffu) << s) >> 16);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	-12 (ix), c
	ld	-11 (ix), b
	ld	-10 (ix), #0x00
	ld	-9 (ix), #0x00
	ld	b, -8 (ix)
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	inc	b
	jr	00120$
00119$:
	add	hl, hl
	rl	e
	rl	d
00120$:
	djnz	00119$
	ld	bc, #0x0000
	ld	a, -16 (ix)
	or	a, e
	ld	-12 (ix), a
	ld	a, -15 (ix)
	or	a, d
	ld	-11 (ix), a
	ld	a, -14 (ix)
	or	a, c
	ld	-10 (ix), a
	ld	a, -13 (ix)
	or	a, b
	ld	-9 (ix), a
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_rlulonglong.c$20$1_0$2	= .
	.globl	C$_rlulonglong.c$20$1_0$2
;_rlulonglong.c:20: (*bottom) <<= s;
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	b, -8 (ix)
	inc	b
	jr	00124$
00123$:
	sla	-12 (ix)
	rl	-11 (ix)
	rl	-10 (ix)
	rl	-9 (ix)
00124$:
	djnz	00123$
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	C$_rlulonglong.c$22$1_0$2	= .
	.globl	C$_rlulonglong.c$22$1_0$2
;_rlulonglong.c:22: return(l);
	ld	hl,#20
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #22
	add	hl, sp
	ld	bc, #8
	ldir
	C$_rlulonglong.c$23$1_0$2	= .
	.globl	C$_rlulonglong.c$23$1_0$2
;_rlulonglong.c:23: }
	ld	sp, ix
	pop	ix
	C$_rlulonglong.c$23$1_0$2	= .
	.globl	C$_rlulonglong.c$23$1_0$2
	XG$_rlulonglong$0$0	= .
	.globl	XG$_rlulonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
