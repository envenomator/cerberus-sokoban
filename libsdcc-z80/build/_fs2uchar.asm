;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fs2uchar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2uchar
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
	G$__fs2uchar$0$0	= .
	.globl	G$__fs2uchar$0$0
	C$_fs2uchar.c$34$0_0$21	= .
	.globl	C$_fs2uchar.c$34$0_0$21
;_fs2uchar.c:34: unsigned char __fs2uchar (float f)
;	---------------------------------
; Function __fs2uchar
; ---------------------------------
___fs2uchar::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_fs2uchar.c$36$1_0$21	= .
	.globl	C$_fs2uchar.c$36$1_0$21
;_fs2uchar.c:36: unsigned long ul=__fs2ulong(f);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	C$_fs2uchar.c$37$1_0$21	= .
	.globl	C$_fs2uchar.c$37$1_0$21
;_fs2uchar.c:37: if (ul>=UCHAR_MAX) return UCHAR_MAX;
	ld	a, l
	sub	a, #0xff
	ld	a, h
	sbc	a, #0x00
	ld	a, e
	sbc	a, #0x00
	ld	a, d
	sbc	a, #0x00
	jr	C,00102$
	ld	l, #0xff
	C$_fs2uchar.c$38$1_0$21	= .
	.globl	C$_fs2uchar.c$38$1_0$21
;_fs2uchar.c:38: return ul;
00102$:
	C$_fs2uchar.c$39$1_0$21	= .
	.globl	C$_fs2uchar.c$39$1_0$21
;_fs2uchar.c:39: }
	pop	ix
	C$_fs2uchar.c$39$1_0$21	= .
	.globl	C$_fs2uchar.c$39$1_0$21
	XG$__fs2uchar$0$0	= .
	.globl	XG$__fs2uchar$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
