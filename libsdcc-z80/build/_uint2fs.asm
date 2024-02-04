;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module _uint2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___uint2fs
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
	G$__uint2fs$0$0	= .
	.globl	G$__uint2fs$0$0
	C$_uint2fs.c$33$0_0$21	= .
	.globl	C$_uint2fs.c$33$0_0$21
;_uint2fs.c:33: float __uint2fs (unsigned int ui) {
;	---------------------------------
; Function __uint2fs
; ---------------------------------
___uint2fs::
	C$_uint2fs.c$34$1_0$21	= .
	.globl	C$_uint2fs.c$34$1_0$21
;_uint2fs.c:34: return __ulong2fs(ui);
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #0x0000
	push	de
	push	bc
	call	___ulong2fs
	pop	af
	pop	af
	C$_uint2fs.c$35$1_0$21	= .
	.globl	C$_uint2fs.c$35$1_0$21
;_uint2fs.c:35: }
	C$_uint2fs.c$35$1_0$21	= .
	.globl	C$_uint2fs.c$35$1_0$21
	XG$__uint2fs$0$0	= .
	.globl	XG$__uint2fs$0$0
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
