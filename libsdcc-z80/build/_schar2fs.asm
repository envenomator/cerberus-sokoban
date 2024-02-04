;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _schar2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
	.globl ___schar2fs
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
	G$__schar2fs$0$0	= .
	.globl	G$__schar2fs$0$0
	C$_schar2fs.c$34$0_0$21	= .
	.globl	C$_schar2fs.c$34$0_0$21
;_schar2fs.c:34: float __schar2fs (signed char sc) {
;	---------------------------------
; Function __schar2fs
; ---------------------------------
___schar2fs::
	C$_schar2fs.c$35$1_0$21	= .
	.globl	C$_schar2fs.c$35$1_0$21
;_schar2fs.c:35: return __slong2fs(sc);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	e, a
	ld	d, a
	push	de
	push	bc
	call	___slong2fs
	pop	af
	pop	af
	C$_schar2fs.c$36$1_0$21	= .
	.globl	C$_schar2fs.c$36$1_0$21
;_schar2fs.c:36: }
	C$_schar2fs.c$36$1_0$21	= .
	.globl	C$_schar2fs.c$36$1_0$21
	XG$__schar2fs$0$0	= .
	.globl	XG$__schar2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
