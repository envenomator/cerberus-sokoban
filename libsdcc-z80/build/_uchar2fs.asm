;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _uchar2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___uchar2fs
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
	G$__uchar2fs$0$0	= .
	.globl	G$__uchar2fs$0$0
	C$_uchar2fs.c$34$0_0$21	= .
	.globl	C$_uchar2fs.c$34$0_0$21
;_uchar2fs.c:34: float __uchar2fs (unsigned char uc) {
;	---------------------------------
; Function __uchar2fs
; ---------------------------------
___uchar2fs::
	C$_uchar2fs.c$35$1_0$21	= .
	.globl	C$_uchar2fs.c$35$1_0$21
;_uchar2fs.c:35: return __ulong2fs(uc);
	ld	hl, #2+0
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0000
	push	de
	push	bc
	call	___ulong2fs
	pop	af
	pop	af
	C$_uchar2fs.c$36$1_0$21	= .
	.globl	C$_uchar2fs.c$36$1_0$21
;_uchar2fs.c:36: }
	C$_uchar2fs.c$36$1_0$21	= .
	.globl	C$_uchar2fs.c$36$1_0$21
	XG$__uchar2fs$0$0	= .
	.globl	XG$__uchar2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
