;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _rlslonglong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rlslonglong
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
	G$_rlslonglong$0$0	= .
	.globl	G$_rlslonglong$0$0
	C$_rlslonglong.c$1$0_0$2	= .
	.globl	C$_rlslonglong.c$1$0_0$2
;_rlslonglong.c:1: long long _rlslonglong(long long l, char s)
;	---------------------------------
; Function _rlslonglong
; ---------------------------------
__rlslonglong::
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$_rlslonglong.c$3$1_0$2	= .
	.globl	C$_rlslonglong.c$3$1_0$2
;_rlslonglong.c:3: return((unsigned long long)(l) << s);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #12
	add	hl, sp
	ld	bc, #8
	ldir
	ld	hl, #20+0
	add	hl, sp
	ld	b, (hl)
	inc	b
	jr	00104$
00103$:
	ld	iy, #0
	add	iy, sp
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	rl	4 (iy)
	rl	5 (iy)
	rl	6 (iy)
	rl	7 (iy)
00104$:
	djnz	00103$
	ld	hl,#10
	add	hl,sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0
	add	hl, sp
	ld	bc, #8
	ldir
	C$_rlslonglong.c$4$1_0$2	= .
	.globl	C$_rlslonglong.c$4$1_0$2
;_rlslonglong.c:4: }
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$_rlslonglong.c$4$1_0$2	= .
	.globl	C$_rlslonglong.c$4$1_0$2
	XG$_rlslonglong$0$0	= .
	.globl	XG$_rlslonglong$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
