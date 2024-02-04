;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _fs2uint
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2uint
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
	G$__fs2uint$0$0	= .
	.globl	G$__fs2uint$0$0
	C$_fs2uint.c$35$0_0$22	= .
	.globl	C$_fs2uint.c$35$0_0$22
;_fs2uint.c:35: unsigned int __fs2uint (float f)
;	---------------------------------
; Function __fs2uint
; ---------------------------------
___fs2uint::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$_fs2uint.c$37$1_0$22	= .
	.globl	C$_fs2uint.c$37$1_0$22
;_fs2uint.c:37: unsigned long ul=__fs2ulong(f);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	C$_fs2uint.c$38$1_0$22	= .
	.globl	C$_fs2uint.c$38$1_0$22
;_fs2uint.c:38: if (ul>=UINT_MAX) return UINT_MAX;
	ld	a, l
	sub	a, #0xff
	ld	a, h
	sbc	a, #0xff
	ld	a, e
	sbc	a, #0x00
	ld	a, d
	sbc	a, #0x00
	jr	C,00102$
	ld	hl, #0xffff
	C$_fs2uint.c$39$1_0$22	= .
	.globl	C$_fs2uint.c$39$1_0$22
;_fs2uint.c:39: return ul;
00102$:
	C$_fs2uint.c$40$1_0$22	= .
	.globl	C$_fs2uint.c$40$1_0$22
;_fs2uint.c:40: }
	pop	ix
	C$_fs2uint.c$40$1_0$22	= .
	.globl	C$_fs2uint.c$40$1_0$22
	XG$__fs2uint$0$0	= .
	.globl	XG$__fs2uint$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
