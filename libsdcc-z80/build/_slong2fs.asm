;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _slong2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___slong2fs
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
	G$__slong2fs$0$0	= .
	.globl	G$__slong2fs$0$0
	C$_slong2fs.c$34$0_0$21	= .
	.globl	C$_slong2fs.c$34$0_0$21
;_slong2fs.c:34: float __slong2fs (signed long sl) {
;	---------------------------------
; Function __slong2fs
; ---------------------------------
___slong2fs::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_slong2fs.c$35$1_0$21	= .
	.globl	C$_slong2fs.c$35$1_0$21
;_slong2fs.c:35: if (sl<0) 
	bit	7, 7 (ix)
	jr	Z,00102$
	C$_slong2fs.c$36$1_0$21	= .
	.globl	C$_slong2fs.c$36$1_0$21
;_slong2fs.c:36: return -__ulong2fs(-sl);
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
	push	de
	push	bc
	call	___ulong2fs
	pop	af
	pop	af
	ld	a, d
	xor	a,#0x80
	ld	d, a
	jr	00104$
00102$:
	C$_slong2fs.c$38$1_0$21	= .
	.globl	C$_slong2fs.c$38$1_0$21
;_slong2fs.c:38: return __ulong2fs(sl);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___ulong2fs
	pop	af
	pop	af
00104$:
	C$_slong2fs.c$39$1_0$21	= .
	.globl	C$_slong2fs.c$39$1_0$21
;_slong2fs.c:39: }
	pop	ix
	C$_slong2fs.c$39$1_0$21	= .
	.globl	C$_slong2fs.c$39$1_0$21
	XG$__slong2fs$0$0	= .
	.globl	XG$__slong2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
