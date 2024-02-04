;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _undomove_updatelevel
	.globl _move_updatelevel
	.globl _undomove_sprites
	.globl _move_sprites
	.globl _canmove
	.globl _debug_print_playfieldText
	.globl _con_getc
	.globl _strlen
	.globl _puts
	.globl _printf
	.globl _floor_data
	.globl _wall_data
	.globl _box_ongoal_data
	.globl _goal_data
	.globl _box_data
	.globl _player_data
	.globl _spritenumber
	.globl _currentlevel
	.globl _sprites
	.globl _bitmapbuffer
	.globl _num_undomoves
	.globl _undo_head
	.globl _undomove
	.globl _game_sendTileData
	.globl _game_resetSprites
	.globl _game_handleUndoMove
	.globl _game_handleKey
	.globl _game_getResponse
	.globl _game_splash_screen
	.globl _game_displayHelp
	.globl _game_selectLevel
	.globl _game_displayLevel
	.globl _game_displayMinimap
	.globl _game_initLevel
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$undomove$0_0$0==.
_undomove::
	.ds 256
G$undo_head$0_0$0==.
_undo_head::
	.ds 1
G$num_undomoves$0_0$0==.
_num_undomoves::
	.ds 1
G$bitmapbuffer$0_0$0==.
_bitmapbuffer::
	.ds 1024
G$sprites$0_0$0==.
_sprites::
	.ds 300
G$currentlevel$0_0$0==.
_currentlevel::
	.ds 307
G$spritenumber$0_0$0==.
_spritenumber::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$player_data$0_0$0==.
_player_data::
	.ds 32
G$box_data$0_0$0==.
_box_data::
	.ds 32
G$goal_data$0_0$0==.
_goal_data::
	.ds 32
G$box_ongoal_data$0_0$0==.
_box_ongoal_data::
	.ds 32
G$wall_data$0_0$0==.
_wall_data::
	.ds 32
G$floor_data$0_0$0==.
_floor_data::
	.ds 32
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
	G$debug_print_playfieldText$0$0	= .
	.globl	G$debug_print_playfieldText$0$0
	C$game.c$35$0_0$70	= .
	.globl	C$game.c$35$0_0$70
;game.c:35: void debug_print_playfieldText(void) {
;	---------------------------------
; Function debug_print_playfieldText
; ---------------------------------
_debug_print_playfieldText::
	C$game.c$54$0_0$70	= .
	.globl	C$game.c$54$0_0$70
;game.c:54: }
	C$game.c$54$0_0$70	= .
	.globl	C$game.c$54$0_0$70
	XG$debug_print_playfieldText$0$0	= .
	.globl	XG$debug_print_playfieldText$0$0
	ret
	G$game_sendTileData$0$0	= .
	.globl	G$game_sendTileData$0$0
	C$game.c$56$0_0$72	= .
	.globl	C$game.c$56$0_0$72
;game.c:56: void game_sendTileData(void) {
;	---------------------------------
; Function game_sendTileData
; ---------------------------------
_game_sendTileData::
	push	af
	C$game.c$59$1_0$72	= .
	.globl	C$game.c$59$1_0$72
;game.c:59: memcpy(ptr[TILE_WALL], wall_data,8);
	ld	de, #0xf000
	ld	hl, #_wall_data
	ld	bc, #0x0008
	ldir
	C$game.c$60$1_0$72	= .
	.globl	C$game.c$60$1_0$72
;game.c:60: memcpy(ptr[TILE_PLAYER],player_data,8);
	ld	de, #0xf008
	ld	hl, #_player_data
	ld	bc, #0x0008
	ldir
	C$game.c$61$1_0$72	= .
	.globl	C$game.c$61$1_0$72
;game.c:61: memcpy(ptr[TILE_PLAYERONGOAL], player_data, 8);
	ld	de, #0xf010
	ld	hl, #_player_data
	ld	bc, #0x0008
	ldir
	C$game.c$62$1_0$72	= .
	.globl	C$game.c$62$1_0$72
;game.c:62: memcpy(ptr[TILE_BOX], box_data, 8);
	ld	de, #0xf018
	ld	hl, #_box_data
	ld	bc, #0x0008
	ldir
	C$game.c$63$1_0$72	= .
	.globl	C$game.c$63$1_0$72
;game.c:63: memcpy(ptr[TILE_BOXONGOAL], box_ongoal_data, 8);
	ld	de, #0xf020
	ld	hl, #_box_ongoal_data
	ld	bc, #0x0008
	ldir
	C$game.c$64$1_0$72	= .
	.globl	C$game.c$64$1_0$72
;game.c:64: memcpy(ptr[TILE_GOAL], goal_data, 8);
	ld	de, #0xf028
	ld	hl, #_goal_data
	ld	bc, #0x0008
	ldir
	C$game.c$65$1_0$72	= .
	.globl	C$game.c$65$1_0$72
;game.c:65: memcpy(ptr[TILE_FLOOR], floor_data, 8);	
	ld	de, #0xf030
	ld	hl, #_floor_data
	ld	bc, #0x0008
	ldir
	C$game.c$66$1_0$72	= .
	.globl	C$game.c$66$1_0$72
;game.c:66: return;
	C$game.c$67$1_0$72	= .
	.globl	C$game.c$67$1_0$72
;game.c:67: }
	pop	af
	C$game.c$67$1_0$72	= .
	.globl	C$game.c$67$1_0$72
	XG$game_sendTileData$0$0	= .
	.globl	XG$game_sendTileData$0$0
	ret
	G$game_resetSprites$0$0	= .
	.globl	G$game_resetSprites$0$0
	C$game.c$69$1_0$74	= .
	.globl	C$game.c$69$1_0$74
;game.c:69: void game_resetSprites(void)
;	---------------------------------
; Function game_resetSprites
; ---------------------------------
_game_resetSprites::
	C$game.c$90$1_0$74	= .
	.globl	C$game.c$90$1_0$74
;game.c:90: return;
	C$game.c$91$1_0$74	= .
	.globl	C$game.c$91$1_0$74
;game.c:91: }
	C$game.c$91$1_0$74	= .
	.globl	C$game.c$91$1_0$74
	XG$game_resetSprites$0$0	= .
	.globl	XG$game_resetSprites$0$0
	ret
	G$canmove$0$0	= .
	.globl	G$canmove$0$0
	C$game.c$93$1_0$76	= .
	.globl	C$game.c$93$1_0$76
;game.c:93: bool canmove(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
;	---------------------------------
; Function canmove
; ---------------------------------
_canmove::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$game.c$97$1_0$76	= .
	.globl	C$game.c$97$1_0$76
;game.c:97: n1 = currentlevel.data[yn1][xn1];
	ld	de, #_currentlevel+7
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	add	hl, bc
	ld	c, (hl)
	C$game.c$98$1_0$76	= .
	.globl	C$game.c$98$1_0$76
;game.c:98: n2 = currentlevel.data[yn2][xn2];
	push	de
	ld	e, 10 (ix)
	ld	d, 11 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	add	hl, de
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	add	hl, de
	ld	b, (hl)
	C$game.c$100$1_0$76	= .
	.globl	C$game.c$100$1_0$76
;game.c:100: switch(n1) {
	ld	a,c
	cp	a,#0x20
	jr	Z,00103$
	cp	a,#0x23
	jr	Z,00101$
	sub	a, #0x2e
	jr	Z,00103$
	jr	00104$
	C$game.c$101$2_0$77	= .
	.globl	C$game.c$101$2_0$77
;game.c:101: case CHAR_WALL:
00101$:
	C$game.c$102$2_0$77	= .
	.globl	C$game.c$102$2_0$77
;game.c:102: return false;
	ld	l, #0x00
	jr	00109$
	C$game.c$105$2_0$77	= .
	.globl	C$game.c$105$2_0$77
;game.c:105: case CHAR_GOAL:
00103$:
	C$game.c$106$2_0$77	= .
	.globl	C$game.c$106$2_0$77
;game.c:106: return true;
	ld	l, #0x01
	jr	00109$
	C$game.c$108$1_0$76	= .
	.globl	C$game.c$108$1_0$76
;game.c:108: }
00104$:
	C$game.c$110$1_0$76	= .
	.globl	C$game.c$110$1_0$76
;game.c:110: switch(n2) {
	ld	a,b
	cp	a,#0x23
	jr	Z,00105$
	cp	a,#0x24
	jr	Z,00107$
	sub	a, #0x2a
	jr	Z,00107$
	jr	00108$
	C$game.c$111$2_0$78	= .
	.globl	C$game.c$111$2_0$78
;game.c:111: case CHAR_WALL:
00105$:
	C$game.c$112$2_0$78	= .
	.globl	C$game.c$112$2_0$78
;game.c:112: return false;
	ld	l, #0x00
	jr	00109$
	C$game.c$115$2_0$78	= .
	.globl	C$game.c$115$2_0$78
;game.c:115: case CHAR_BOXONGOAL:
00107$:
	C$game.c$116$2_0$78	= .
	.globl	C$game.c$116$2_0$78
;game.c:116: return false;
	ld	l, #0x00
	jr	00109$
	C$game.c$118$1_0$76	= .
	.globl	C$game.c$118$1_0$76
;game.c:118: }
00108$:
	C$game.c$120$1_0$76	= .
	.globl	C$game.c$120$1_0$76
;game.c:120: return true;
	ld	l, #0x01
00109$:
	C$game.c$121$1_0$76	= .
	.globl	C$game.c$121$1_0$76
;game.c:121: }
	pop	ix
	C$game.c$121$1_0$76	= .
	.globl	C$game.c$121$1_0$76
	XG$canmove$0$0	= .
	.globl	XG$canmove$0$0
	ret
	G$move_sprites$0$0	= .
	.globl	G$move_sprites$0$0
	C$game.c$123$1_0$80	= .
	.globl	C$game.c$123$1_0$80
;game.c:123: void move_sprites(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
;	---------------------------------
; Function move_sprites
; ---------------------------------
_move_sprites::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$game.c$125$1_0$80	= .
	.globl	C$game.c$125$1_0$80
;game.c:125: uint8_t spriteid = sprites[yn1][xn1];
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_sprites
	add	hl, de
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	-1 (ix), a
	C$game.c$140$1_0$80	= .
	.globl	C$game.c$140$1_0$80
;game.c:140: if(spriteid != NOSPRITE) {
	inc	a
	jr	Z,00108$
	C$game.c$157$1_0$80	= .
	.globl	C$game.c$157$1_0$80
;game.c:157: if(spriteid != NOSPRITE) {
	C$game.c$159$2_0$84	= .
	.globl	C$game.c$159$2_0$84
;game.c:159: sprites[yn2][xn2] = sprites[yn1][xn1];
	ld	c, 10 (ix)
	ld	b, 11 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #_sprites
	add	hl, bc
	ld	c, 8 (ix)
	ld	b, 9 (ix)
	add	hl, bc
	ld	a, -1 (ix)
	ld	(hl), a
00108$:
	C$game.c$161$1_0$80	= .
	.globl	C$game.c$161$1_0$80
;game.c:161: sprites[yn1][xn1] = NOSPRITE; // player's sprite isn't handled by using a box spriteid
	ld	a, #0xff
	ld	(de), a
	C$game.c$162$1_0$80	= .
	.globl	C$game.c$162$1_0$80
;game.c:162: sprites[currentlevel.ypos][currentlevel.xpos] = NOSPRITE;
	ld	a, (#_currentlevel + 1)
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #_sprites
	add	hl, de
	ex	de, hl
	ld	a, (#_currentlevel + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0xff
	C$game.c$163$1_0$80	= .
	.globl	C$game.c$163$1_0$80
;game.c:163: }
	inc	sp
	pop	ix
	C$game.c$163$1_0$80	= .
	.globl	C$game.c$163$1_0$80
	XG$move_sprites$0$0	= .
	.globl	XG$move_sprites$0$0
	ret
	G$undomove_sprites$0$0	= .
	.globl	G$undomove_sprites$0$0
	C$game.c$165$1_0$86	= .
	.globl	C$game.c$165$1_0$86
;game.c:165: void undomove_sprites(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
;	---------------------------------
; Function undomove_sprites
; ---------------------------------
_undomove_sprites::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$game.c$167$1_0$86	= .
	.globl	C$game.c$167$1_0$86
;game.c:167: uint8_t spriteid = sprites[yn1][xn1];
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_sprites
	add	hl, de
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	-1 (ix), a
	ld	c, a
	C$game.c$175$1_0$86	= .
	.globl	C$game.c$175$1_0$86
;game.c:175: if((undomove[undo_head].pushed) && (spriteid != NOSPRITE)) {
	ld	iy, #_undo_head
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	a, #<(_undomove)
	add	a, l
	ld	l, a
	ld	a, #>(_undomove)
	adc	a, h
	ld	h, a
	inc	hl
	ld	b, (hl)
	inc	c
	jr	NZ, 00133$
	ld	a, #0x01
	.db	#0x20
00133$:
	xor	a, a
00134$:
	ld	c, a
	C$game.c$199$1_0$86	= .
	.globl	C$game.c$199$1_0$86
;game.c:199: if(undomove[undo_head].pushed) {
	bit	0, b
	jr	Z,00112$
	C$game.c$200$2_0$90	= .
	.globl	C$game.c$200$2_0$90
;game.c:200: if(spriteid != NOSPRITE) {
	bit	0, c
	jr	NZ,00109$
	C$game.c$202$3_0$91	= .
	.globl	C$game.c$202$3_0$91
;game.c:202: sprites[yn2][xn2] = sprites[yn1][xn1];
	ld	c, 10 (ix)
	ld	b, 11 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #_sprites
	add	hl, bc
	ld	c, 8 (ix)
	ld	b, 9 (ix)
	add	hl, bc
	ld	a, -1 (ix)
	ld	(hl), a
00109$:
	C$game.c$204$2_0$90	= .
	.globl	C$game.c$204$2_0$90
;game.c:204: sprites[yn1][xn1] = NOSPRITE; // player's sprite isn't handled by using a box spriteid			
	ld	a, #0xff
	ld	(de), a
00112$:
	C$game.c$206$1_0$86	= .
	.globl	C$game.c$206$1_0$86
;game.c:206: }
	inc	sp
	pop	ix
	C$game.c$206$1_0$86	= .
	.globl	C$game.c$206$1_0$86
	XG$undomove_sprites$0$0	= .
	.globl	XG$undomove_sprites$0$0
	ret
	G$move_updatelevel$0$0	= .
	.globl	G$move_updatelevel$0$0
	C$game.c$208$1_0$93	= .
	.globl	C$game.c$208$1_0$93
;game.c:208: void move_updatelevel(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
;	---------------------------------
; Function move_updatelevel
; ---------------------------------
_move_updatelevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	C$game.c$214$1_0$93	= .
	.globl	C$game.c$214$1_0$93
;game.c:214: n1 = currentlevel.data[yn1][xn1];
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #(_currentlevel + 0x0007)
	add	hl, de
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
	ld	a, l
	add	a, -4 (ix)
	ld	c, a
	ld	a, h
	adc	a, -3 (ix)
	ld	b, a
	ld	a, (bc)
	ld	-1 (ix), a
	C$game.c$215$1_0$93	= .
	.globl	C$game.c$215$1_0$93
;game.c:215: n2 = currentlevel.data[yn2][xn2];
	ld	e, 10 (ix)
	ld	d, 11 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #(_currentlevel + 0x0007)
	add	hl, de
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	add	hl, de
	ex	de, hl
	ld	a, (de)
	ld	-2 (ix), a
	C$game.c$217$1_0$93	= .
	.globl	C$game.c$217$1_0$93
;game.c:217: switch(n1) {
	ld	a, -1 (ix)
	sub	a, #0x2e
	jr	NZ, 00165$
	ld	a, #0x01
	.db	#0x20
00165$:
	xor	a, a
00166$:
	ld	-5 (ix), a
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	Z,00101$
	ld	a, -5 (ix)
	or	a, a
	jr	NZ,00102$
	jr	00103$
	C$game.c$218$2_0$94	= .
	.globl	C$game.c$218$2_0$94
;game.c:218: case CHAR_FLOOR:
00101$:
	C$game.c$219$2_0$94	= .
	.globl	C$game.c$219$2_0$94
;game.c:219: onlyplayermoves = true;
	ld	a, #0x01
	C$game.c$220$2_0$94	= .
	.globl	C$game.c$220$2_0$94
;game.c:220: currentlevel.data[yn1][xn1] = CHAR_PLAYER;
	push	af
	ld	a, #0x40
	ld	(bc), a
	pop	af
	C$game.c$221$2_0$94	= .
	.globl	C$game.c$221$2_0$94
;game.c:221: break;
	jr	00104$
	C$game.c$222$2_0$94	= .
	.globl	C$game.c$222$2_0$94
;game.c:222: case CHAR_GOAL:
00102$:
	C$game.c$223$2_0$94	= .
	.globl	C$game.c$223$2_0$94
;game.c:223: onlyplayermoves = true;
	ld	a, #0x01
	C$game.c$224$2_0$94	= .
	.globl	C$game.c$224$2_0$94
;game.c:224: currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;
	push	af
	ld	a, #0x2b
	ld	(bc), a
	pop	af
	C$game.c$225$2_0$94	= .
	.globl	C$game.c$225$2_0$94
;game.c:225: break;
	jr	00104$
	C$game.c$226$2_0$94	= .
	.globl	C$game.c$226$2_0$94
;game.c:226: default:
00103$:
	C$game.c$227$2_0$94	= .
	.globl	C$game.c$227$2_0$94
;game.c:227: onlyplayermoves = false;
	xor	a, a
	C$game.c$229$1_0$93	= .
	.globl	C$game.c$229$1_0$93
;game.c:229: }
00104$:
	C$game.c$230$1_0$93	= .
	.globl	C$game.c$230$1_0$93
;game.c:230: if(!onlyplayermoves) {
	bit	0, a
	jr	NZ,00114$
	C$game.c$237$1_0$93	= .
	.globl	C$game.c$237$1_0$93
;game.c:237: currentlevel.goalstaken++;
	C$game.c$231$2_0$95	= .
	.globl	C$game.c$231$2_0$95
;game.c:231: switch(n2) {
	ld	a, -2 (ix)
	sub	a, #0x20
	jr	Z,00105$
	ld	a, -2 (ix)
	sub	a, #0x2e
	jr	Z,00106$
	jr	00108$
	C$game.c$232$3_0$96	= .
	.globl	C$game.c$232$3_0$96
;game.c:232: case CHAR_FLOOR:
00105$:
	C$game.c$233$3_0$96	= .
	.globl	C$game.c$233$3_0$96
;game.c:233: currentlevel.data[yn2][xn2] = CHAR_BOX;
	ld	a, #0x24
	ld	(de), a
	C$game.c$234$3_0$96	= .
	.globl	C$game.c$234$3_0$96
;game.c:234: break;
	jr	00108$
	C$game.c$235$3_0$96	= .
	.globl	C$game.c$235$3_0$96
;game.c:235: case CHAR_GOAL:
00106$:
	C$game.c$236$3_0$96	= .
	.globl	C$game.c$236$3_0$96
;game.c:236: currentlevel.data[yn2][xn2] = CHAR_BOXONGOAL;
	ld	a, #0x2a
	ld	(de), a
	C$game.c$237$3_0$96	= .
	.globl	C$game.c$237$3_0$96
;game.c:237: currentlevel.goalstaken++;
	ld	a, (#(_currentlevel + 0x0005) + 0)
	inc	a
	ld	(#(_currentlevel + 0x0005)),a
	C$game.c$241$2_0$95	= .
	.globl	C$game.c$241$2_0$95
;game.c:241: }
00108$:
	C$game.c$242$2_0$95	= .
	.globl	C$game.c$242$2_0$95
;game.c:242: switch(n1) {
	ld	a, -1 (ix)
	sub	a, #0x24
	jr	Z,00109$
	ld	a, -1 (ix)
	sub	a, #0x2a
	jr	Z,00110$
	ld	a, -5 (ix)
	or	a, a
	jr	NZ,00111$
	jr	00114$
	C$game.c$243$3_0$97	= .
	.globl	C$game.c$243$3_0$97
;game.c:243: case CHAR_BOX:
00109$:
	C$game.c$244$3_0$97	= .
	.globl	C$game.c$244$3_0$97
;game.c:244: currentlevel.data[yn1][xn1] = CHAR_PLAYER;				
	ld	a, #0x40
	ld	(bc), a
	C$game.c$245$3_0$97	= .
	.globl	C$game.c$245$3_0$97
;game.c:245: break;
	jr	00114$
	C$game.c$246$3_0$97	= .
	.globl	C$game.c$246$3_0$97
;game.c:246: case CHAR_BOXONGOAL:
00110$:
	C$game.c$247$3_0$97	= .
	.globl	C$game.c$247$3_0$97
;game.c:247: currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;				
	ld	a, #0x2b
	ld	(bc), a
	C$game.c$248$3_0$97	= .
	.globl	C$game.c$248$3_0$97
;game.c:248: currentlevel.goalstaken--;
	ld	a, (#(_currentlevel + 0x0005) + 0)
	dec	a
	ld	(#(_currentlevel + 0x0005)),a
	C$game.c$249$3_0$97	= .
	.globl	C$game.c$249$3_0$97
;game.c:249: break;
	jr	00114$
	C$game.c$250$3_0$97	= .
	.globl	C$game.c$250$3_0$97
;game.c:250: case CHAR_GOAL:
00111$:
	C$game.c$251$3_0$97	= .
	.globl	C$game.c$251$3_0$97
;game.c:251: currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;
	ld	a, #0x2b
	ld	(bc), a
	C$game.c$253$1_0$93	= .
	.globl	C$game.c$253$1_0$93
;game.c:253: }
00114$:
	C$game.c$258$1_0$93	= .
	.globl	C$game.c$258$1_0$93
;game.c:258: if(currentlevel.data[currentlevel.ypos][currentlevel.xpos] == CHAR_PLAYERONGOAL) currentlevel.data[currentlevel.ypos][currentlevel.xpos] = CHAR_GOAL;
	ld	bc, #_currentlevel + 1
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #(_currentlevel + 0x0007)
	add	hl, de
	ex	de, hl
	ld	a, (#_currentlevel + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x2b
	jr	NZ,00116$
	ld	(hl), #0x2e
	jr	00117$
00116$:
	C$game.c$259$1_0$93	= .
	.globl	C$game.c$259$1_0$93
;game.c:259: else currentlevel.data[currentlevel.ypos][currentlevel.xpos] = CHAR_FLOOR;
	ld	(hl), #0x20
00117$:
	C$game.c$262$1_0$93	= .
	.globl	C$game.c$262$1_0$93
;game.c:262: currentlevel.xpos = xn1;
	ld	a, -4 (ix)
	ld	(#_currentlevel),a
	C$game.c$263$1_0$93	= .
	.globl	C$game.c$263$1_0$93
;game.c:263: currentlevel.ypos = yn1;
	ld	a, 6 (ix)
	ld	(bc), a
	C$game.c$264$1_0$93	= .
	.globl	C$game.c$264$1_0$93
;game.c:264: }
	ld	sp, ix
	pop	ix
	C$game.c$264$1_0$93	= .
	.globl	C$game.c$264$1_0$93
	XG$move_updatelevel$0$0	= .
	.globl	XG$move_updatelevel$0$0
	ret
	G$undomove_updatelevel$0$0	= .
	.globl	G$undomove_updatelevel$0$0
	C$game.c$266$1_0$99	= .
	.globl	C$game.c$266$1_0$99
;game.c:266: void undomove_updatelevel(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2, uint16_t xn3, uint16_t yn3) {
;	---------------------------------
; Function undomove_updatelevel
; ---------------------------------
_undomove_updatelevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$game.c$270$1_0$99	= .
	.globl	C$game.c$270$1_0$99
;game.c:270: n1 = currentlevel.data[yn1][xn1]; // Source / from
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #(_currentlevel + 0x0007)
	add	hl, de
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	add	hl, bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	c, (hl)
	C$game.c$271$1_0$99	= .
	.globl	C$game.c$271$1_0$99
;game.c:271: n2 = currentlevel.data[yn2][xn2]; // This is the curent player's position
	ld	e, 10 (ix)
	ld	d, 11 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #(_currentlevel + 0x0007)
	add	hl, de
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	add	hl, de
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, (hl)
	ld	-1 (ix), a
	C$game.c$272$1_0$99	= .
	.globl	C$game.c$272$1_0$99
;game.c:272: n3 = currentlevel.data[yn3][xn3]; // Destination / to
	ld	e, 14 (ix)
	ld	d, 15 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #(_currentlevel + 0x0007)
	add	hl, de
	ld	a, 12 (ix)
	ld	-3 (ix), a
	ld	a, 13 (ix)
	ld	-2 (ix), a
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	add	hl, de
	ld	a, (hl)
	C$game.c$274$1_0$99	= .
	.globl	C$game.c$274$1_0$99
;game.c:274: switch(n3) {
	cp	a, #0x20
	jr	Z,00101$
	sub	a, #0x2e
	jr	Z,00102$
	jr	00104$
	C$game.c$275$2_0$100	= .
	.globl	C$game.c$275$2_0$100
;game.c:275: case CHAR_FLOOR:
00101$:
	C$game.c$276$2_0$100	= .
	.globl	C$game.c$276$2_0$100
;game.c:276: currentlevel.data[yn3][xn3] = CHAR_PLAYER;
	ld	(hl), #0x40
	C$game.c$277$2_0$100	= .
	.globl	C$game.c$277$2_0$100
;game.c:277: break;
	jr	00104$
	C$game.c$278$2_0$100	= .
	.globl	C$game.c$278$2_0$100
;game.c:278: case CHAR_GOAL:
00102$:
	C$game.c$279$2_0$100	= .
	.globl	C$game.c$279$2_0$100
;game.c:279: currentlevel.data[yn3][xn3] = CHAR_PLAYERONGOAL;
	ld	(hl), #0x2b
	C$game.c$283$1_0$99	= .
	.globl	C$game.c$283$1_0$99
;game.c:283: }
00104$:
	C$game.c$285$1_0$99	= .
	.globl	C$game.c$285$1_0$99
;game.c:285: if(undomove[undo_head].pushed) {
	ld	iy, #_undo_head
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_undomove
	add	hl, de
	inc	hl
	ld	e, (hl)
	C$game.c$297$1_0$99	= .
	.globl	C$game.c$297$1_0$99
;game.c:297: switch(n2) { // revert push to box
	ld	a, -1 (ix)
	sub	a, #0x2b
	jr	NZ, 00157$
	ld	a, #0x01
	.db	#0x20
00157$:
	xor	a, a
00158$:
	ld	-8 (ix), a
	C$game.c$285$1_0$99	= .
	.globl	C$game.c$285$1_0$99
;game.c:285: if(undomove[undo_head].pushed) {
	bit	0, e
	jr	Z,00116$
	C$game.c$292$1_0$99	= .
	.globl	C$game.c$292$1_0$99
;game.c:292: currentlevel.goalstaken--;
	C$game.c$286$2_0$101	= .
	.globl	C$game.c$286$2_0$101
;game.c:286: switch(n1) {
	ld	a,c
	cp	a,#0x24
	jr	Z,00105$
	sub	a, #0x2a
	jr	Z,00106$
	jr	00108$
	C$game.c$287$3_0$102	= .
	.globl	C$game.c$287$3_0$102
;game.c:287: case CHAR_BOX:
00105$:
	C$game.c$288$3_0$102	= .
	.globl	C$game.c$288$3_0$102
;game.c:288: currentlevel.data[yn1][xn1] = CHAR_FLOOR;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x20
	C$game.c$289$3_0$102	= .
	.globl	C$game.c$289$3_0$102
;game.c:289: break;
	jr	00108$
	C$game.c$290$3_0$102	= .
	.globl	C$game.c$290$3_0$102
;game.c:290: case CHAR_BOXONGOAL:
00106$:
	C$game.c$291$3_0$102	= .
	.globl	C$game.c$291$3_0$102
;game.c:291: currentlevel.data[yn1][xn1] = CHAR_GOAL;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x2e
	C$game.c$292$3_0$102	= .
	.globl	C$game.c$292$3_0$102
;game.c:292: currentlevel.goalstaken--;
	ld	a, (#(_currentlevel + 0x0005) + 0)
	dec	a
	ld	(#(_currentlevel + 0x0005)),a
	C$game.c$296$2_0$101	= .
	.globl	C$game.c$296$2_0$101
;game.c:296: }
00108$:
	C$game.c$297$2_0$101	= .
	.globl	C$game.c$297$2_0$101
;game.c:297: switch(n2) { // revert push to box
	ld	a, -8 (ix)
	or	a, a
	jr	Z,00110$
	C$game.c$299$3_0$103	= .
	.globl	C$game.c$299$3_0$103
;game.c:299: currentlevel.data[yn2][xn2] = CHAR_BOXONGOAL;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x2a
	C$game.c$300$3_0$103	= .
	.globl	C$game.c$300$3_0$103
;game.c:300: currentlevel.goalstaken++;
	ld	a, (#(_currentlevel + 0x0005) + 0)
	inc	a
	ld	(#(_currentlevel + 0x0005)),a
	C$game.c$301$3_0$103	= .
	.globl	C$game.c$301$3_0$103
;game.c:301: break;
	jr	00117$
	C$game.c$302$3_0$103	= .
	.globl	C$game.c$302$3_0$103
;game.c:302: default:
00110$:
	C$game.c$303$3_0$103	= .
	.globl	C$game.c$303$3_0$103
;game.c:303: currentlevel.data[yn2][xn2] = CHAR_BOX;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x24
	C$game.c$305$1_0$99	= .
	.globl	C$game.c$305$1_0$99
;game.c:305: }
	jr	00117$
00116$:
	C$game.c$308$2_0$104	= .
	.globl	C$game.c$308$2_0$104
;game.c:308: switch(n2) {
	ld	a, -8 (ix)
	or	a, a
	jr	Z,00113$
	C$game.c$310$3_0$105	= .
	.globl	C$game.c$310$3_0$105
;game.c:310: currentlevel.data[yn2][xn2] = CHAR_GOAL;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x2e
	C$game.c$311$3_0$105	= .
	.globl	C$game.c$311$3_0$105
;game.c:311: break;
	jr	00117$
	C$game.c$312$3_0$105	= .
	.globl	C$game.c$312$3_0$105
;game.c:312: default:
00113$:
	C$game.c$313$3_0$105	= .
	.globl	C$game.c$313$3_0$105
;game.c:313: currentlevel.data[yn2][xn2] = CHAR_FLOOR;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x20
	C$game.c$315$1_0$99	= .
	.globl	C$game.c$315$1_0$99
;game.c:315: }
00117$:
	C$game.c$319$1_0$99	= .
	.globl	C$game.c$319$1_0$99
;game.c:319: currentlevel.xpos = xn3;
	ld	a, -3 (ix)
	ld	(#_currentlevel),a
	C$game.c$320$1_0$99	= .
	.globl	C$game.c$320$1_0$99
;game.c:320: currentlevel.ypos = yn3;
	ld	a, 14 (ix)
	ld	(#(_currentlevel + 0x0001)),a
	C$game.c$321$1_0$99	= .
	.globl	C$game.c$321$1_0$99
;game.c:321: }
	ld	sp, ix
	pop	ix
	C$game.c$321$1_0$99	= .
	.globl	C$game.c$321$1_0$99
	XG$undomove_updatelevel$0$0	= .
	.globl	XG$undomove_updatelevel$0$0
	ret
	G$game_handleUndoMove$0$0	= .
	.globl	G$game_handleUndoMove$0$0
	C$game.c$323$1_0$107	= .
	.globl	C$game.c$323$1_0$107
;game.c:323: void game_handleUndoMove(void) {
;	---------------------------------
; Function game_handleUndoMove
; ---------------------------------
_game_handleUndoMove::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
	C$game.c$324$2_0$107	= .
	.globl	C$game.c$324$2_0$107
;game.c:324: int16_t xn1 = 0, xn2 = 0, yn1 = 0, yn2 = 0, xn3 = 0, yn3 = 0;
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	-13 (ix), #0x00
	ld	-12 (ix), #0x00
	ld	-10 (ix), #0x00
	ld	-9 (ix), #0x00
	C$game.c$326$1_0$107	= .
	.globl	C$game.c$326$1_0$107
;game.c:326: if(num_undomoves) {
	ld	a,(#_num_undomoves + 0)
	or	a, a
	jp	Z, 00111$
	C$game.c$327$2_0$108	= .
	.globl	C$game.c$327$2_0$108
;game.c:327: xn2 = currentlevel.xpos;
	ld	a, (#_currentlevel + 0)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	C$game.c$328$2_0$108	= .
	.globl	C$game.c$328$2_0$108
;game.c:328: yn2 = currentlevel.ypos;
	ld	a, (#(_currentlevel + 0x0001) + 0)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	C$game.c$331$2_0$108	= .
	.globl	C$game.c$331$2_0$108
;game.c:331: if(undo_head) undo_head--;
	ld	iy, #_undo_head
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00102$
	dec	0 (iy)
	jr	00103$
00102$:
	C$game.c$332$2_0$108	= .
	.globl	C$game.c$332$2_0$108
;game.c:332: else undo_head = UNDOBUFFERSIZE-1;		
	ld	hl,#_undo_head + 0
	ld	(hl), #0x7f
00103$:
	C$game.c$335$2_0$108	= .
	.globl	C$game.c$335$2_0$108
;game.c:335: switch(undomove[undo_head].movekey) {
	ld	bc, #_undomove+0
	ld	iy, #_undo_head
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	ld	-11 (ix), a
	C$game.c$339$1_0$107	= .
	.globl	C$game.c$339$1_0$107
;game.c:339: xn1 = xn2 - 1;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	dec	bc
	C$game.c$340$1_0$107	= .
	.globl	C$game.c$340$1_0$107
;game.c:340: xn3 = xn2 + 1;
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	inc	de
	C$game.c$335$2_0$108	= .
	.globl	C$game.c$335$2_0$108
;game.c:335: switch(undomove[undo_head].movekey) {
	ld	a, -11 (ix)
	sub	a, #0x08
	jr	Z,00104$
	C$game.c$345$1_0$107	= .
	.globl	C$game.c$345$1_0$107
;game.c:345: yn1 = yn2 - 1;
	ld	a, -8 (ix)
	add	a, #0xff
	ld	-15 (ix), a
	ld	a, -7 (ix)
	adc	a, #0xff
	ld	-14 (ix), a
	C$game.c$346$1_0$107	= .
	.globl	C$game.c$346$1_0$107
;game.c:346: yn3 = yn2 + 1;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	inc	hl
	C$game.c$335$2_0$108	= .
	.globl	C$game.c$335$2_0$108
;game.c:335: switch(undomove[undo_head].movekey) {
	ld	a, -11 (ix)
	sub	a, #0x0a
	jr	Z,00106$
	ld	a, -11 (ix)
	sub	a, #0x0b
	jr	Z,00105$
	ld	a, -11 (ix)
	sub	a, #0x15
	jp	Z,00107$
	jp	00108$
	C$game.c$336$3_0$109	= .
	.globl	C$game.c$336$3_0$109
;game.c:336: case 0x8: // undo LEFT
00104$:
	C$game.c$337$3_0$109	= .
	.globl	C$game.c$337$3_0$109
;game.c:337: yn1 = yn2;
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	C$game.c$338$3_0$109	= .
	.globl	C$game.c$338$3_0$109
;game.c:338: yn3 = yn2;
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	C$game.c$339$3_0$109	= .
	.globl	C$game.c$339$3_0$109
;game.c:339: xn1 = xn2 - 1;
	ld	-2 (ix), c
	ld	-1 (ix), b
	C$game.c$340$3_0$109	= .
	.globl	C$game.c$340$3_0$109
;game.c:340: xn3 = xn2 + 1;
	ld	-13 (ix), e
	ld	-12 (ix), d
	C$game.c$341$3_0$109	= .
	.globl	C$game.c$341$3_0$109
;game.c:341: break;
	jp	00108$
	C$game.c$342$3_0$109	= .
	.globl	C$game.c$342$3_0$109
;game.c:342: case 0xb: // undo UP
00105$:
	C$game.c$343$3_0$109	= .
	.globl	C$game.c$343$3_0$109
;game.c:343: xn1 = xn2;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	C$game.c$344$3_0$109	= .
	.globl	C$game.c$344$3_0$109
;game.c:344: xn3 = xn2;
	ld	a, -4 (ix)
	ld	-13 (ix), a
	ld	a, -3 (ix)
	ld	-12 (ix), a
	C$game.c$345$3_0$109	= .
	.globl	C$game.c$345$3_0$109
;game.c:345: yn1 = yn2 - 1;
	ld	a, -15 (ix)
	ld	-6 (ix), a
	ld	a, -14 (ix)
	ld	-5 (ix), a
	C$game.c$346$3_0$109	= .
	.globl	C$game.c$346$3_0$109
;game.c:346: yn3 = yn2 + 1;
	ld	-10 (ix), l
	ld	-9 (ix), h
	C$game.c$347$3_0$109	= .
	.globl	C$game.c$347$3_0$109
;game.c:347: break;
	jr	00108$
	C$game.c$348$3_0$109	= .
	.globl	C$game.c$348$3_0$109
;game.c:348: case 0xa: // undo DOWN
00106$:
	C$game.c$349$3_0$109	= .
	.globl	C$game.c$349$3_0$109
;game.c:349: xn1 = xn2;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	C$game.c$350$3_0$109	= .
	.globl	C$game.c$350$3_0$109
;game.c:350: xn3 = xn2;
	ld	a, -4 (ix)
	ld	-13 (ix), a
	ld	a, -3 (ix)
	ld	-12 (ix), a
	C$game.c$351$3_0$109	= .
	.globl	C$game.c$351$3_0$109
;game.c:351: yn1 = yn2 + 1;
	ld	-6 (ix), l
	ld	-5 (ix), h
	C$game.c$352$3_0$109	= .
	.globl	C$game.c$352$3_0$109
;game.c:352: yn3 = yn2 - 1;
	ld	a, -15 (ix)
	ld	-10 (ix), a
	ld	a, -14 (ix)
	ld	-9 (ix), a
	C$game.c$353$3_0$109	= .
	.globl	C$game.c$353$3_0$109
;game.c:353: break;
	jr	00108$
	C$game.c$354$3_0$109	= .
	.globl	C$game.c$354$3_0$109
;game.c:354: case 0x15: // undo RIGHT
00107$:
	C$game.c$355$3_0$109	= .
	.globl	C$game.c$355$3_0$109
;game.c:355: yn1 = yn2;
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	C$game.c$356$3_0$109	= .
	.globl	C$game.c$356$3_0$109
;game.c:356: yn3 = yn2;
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	C$game.c$357$3_0$109	= .
	.globl	C$game.c$357$3_0$109
;game.c:357: xn1 = xn2 + 1;
	ld	-2 (ix), e
	ld	-1 (ix), d
	C$game.c$358$3_0$109	= .
	.globl	C$game.c$358$3_0$109
;game.c:358: xn3 = xn2 - 1;
	ld	-13 (ix), c
	ld	-12 (ix), b
	C$game.c$360$2_0$108	= .
	.globl	C$game.c$360$2_0$108
;game.c:360: }
00108$:
	C$game.c$361$2_0$108	= .
	.globl	C$game.c$361$2_0$108
;game.c:361: undomove_sprites(xn1,yn1,xn2,yn2);			
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	call	_undomove_sprites
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$362$2_0$108	= .
	.globl	C$game.c$362$2_0$108
;game.c:362: undomove_updatelevel(xn1, yn1, xn2, yn2, xn3, yn3);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	call	_undomove_updatelevel
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	C$game.c$364$2_0$108	= .
	.globl	C$game.c$364$2_0$108
;game.c:364: num_undomoves--;
	ld	hl, #_num_undomoves+0
	dec	(hl)
00111$:
	C$game.c$366$1_0$107	= .
	.globl	C$game.c$366$1_0$107
;game.c:366: }
	ld	sp, ix
	pop	ix
	C$game.c$366$1_0$107	= .
	.globl	C$game.c$366$1_0$107
	XG$game_handleUndoMove$0$0	= .
	.globl	XG$game_handleUndoMove$0$0
	ret
	G$game_handleKey$0$0	= .
	.globl	G$game_handleKey$0$0
	C$game.c$368$1_0$111	= .
	.globl	C$game.c$368$1_0$111
;game.c:368: bool game_handleKey(char key) {
;	---------------------------------
; Function game_handleKey
; ---------------------------------
_game_handleKey::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$game.c$369$2_0$111	= .
	.globl	C$game.c$369$2_0$111
;game.c:369: bool done = false;
	ld	-9 (ix), #0x00
	C$game.c$371$2_0$111	= .
	.globl	C$game.c$371$2_0$111
;game.c:371: int16_t	xn1 = 0,xn2 = 0,yn1 = 0,yn2 = 0;
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
	C$game.c$373$1_0$111	= .
	.globl	C$game.c$373$1_0$111
;game.c:373: switch(key) {
	ld	a, 4 (ix)
	sub	a, #0x08
	jr	Z,00101$
	ld	a, 4 (ix)
	sub	a, #0x0a
	jp	Z,00103$
	ld	a, 4 (ix)
	sub	a, #0x0b
	jr	Z,00102$
	ld	a, 4 (ix)
	sub	a, #0x15
	jp	Z,00104$
	jp	00105$
	C$game.c$374$2_0$112	= .
	.globl	C$game.c$374$2_0$112
;game.c:374: case 0x8: // LEFT
00101$:
	C$game.c$375$2_0$112	= .
	.globl	C$game.c$375$2_0$112
;game.c:375: xn1 = currentlevel.xpos - 1;
	ld	a, (#_currentlevel + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xff
	ld	-4 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-3 (ix), a
	C$game.c$376$2_0$112	= .
	.globl	C$game.c$376$2_0$112
;game.c:376: yn1 = currentlevel.ypos;
	ld	a, (#_currentlevel + 1)
	ld	c, a
	ld	b, #0x00
	ld	-8 (ix), c
	ld	-7 (ix), b
	C$game.c$377$2_0$112	= .
	.globl	C$game.c$377$2_0$112
;game.c:377: xn2 = currentlevel.xpos - 2;
	ld	a, (#_currentlevel + 0)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-5 (ix), a
	C$game.c$378$2_0$112	= .
	.globl	C$game.c$378$2_0$112
;game.c:378: yn2 = currentlevel.ypos;
	ld	-2 (ix), c
	ld	-1 (ix), b
	C$game.c$379$2_0$112	= .
	.globl	C$game.c$379$2_0$112
;game.c:379: move = true;
	ld	c, #0x01
	C$game.c$380$2_0$112	= .
	.globl	C$game.c$380$2_0$112
;game.c:380: break;
	jp	00106$
	C$game.c$381$2_0$112	= .
	.globl	C$game.c$381$2_0$112
;game.c:381: case 0xb:
00102$:
	C$game.c$382$2_0$112	= .
	.globl	C$game.c$382$2_0$112
;game.c:382: xn1 = currentlevel.xpos;
	ld	a,(#_currentlevel + 0)
	ld	-12 (ix), a
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	C$game.c$383$2_0$112	= .
	.globl	C$game.c$383$2_0$112
;game.c:383: yn1 = currentlevel.ypos - 1;
	ld	a,(#_currentlevel + 1)
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-8 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-7 (ix), a
	C$game.c$384$2_0$112	= .
	.globl	C$game.c$384$2_0$112
;game.c:384: xn2 = currentlevel.xpos;
	ld	a, (#_currentlevel + 0)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	C$game.c$385$2_0$112	= .
	.globl	C$game.c$385$2_0$112
;game.c:385: yn2 = currentlevel.ypos - 2;
	ld	a, -11 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	C$game.c$386$2_0$112	= .
	.globl	C$game.c$386$2_0$112
;game.c:386: move = true;
	ld	c, #0x01
	C$game.c$387$2_0$112	= .
	.globl	C$game.c$387$2_0$112
;game.c:387: break;
	jr	00106$
	C$game.c$388$2_0$112	= .
	.globl	C$game.c$388$2_0$112
;game.c:388: case 0xa:
00103$:
	C$game.c$389$2_0$112	= .
	.globl	C$game.c$389$2_0$112
;game.c:389: xn1 = currentlevel.xpos;
	ld	a, (#_currentlevel + 0)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	C$game.c$390$2_0$112	= .
	.globl	C$game.c$390$2_0$112
;game.c:390: yn1 = currentlevel.ypos + 1;
	ld	a, (#_currentlevel + 1)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0001
	add	hl, bc
	ld	-8 (ix), l
	ld	-7 (ix), h
	C$game.c$391$2_0$112	= .
	.globl	C$game.c$391$2_0$112
;game.c:391: xn2 = currentlevel.xpos;
	ld	a, (#_currentlevel + 0)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	C$game.c$392$2_0$112	= .
	.globl	C$game.c$392$2_0$112
;game.c:392: yn2 = currentlevel.ypos + 2;
	inc	bc
	inc	bc
	ld	-2 (ix), c
	ld	-1 (ix), b
	C$game.c$393$2_0$112	= .
	.globl	C$game.c$393$2_0$112
;game.c:393: move = true;
	ld	c, #0x01
	C$game.c$394$2_0$112	= .
	.globl	C$game.c$394$2_0$112
;game.c:394: break;
	jr	00106$
	C$game.c$395$2_0$112	= .
	.globl	C$game.c$395$2_0$112
;game.c:395: case 0x15: // RIGHT
00104$:
	C$game.c$396$2_0$112	= .
	.globl	C$game.c$396$2_0$112
;game.c:396: xn1 = currentlevel.xpos + 1;
	ld	a, (#_currentlevel + 0)
	ld	c, a
	ld	b, #0x00
	inc	bc
	ld	-4 (ix), c
	ld	-3 (ix), b
	C$game.c$397$2_0$112	= .
	.globl	C$game.c$397$2_0$112
;game.c:397: yn1 = currentlevel.ypos;
	ld	a, (#_currentlevel + 1)
	ld	c, a
	ld	b, #0x00
	ld	-8 (ix), c
	ld	-7 (ix), b
	C$game.c$398$2_0$112	= .
	.globl	C$game.c$398$2_0$112
;game.c:398: xn2 = currentlevel.xpos + 2;
	ld	a, (#_currentlevel + 0)
	ld	e, a
	ld	d, #0x00
	inc	de
	inc	de
	ld	-6 (ix), e
	ld	-5 (ix), d
	C$game.c$399$2_0$112	= .
	.globl	C$game.c$399$2_0$112
;game.c:399: yn2 = currentlevel.ypos;
	ld	-2 (ix), c
	ld	-1 (ix), b
	C$game.c$400$2_0$112	= .
	.globl	C$game.c$400$2_0$112
;game.c:400: move = true;
	ld	c, #0x01
	C$game.c$401$2_0$112	= .
	.globl	C$game.c$401$2_0$112
;game.c:401: break;
	jr	00106$
	C$game.c$402$2_0$112	= .
	.globl	C$game.c$402$2_0$112
;game.c:402: default:
00105$:
	C$game.c$403$2_0$112	= .
	.globl	C$game.c$403$2_0$112
;game.c:403: move = false;
	ld	c, #0x00
	C$game.c$405$1_0$111	= .
	.globl	C$game.c$405$1_0$111
;game.c:405: }
00106$:
	C$game.c$406$1_0$111	= .
	.globl	C$game.c$406$1_0$111
;game.c:406: if(move) {
	bit	0, c
	jp	Z, 00114$
	C$game.c$407$2_0$113	= .
	.globl	C$game.c$407$2_0$113
;game.c:407: if(canmove(xn1,yn1,xn2,yn2)) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_canmove
	pop	af
	pop	af
	pop	af
	pop	af
	bit	0, l
	jp	Z, 00114$
	C$game.c$408$3_0$114	= .
	.globl	C$game.c$408$3_0$114
;game.c:408: undomove[undo_head].movekey = key;
	ld	bc, #_undomove+0
	ld	iy, #_undo_head
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
	C$game.c$409$3_0$114	= .
	.globl	C$game.c$409$3_0$114
;game.c:409: undomove[undo_head].pushed = (currentlevel.data[yn1][xn1] == CHAR_BOX) || (currentlevel.data[yn1][xn1] == CHAR_BOXONGOAL);
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ex	de, hl
	inc	de
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #(_currentlevel + 0x0007)
	add	hl, bc
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x24
	jr	Z,00118$
	sub	a, #0x2a
	jr	Z,00118$
	xor	a, a
	jr	00119$
00118$:
	ld	a, #0x01
00119$:
	ld	(de), a
	C$game.c$411$3_0$114	= .
	.globl	C$game.c$411$3_0$114
;game.c:411: if(++undo_head == UNDOBUFFERSIZE) undo_head = 0;
	ld	iy, #_undo_head
	inc	0 (iy)
	ld	a, 0 (iy)
	sub	a, #0x80
	jr	NZ,00108$
	ld	0 (iy), #0x00
00108$:
	C$game.c$413$3_0$114	= .
	.globl	C$game.c$413$3_0$114
;game.c:413: if(++num_undomoves > UNDOBUFFERSIZE) num_undomoves = UNDOBUFFERSIZE;
	ld	iy, #_num_undomoves
	inc	0 (iy)
	ld	a, #0x80
	sub	a, 0 (iy)
	jr	NC,00110$
	ld	0 (iy), #0x80
00110$:
	C$game.c$415$3_0$114	= .
	.globl	C$game.c$415$3_0$114
;game.c:415: move_sprites(xn1,yn1,xn2,yn2);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_move_sprites
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$416$3_0$114	= .
	.globl	C$game.c$416$3_0$114
;game.c:416: move_updatelevel(xn1,yn1,xn2,yn2);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_move_updatelevel
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$417$3_0$114	= .
	.globl	C$game.c$417$3_0$114
;game.c:417: done = (currentlevel.goals == currentlevel.goalstaken);
	ld	hl, #_currentlevel + 4
	ld	c, (hl)
	ld	hl, #_currentlevel + 5
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NZ, 00178$
	ld	a, #0x01
	.db	#0x20
00178$:
	xor	a, a
00179$:
	ld	-9 (ix), a
00114$:
	C$game.c$420$1_0$111	= .
	.globl	C$game.c$420$1_0$111
;game.c:420: return done;
	ld	l, -9 (ix)
	C$game.c$421$1_0$111	= .
	.globl	C$game.c$421$1_0$111
;game.c:421: }
	ld	sp, ix
	pop	ix
	C$game.c$421$1_0$111	= .
	.globl	C$game.c$421$1_0$111
	XG$game_handleKey$0$0	= .
	.globl	XG$game_handleKey$0$0
	ret
	G$game_getResponse$0$0	= .
	.globl	G$game_getResponse$0$0
	C$game.c$423$1_0$116	= .
	.globl	C$game.c$423$1_0$116
;game.c:423: char game_getResponse(char *message, char option1, char option2) {
;	---------------------------------
; Function game_getResponse
; ---------------------------------
_game_getResponse::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	C$game.c$425$1_0$116	= .
	.globl	C$game.c$425$1_0$116
;game.c:425: uint8_t len = strlen(message);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_strlen
	pop	af
	ld	c, l
	C$game.c$426$1_0$116	= .
	.globl	C$game.c$426$1_0$116
;game.c:426: uint8_t start = (80 - len) / 2;
	ld	b, #0x00
	ld	hl, #0x0050
	cp	a, a
	sbc	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00111$
	ex	de,hl
	inc	de
00111$:
	sra	d
	rr	e
	C$game.c$427$1_0$116	= .
	.globl	C$game.c$427$1_0$116
;game.c:427: char ret = 0;
	ld	d, #0x00
	C$game.c$431$2_0$117	= .
	.globl	C$game.c$431$2_0$117
;game.c:431: for(n = start - 1; n < (start+len+1); n++) {
	ld	a, e
	add	a, #0xff
	ld	-3 (ix), a
00107$:
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	inc	hl
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	jp	P, 00101$
	inc	-3 (ix)
	jr	00107$
00101$:
	C$game.c$440$1_0$116	= .
	.globl	C$game.c$440$1_0$116
;game.c:440: printf("%s ", message);
	push	de
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	de
	C$game.c$442$1_0$116	= .
	.globl	C$game.c$442$1_0$116
;game.c:442: while((ret != option1) && (ret != option2)) ret = con_getc();
00103$:
	ld	a, 6 (ix)
	sub	a, d
	jr	Z,00105$
	ld	a, 7 (ix)
	sub	a, d
	jr	Z,00105$
	call	_con_getc
	ld	d, l
	jr	00103$
00105$:
	C$game.c$446$1_0$116	= .
	.globl	C$game.c$446$1_0$116
;game.c:446: return ret;
	ld	l, d
	C$game.c$447$1_0$116	= .
	.globl	C$game.c$447$1_0$116
;game.c:447: }
	ld	sp, ix
	pop	ix
	C$game.c$447$1_0$116	= .
	.globl	C$game.c$447$1_0$116
	XG$game_getResponse$0$0	= .
	.globl	XG$game_getResponse$0$0
	ret
Fgame$__str_0$0_0$0 == .
___str_0:
	.ascii "%s "
	.db 0x00
	G$game_splash_screen$0$0	= .
	.globl	G$game_splash_screen$0$0
	C$game.c$449$1_0$120	= .
	.globl	C$game.c$449$1_0$120
;game.c:449: void game_splash_screen() {
;	---------------------------------
; Function game_splash_screen
; ---------------------------------
_game_splash_screen::
	C$game.c$475$1_0$120	= .
	.globl	C$game.c$475$1_0$120
;game.c:475: }
	C$game.c$475$1_0$120	= .
	.globl	C$game.c$475$1_0$120
	XG$game_splash_screen$0$0	= .
	.globl	XG$game_splash_screen$0$0
	ret
	G$game_displayHelp$0$0	= .
	.globl	G$game_displayHelp$0$0
	C$game.c$477$1_0$122	= .
	.globl	C$game.c$477$1_0$122
;game.c:477: void game_displayHelp(uint8_t xpos, uint8_t ypos) {
;	---------------------------------
; Function game_displayHelp
; ---------------------------------
_game_displayHelp::
	C$game.c$529$1_0$122	= .
	.globl	C$game.c$529$1_0$122
;game.c:529: return;
	C$game.c$530$1_0$122	= .
	.globl	C$game.c$530$1_0$122
;game.c:530: }
	C$game.c$530$1_0$122	= .
	.globl	C$game.c$530$1_0$122
	XG$game_displayHelp$0$0	= .
	.globl	XG$game_displayHelp$0$0
	ret
	G$game_selectLevel$0$0	= .
	.globl	G$game_selectLevel$0$0
	C$game.c$532$1_0$124	= .
	.globl	C$game.c$532$1_0$124
;game.c:532: int16_t game_selectLevel(uint8_t levels, uint16_t previouslevel) {
;	---------------------------------
; Function game_selectLevel
; ---------------------------------
_game_selectLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	C$game.c$534$2_0$124	= .
	.globl	C$game.c$534$2_0$124
;game.c:534: bool selected = false;
	ld	-3 (ix), #0x00
	C$game.c$535$1_0$124	= .
	.globl	C$game.c$535$1_0$124
;game.c:535: lvl = previouslevel;
	ld	a, 5 (ix)
	ld	-2 (ix), a
	ld	a, 6 (ix)
	ld	-1 (ix), a
	C$game.c$537$2_0$125	= .
	.globl	C$game.c$537$2_0$125
;game.c:537: while(!selected) {
00115$:
	bit	0, -3 (ix)
	jp	NZ, 00117$
	C$game.c$538$2_0$125	= .
	.globl	C$game.c$538$2_0$125
;game.c:538: game_initLevel(lvl);			// initialize playing field data from memory or disk
	ld	b, -2 (ix)
	push	bc
	inc	sp
	call	_game_initLevel
	inc	sp
	C$game.c$540$2_0$125	= .
	.globl	C$game.c$540$2_0$125
;game.c:540: game_displayMinimap();			// display 'current' level
	call	_game_displayMinimap
	C$game.c$544$2_0$125	= .
	.globl	C$game.c$544$2_0$125
;game.c:544: printf("Level %03d / %03d",lvl+1,levels); // user level# starts at 1, internally this is level 0
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	push	bc
	push	de
	push	de
	push	bc
	ld	hl, #___str_1
	push	hl
	call	_printf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	hl, #___str_4
	push	hl
	call	_puts
	pop	af
	ld	de, #0x0d32
	push	de
	call	_game_displayHelp
	pop	af
	call	_con_getc
	ld	a, l
	pop	de
	pop	bc
	C$game.c$563$1_0$124	= .
	.globl	C$game.c$563$1_0$124
;game.c:563: else lvl = levels-1;
	dec	de
	C$game.c$559$2_0$125	= .
	.globl	C$game.c$559$2_0$125
;game.c:559: switch(con_getc())	{
	cp	a, #0x08
	jr	Z,00102$
	cp	a, #0x0a
	jr	Z,00102$
	cp	a, #0x0b
	jr	Z,00107$
	cp	a, #0x0d
	jr	Z,00111$
	cp	a, #0x15
	jr	Z,00107$
	sub	a, #0x1b
	jr	Z,00112$
	jr	00115$
	C$game.c$561$3_0$126	= .
	.globl	C$game.c$561$3_0$126
;game.c:561: case 0x0a:
00102$:
	C$game.c$562$3_0$126	= .
	.globl	C$game.c$562$3_0$126
;game.c:562: if(lvl > 0) lvl --;
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	P, 00104$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00115$
00104$:
	C$game.c$563$3_0$126	= .
	.globl	C$game.c$563$3_0$126
;game.c:563: else lvl = levels-1;
	ld	-2 (ix), e
	ld	-1 (ix), d
	C$game.c$564$3_0$126	= .
	.globl	C$game.c$564$3_0$126
;game.c:564: break;
	jp	00115$
	C$game.c$566$3_0$126	= .
	.globl	C$game.c$566$3_0$126
;game.c:566: case 0x15:
00107$:
	C$game.c$567$3_0$126	= .
	.globl	C$game.c$567$3_0$126
;game.c:567: if(lvl < levels-1) lvl++;
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	P, 00109$
	ld	-2 (ix), c
	ld	-1 (ix), b
	jp	00115$
00109$:
	C$game.c$568$3_0$126	= .
	.globl	C$game.c$568$3_0$126
;game.c:568: else lvl = 0;
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
	C$game.c$569$3_0$126	= .
	.globl	C$game.c$569$3_0$126
;game.c:569: break;
	jp	00115$
	C$game.c$570$3_0$126	= .
	.globl	C$game.c$570$3_0$126
;game.c:570: case 0xd:
00111$:
	C$game.c$571$3_0$126	= .
	.globl	C$game.c$571$3_0$126
;game.c:571: selected = true;
	ld	-3 (ix), #0x01
	C$game.c$572$3_0$126	= .
	.globl	C$game.c$572$3_0$126
;game.c:572: break;
	jp	00115$
	C$game.c$573$3_0$126	= .
	.globl	C$game.c$573$3_0$126
;game.c:573: case 27:
00112$:
	C$game.c$574$3_0$126	= .
	.globl	C$game.c$574$3_0$126
;game.c:574: lvl = -1;
	ld	-2 (ix), #0xff
	ld	-1 (ix), #0xff
	C$game.c$575$3_0$126	= .
	.globl	C$game.c$575$3_0$126
;game.c:575: selected = true;
	ld	-3 (ix), #0x01
	C$game.c$576$3_0$126	= .
	.globl	C$game.c$576$3_0$126
;game.c:576: break;
	jp	00115$
	C$game.c$579$1_0$124	= .
	.globl	C$game.c$579$1_0$124
;game.c:579: }
00117$:
	C$game.c$581$1_0$124	= .
	.globl	C$game.c$581$1_0$124
;game.c:581: return lvl;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	C$game.c$582$1_0$124	= .
	.globl	C$game.c$582$1_0$124
;game.c:582: }
	ld	sp, ix
	pop	ix
	C$game.c$582$1_0$124	= .
	.globl	C$game.c$582$1_0$124
	XG$game_selectLevel$0$0	= .
	.globl	XG$game_selectLevel$0$0
	ret
Fgame$__str_1$0_0$0 == .
___str_1:
	.ascii "Level %03d / %03d"
	.db 0x00
Fgame$__str_4$0_0$0 == .
___str_4:
	.ascii "Select level with cursor keys"
	.db 0x0a
	.ascii "ESC to quit"
	.db 0x00
	G$game_displayLevel$0$0	= .
	.globl	G$game_displayLevel$0$0
	C$game.c$584$1_0$128	= .
	.globl	C$game.c$584$1_0$128
;game.c:584: void game_displayLevel(void) {
;	---------------------------------
; Function game_displayLevel
; ---------------------------------
_game_displayLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
	C$game.c$588$1_0$128	= .
	.globl	C$game.c$588$1_0$128
;game.c:588: uint8_t currentlevel_width = currentlevel.width; // compiler bug later on
	ld	hl, #_currentlevel + 2
	ld	e, (hl)
	ld	-2 (ix), e
	C$game.c$589$1_0$128	= .
	.globl	C$game.c$589$1_0$128
;game.c:589: uint8_t currentlevel_height = currentlevel.height; // compiler bug later on
	ld	hl, #_currentlevel + 3
	ld	c, (hl)
	ld	-3 (ix), c
	C$game.c$591$1_0$128	= .
	.globl	C$game.c$591$1_0$128
;game.c:591: spritenumber = 1;
	ld	hl,#_spritenumber + 0
	ld	(hl), #0x01
	C$game.c$599$1_0$128	= .
	.globl	C$game.c$599$1_0$128
;game.c:599: xstart = ((MAXWIDTH - currentlevel.width) / 2) * BITMAP_WIDTH;
	ld	d, #0x00
	ld	hl, #0x0014
	cp	a, a
	sbc	hl, de
	ld	a, h
	rlca
	and	a,#0x01
	C$game.c$600$1_0$128	= .
	.globl	C$game.c$600$1_0$128
;game.c:600: ystart = ((MAXHEIGHT - currentlevel.height) / 2) *BITMAP_HEIGHT;
	ld	b, #0x00
	ld	hl, #0x000f
	cp	a, a
	sbc	hl, bc
	ld	a, h
	rlca
	and	a,#0x01
	C$game.c$603$5_0$132	= .
	.globl	C$game.c$603$5_0$132
;game.c:603: for(height = 0; height < currentlevel_height; height++) {
	ld	de, #0x0000
00116$:
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC,00118$
	C$game.c$605$5_0$132	= .
	.globl	C$game.c$605$5_0$132
;game.c:605: for(width = 0; width < currentlevel_width; width++) {
	push	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	c, l
	ld	b, h
	ld	hl, #(_currentlevel + 0x0007)
	add	hl, bc
	ex	(sp), hl
	ld	hl, #_sprites
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	bc, #0x0000
00113$:
	ld	l, -2 (ix)
	ld	h, #0x00
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC,00110$
	C$game.c$606$5_0$132	= .
	.globl	C$game.c$606$5_0$132
;game.c:606: c = currentlevel.data[height][width];
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl)
	ld	-1 (ix), a
	C$game.c$607$2_0$128	= .
	.globl	C$game.c$607$2_0$128
;game.c:607: sprites[height][width] = NOSPRITE; // Faster in most cases
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
	ld	(hl), #0xff
	C$game.c$608$5_0$132	= .
	.globl	C$game.c$608$5_0$132
;game.c:608: switch(c) {
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	Z,00109$
	ld	a, -1 (ix)
	sub	a, #0x23
	jr	Z,00109$
	ld	a, -1 (ix)
	sub	a, #0x24
	jr	Z,00105$
	ld	a, -1 (ix)
	sub	a, #0x2a
	jr	Z,00105$
	ld	a, -1 (ix)
	sub	a, #0x2b
	jr	Z,00109$
	xor	a,a
	C$game.c$617$6_0$133	= .
	.globl	C$game.c$617$6_0$133
;game.c:617: break;
	jr	00109$
	C$game.c$619$6_0$133	= .
	.globl	C$game.c$619$6_0$133
;game.c:619: case CHAR_BOXONGOAL:
00105$:
	C$game.c$628$6_0$133	= .
	.globl	C$game.c$628$6_0$133
;game.c:628: sprites[height][width] = spritenumber;
	ld	iy, #_spritenumber
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$629$6_0$133	= .
	.globl	C$game.c$629$6_0$133
;game.c:629: spritenumber++;
	inc	0 (iy)
	C$game.c$642$5_0$132	= .
	.globl	C$game.c$642$5_0$132
;game.c:642: }
00109$:
	C$game.c$605$4_0$131	= .
	.globl	C$game.c$605$4_0$131
;game.c:605: for(width = 0; width < currentlevel_width; width++) {
	inc	bc
	jr	00113$
00110$:
	C$game.c$603$2_0$129	= .
	.globl	C$game.c$603$2_0$129
;game.c:603: for(height = 0; height < currentlevel_height; height++) {
	inc	de
	jp	00116$
00118$:
	C$game.c$649$2_0$128	= .
	.globl	C$game.c$649$2_0$128
;game.c:649: }
	ld	sp, ix
	pop	ix
	C$game.c$649$2_0$128	= .
	.globl	C$game.c$649$2_0$128
	XG$game_displayLevel$0$0	= .
	.globl	XG$game_displayLevel$0$0
	ret
	G$game_displayMinimap$0$0	= .
	.globl	G$game_displayMinimap$0$0
	C$game.c$651$2_0$136	= .
	.globl	C$game.c$651$2_0$136
;game.c:651: void game_displayMinimap(void) {
;	---------------------------------
; Function game_displayMinimap
; ---------------------------------
_game_displayMinimap::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	C$game.c$655$1_0$136	= .
	.globl	C$game.c$655$1_0$136
;game.c:655: uint8_t currentlevel_width = currentlevel.width; // compiler bug later on
	ld	hl, #_currentlevel + 2
	ld	e, (hl)
	ld	-2 (ix), e
	C$game.c$656$1_0$136	= .
	.globl	C$game.c$656$1_0$136
;game.c:656: uint8_t currentlevel_height = currentlevel.height; // compiler bug later on
	ld	hl, #_currentlevel + 3
	ld	c, (hl)
	ld	-1 (ix), c
	C$game.c$659$1_0$136	= .
	.globl	C$game.c$659$1_0$136
;game.c:659: xstart = (((MAXWIDTH - currentlevel.width) / 2) * MINIMAP_WIDTH) + MINIMAP_XSTART;
	ld	d, #0x00
	ld	hl, #0x0014
	cp	a, a
	sbc	hl, de
	ld	a, h
	rlca
	and	a,#0x01
	C$game.c$660$1_0$136	= .
	.globl	C$game.c$660$1_0$136
;game.c:660: ystart = (((MAXHEIGHT - currentlevel.height) / 2) * MINIMAP_HEIGHT) + MINIMAP_YSTART;
	ld	b, #0x00
	ld	hl, #0x000f
	cp	a, a
	sbc	hl, bc
	ld	a, h
	rlca
	and	a,#0x01
	C$game.c$663$5_0$140	= .
	.globl	C$game.c$663$5_0$140
;game.c:663: for(height = 0; height < currentlevel_height; height++)	{
	ld	de, #0x0000
00116$:
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC,00118$
	C$game.c$665$5_0$140	= .
	.globl	C$game.c$665$5_0$140
;game.c:665: for(width = 0; width < currentlevel_width; width++) {
	push	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	bc,#(_currentlevel + 0x0007)
	add	hl,bc
	ex	(sp), hl
	ld	bc, #0x0000
00113$:
	ld	l, -2 (ix)
	ld	h, #0x00
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC,00110$
	C$game.c$666$5_0$140	= .
	.globl	C$game.c$666$5_0$140
;game.c:666: c = currentlevel.data[height][width];
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl)
	C$game.c$667$5_0$140	= .
	.globl	C$game.c$667$5_0$140
;game.c:667: switch(c) {
	cp	a, #0x20
	jr	Z,00109$
	cp	a, #0x23
	jr	Z,00109$
	sub	a, #0x24
	jr	Z,00169$
	xor	a,a
00169$:
	C$game.c$692$5_0$140	= .
	.globl	C$game.c$692$5_0$140
;game.c:692: }
00109$:
	C$game.c$665$4_0$139	= .
	.globl	C$game.c$665$4_0$139
;game.c:665: for(width = 0; width < currentlevel_width; width++) {
	inc	bc
	jr	00113$
00110$:
	C$game.c$663$2_0$137	= .
	.globl	C$game.c$663$2_0$137
;game.c:663: for(height = 0; height < currentlevel_height; height++)	{
	inc	de
	jr	00116$
00118$:
	C$game.c$697$2_0$136	= .
	.globl	C$game.c$697$2_0$136
;game.c:697: }
	ld	sp, ix
	pop	ix
	C$game.c$697$2_0$136	= .
	.globl	C$game.c$697$2_0$136
	XG$game_displayMinimap$0$0	= .
	.globl	XG$game_displayMinimap$0$0
	ret
	G$game_initLevel$0$0	= .
	.globl	G$game_initLevel$0$0
	C$game.c$699$2_0$143	= .
	.globl	C$game.c$699$2_0$143
;game.c:699: void game_initLevel(uint8_t levelid) {
;	---------------------------------
; Function game_initLevel
; ---------------------------------
_game_initLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$game.c$700$1_0$143	= .
	.globl	C$game.c$700$1_0$143
;game.c:700: memset(&currentlevel, 0, sizeof(struct sokobanlevel));
	ld	de, #_currentlevel+0
	ld	l, e
	ld	h, d
	ld	b, #0x9a
	jr	00104$
00103$:
	ld	(hl), #0x00
	inc	hl
00104$:
	ld	(hl), #0x00
	inc	hl
	djnz	00103$
	C$game.c$701$1_0$143	= .
	.globl	C$game.c$701$1_0$143
;game.c:701: memcpy(&currentlevel, (void*)(LEVELDATA+(sizeof(struct sokobanlevel))*levelid), sizeof(struct sokobanlevel));
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0133
	ldir
	C$game.c$703$1_0$143	= .
	.globl	C$game.c$703$1_0$143
;game.c:703: undo_head = 0;
	ld	hl,#_undo_head + 0
	ld	(hl), #0x00
	C$game.c$704$1_0$143	= .
	.globl	C$game.c$704$1_0$143
;game.c:704: num_undomoves = 0;
	ld	hl,#_num_undomoves + 0
	ld	(hl), #0x00
	C$game.c$705$1_0$143	= .
	.globl	C$game.c$705$1_0$143
;game.c:705: }
	pop	ix
	C$game.c$705$1_0$143	= .
	.globl	C$game.c$705$1_0$143
	XG$game_initLevel$0$0	= .
	.globl	XG$game_initLevel$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_player_data$0_0$0 == .
__xinit__player_data:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x70	; 112	'p'
Fgame$__xinit_box_data$0_0$0 == .
__xinit__box_data:
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0x51	; 81	'Q'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x12	; 18
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x51	; 81	'Q'
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x12	; 18
	.db #0x8a	; 138
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0x12	; 18
	.db #0xee	; 238
	.db #0x00	; 0
Fgame$__xinit_goal_data$0_0$0 == .
__xinit__goal_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x90	; 144
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
Fgame$__xinit_box_ongoal_data$0_0$0 == .
__xinit__box_ongoal_data:
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x2a	; 42
	.db #0x55	; 85	'U'
	.db #0x4a	; 74	'J'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x16	; 22
	.db #0x2a	; 42
	.db #0x54	; 84	'T'
	.db #0xaa	; 170
	.db #0x52	; 82	'R'
	.db #0xa2	; 162
	.db #0x45	; 69	'E'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
	.db #0x2a	; 42
	.db #0x54	; 84	'T'
	.db #0x68	; 104	'h'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0x52	; 82	'R'
	.db #0xaa	; 170
	.db #0x54	; 84	'T'
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0xee	; 238
	.db #0x00	; 0
Fgame$__xinit_wall_data$0_0$0 == .
__xinit__wall_data:
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
Fgame$__xinit_floor_data$0_0$0 == .
__xinit__floor_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
