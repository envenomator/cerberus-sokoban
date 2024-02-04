;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fssub
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fssub
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
	G$__fssub$0$0	= .
	.globl	G$__fssub$0$0
	C$_fssub.c$48$0_0$2	= .
	.globl	C$_fssub.c$48$0_0$2
;_fssub.c:48: float __fssub (float a1, float a2)
;	---------------------------------
; Function __fssub
; ---------------------------------
___fssub::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_fssub.c$50$1_0$2	= .
	.globl	C$_fssub.c$50$1_0$2
;_fssub.c:50: float neg = -a1;
	ld	a, 7 (ix)
	xor	a,#0x80
	ld	d, a
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, 6 (ix)
	C$_fssub.c$51$1_0$2	= .
	.globl	C$_fssub.c$51$1_0$2
;_fssub.c:51: return -(neg + a2);
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
	push	de
	push	bc
	call	___fsadd
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, d
	xor	a,#0x80
	ld	d, a
	C$_fssub.c$52$1_0$2	= .
	.globl	C$_fssub.c$52$1_0$2
;_fssub.c:52: }
	pop	ix
	C$_fssub.c$52$1_0$2	= .
	.globl	C$_fssub.c$52$1_0$2
	XG$__fssub$0$0	= .
	.globl	XG$__fssub$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
