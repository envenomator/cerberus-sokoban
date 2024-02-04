;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _sint2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
	.globl ___sint2fs
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
	G$__sint2fs$0$0	= .
	.globl	G$__sint2fs$0$0
	C$_sint2fs.c$35$0_0$21	= .
	.globl	C$_sint2fs.c$35$0_0$21
;_sint2fs.c:35: float __sint2fs (signed int si) {
;	---------------------------------
; Function __sint2fs
; ---------------------------------
___sint2fs::
	C$_sint2fs.c$36$1_0$21	= .
	.globl	C$_sint2fs.c$36$1_0$21
;_sint2fs.c:36: return __slong2fs(si);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	a, (hl)
	ld	b, a
	rla
	sbc	a, a
	ld	e, a
	ld	d, a
	push	de
	push	bc
	call	___slong2fs
	pop	af
	pop	af
	C$_sint2fs.c$37$1_0$21	= .
	.globl	C$_sint2fs.c$37$1_0$21
;_sint2fs.c:37: }
	C$_sint2fs.c$37$1_0$21	= .
	.globl	C$_sint2fs.c$37$1_0$21
	XG$__sint2fs$0$0	= .
	.globl	XG$__sint2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
