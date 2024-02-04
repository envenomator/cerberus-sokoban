;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _con_exit
	.globl _con_getc
	.globl _con_cls
	.globl _con_init
	.globl _game_splash_screen
	.globl _game_handleUndoMove
	.globl _game_displayHelp
	.globl _game_getResponse
	.globl _game_selectLevel
	.globl _game_handleKey
	.globl _game_displayLevel
	.globl _game_resetSprites
	.globl _game_initLevel
	.globl _game_sendTileData
	.globl _puts
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$8$0_0$49	= .
	.globl	C$main.c$8$0_0$49
;main.c:8: int main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$main.c$10$2_0$49	= .
	.globl	C$main.c$10$2_0$49
;main.c:10: int16_t levelnumber = 0;
	ld	bc, #0x0000
	C$main.c$15$1_0$49	= .
	.globl	C$main.c$15$1_0$49
;main.c:15: con_init();
	push	bc
	call	_con_init
	call	_game_splash_screen
	call	_game_sendTileData
	pop	bc
	C$main.c$21$5_0$53	= .
	.globl	C$main.c$21$5_0$53
;main.c:21: while(levelnumber >= 0) {
00119$:
	bit	7, b
	jp	NZ, 00121$
	C$main.c$22$2_0$50	= .
	.globl	C$main.c$22$2_0$50
;main.c:22: levelnumber = game_selectLevel(levels, levelnumber); // returns -1 if abort, or valid number between 0-(levels-1)
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_game_selectLevel
	pop	af
	inc	sp
	ld	c, l
	ld	b, h
	C$main.c$23$2_0$50	= .
	.globl	C$main.c$23$2_0$50
;main.c:23: if(levelnumber >= 0) {
	bit	7, b
	jr	NZ,00119$
	C$main.c$25$3_0$51	= .
	.globl	C$main.c$25$3_0$51
;main.c:25: ingame = true;
	ld	-1 (ix), #0x01
	C$main.c$26$3_0$51	= .
	.globl	C$main.c$26$3_0$51
;main.c:26: con_cls();
	push	bc
	call	_con_cls
	pop	bc
	C$main.c$27$3_0$51	= .
	.globl	C$main.c$27$3_0$51
;main.c:27: game_initLevel(levelnumber);	// initialize playing field data from memory or disk
	ld	d, c
	push	bc
	push	de
	inc	sp
	call	_game_initLevel
	inc	sp
	call	_game_displayLevel
	pop	bc
	C$main.c$29$3_0$51	= .
	.globl	C$main.c$29$3_0$51
;main.c:29: while(ingame) {
00114$:
	bit	0, -1 (ix)
	jr	Z,00119$
	C$main.c$30$4_0$52	= .
	.globl	C$main.c$30$4_0$52
;main.c:30: key = con_getc();
	push	bc
	call	_con_getc
	ld	a, l
	pop	bc
	C$main.c$31$4_0$52	= .
	.globl	C$main.c$31$4_0$52
;main.c:31: switch(key) {
	cp	a, #0x1b
	jr	Z,00103$
	cp	a, #0x51
	jr	Z,00103$
	cp	a, #0x68
	jr	Z,00106$
	cp	a, #0x71
	jr	Z,00103$
	cp	a, #0x75
	jr	Z,00107$
	jr	00108$
	C$main.c$34$5_0$53	= .
	.globl	C$main.c$34$5_0$53
;main.c:34: case 27:
00103$:
	C$main.c$35$5_0$53	= .
	.globl	C$main.c$35$5_0$53
;main.c:35: game_resetSprites();
	push	bc
	call	_game_resetSprites
	ld	de, #0x6e79
	push	de
	ld	hl, #___str_0
	push	hl
	call	_game_getResponse
	pop	af
	pop	af
	ld	a, l
	pop	bc
	sub	a, #0x79
	jr	NZ, 00194$
	ld	a, #0x01
	.db	#0x20
00194$:
	xor	a, a
00195$:
	xor	a, #0x01
	ld	-1 (ix), a
	C$main.c$37$5_0$53	= .
	.globl	C$main.c$37$5_0$53
;main.c:37: if(ingame) {
	bit	0, -1 (ix)
	jr	Z,00114$
	C$main.c$38$6_0$54	= .
	.globl	C$main.c$38$6_0$54
;main.c:38: game_displayLevel();
	push	bc
	call	_game_displayLevel
	pop	bc
	C$main.c$40$5_0$53	= .
	.globl	C$main.c$40$5_0$53
;main.c:40: break;
	jr	00114$
	C$main.c$41$5_0$53	= .
	.globl	C$main.c$41$5_0$53
;main.c:41: case 'h':
00106$:
	C$main.c$42$5_0$53	= .
	.globl	C$main.c$42$5_0$53
;main.c:42: game_resetSprites();
	push	bc
	call	_game_resetSprites
	call	_con_cls
	ld	de, #0x0d1e
	push	de
	call	_game_displayHelp
	pop	af
	call	_con_getc
	call	_con_cls
	call	_game_displayLevel
	pop	bc
	C$main.c$48$5_0$53	= .
	.globl	C$main.c$48$5_0$53
;main.c:48: break;
	jr	00114$
	C$main.c$49$5_0$53	= .
	.globl	C$main.c$49$5_0$53
;main.c:49: case 'u':
00107$:
	C$main.c$50$5_0$53	= .
	.globl	C$main.c$50$5_0$53
;main.c:50: game_handleUndoMove();
	push	bc
	call	_game_handleUndoMove
	pop	bc
	C$main.c$51$5_0$53	= .
	.globl	C$main.c$51$5_0$53
;main.c:51: break;
	jr	00114$
	C$main.c$52$5_0$53	= .
	.globl	C$main.c$52$5_0$53
;main.c:52: default:
00108$:
	C$main.c$53$5_0$53	= .
	.globl	C$main.c$53$5_0$53
;main.c:53: ingame = !game_handleKey(key);	// handleKey returns TRUE when game is finished
	push	bc
	push	af
	inc	sp
	call	_game_handleKey
	inc	sp
	ld	a, l
	pop	bc
	xor	a, #0x01
	ld	-1 (ix), a
	C$main.c$54$5_0$53	= .
	.globl	C$main.c$54$5_0$53
;main.c:54: if(!ingame) {
	bit	0, -1 (ix)
	jp	NZ, 00114$
	C$main.c$55$6_0$55	= .
	.globl	C$main.c$55$6_0$55
;main.c:55: levelnumber++;
	inc	bc
	C$main.c$56$6_0$55	= .
	.globl	C$main.c$56$6_0$55
;main.c:56: if(levelnumber == levels) levelnumber = 0;
	ld	a, c
	or	a, a
	or	a, b
	jr	NZ,00110$
	ld	bc, #0x0000
00110$:
	C$main.c$58$6_0$55	= .
	.globl	C$main.c$58$6_0$55
;main.c:58: game_resetSprites();
	push	bc
	call	_game_resetSprites
	ld	de, #0x1b0d
	push	de
	ld	hl, #___str_1
	push	hl
	call	_game_getResponse
	pop	af
	pop	af
	pop	bc
	C$main.c$62$3_0$51	= .
	.globl	C$main.c$62$3_0$51
;main.c:62: }						
	jp	00114$
00121$:
	C$main.c$66$1_0$49	= .
	.globl	C$main.c$66$1_0$49
;main.c:66: puts("Thank you for playing Sokoban\r\n");
	ld	hl, #___str_2
	push	hl
	call	_puts
	pop	af
	C$main.c$67$1_0$49	= .
	.globl	C$main.c$67$1_0$49
;main.c:67: con_exit();
	call	_con_exit
	C$main.c$68$1_0$49	= .
	.globl	C$main.c$68$1_0$49
;main.c:68: return 0;
	ld	hl, #0x0000
	C$main.c$69$1_0$49	= .
	.globl	C$main.c$69$1_0$49
;main.c:69: }
	inc	sp
	pop	ix
	C$main.c$69$1_0$49	= .
	.globl	C$main.c$69$1_0$49
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
Fmain$levels$0_0$0 == .
_levels:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x2a	; 42
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x2e	; 46
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x2a	; 42
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x2a	; 42
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x2e	; 46
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "Really QUIT level (y/n)?"
	.db 0x00
Fmain$__str_1$0_0$0 == .
___str_1:
	.ascii "Level complete!"
	.db 0x00
Fmain$__str_2$0_0$0 == .
___str_2:
	.ascii "Thank you for playing Sokoban"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
