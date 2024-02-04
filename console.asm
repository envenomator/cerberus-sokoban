;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module console
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _reverse
	.globl _swap
	.globl _strlen
	.globl _strcat
	.globl _abs
	.globl _con_timer_ms
	.globl _con_timer_counter
	.globl _console
	.globl _putchar
	.globl _con_init
	.globl _con_init_timer
	.globl _con_gotoxy
	.globl _con_cls
	.globl _con_putc
	.globl _con_puts
	.globl _con_getc_timer
	.globl _con_getc
	.globl _con_exit
	.globl _con_itoa
	.globl _con_print_timer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$console$0_0$0==.
_console::
	.ds 2
G$con_timer_counter$0_0$0==.
_con_timer_counter::
	.ds 4
G$con_timer_ms$0_0$0==.
_con_timer_ms::
	.ds 2
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
	G$putchar$0$0	= .
	.globl	G$putchar$0$0
	C$console.c$11$0_0$67	= .
	.globl	C$console.c$11$0_0$67
;console.c:11: int putchar(int c) {
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar::
	C$console.c$12$1_0$67	= .
	.globl	C$console.c$12$1_0$67
;console.c:12: con_putc(c);
	ld	hl, #2+0
	add	hl, sp
	ld	b, (hl)
	push	bc
	inc	sp
	call	_con_putc
	inc	sp
	C$console.c$13$1_0$67	= .
	.globl	C$console.c$13$1_0$67
;console.c:13: return c;
	pop	bc
	pop	hl
	push	hl
	push	bc
	C$console.c$14$1_0$67	= .
	.globl	C$console.c$14$1_0$67
;console.c:14: }
	C$console.c$14$1_0$67	= .
	.globl	C$console.c$14$1_0$67
	XG$putchar$0$0	= .
	.globl	XG$putchar$0$0
	ret
	G$con_init$0$0	= .
	.globl	G$con_init$0$0
	C$console.c$16$1_0$68	= .
	.globl	C$console.c$16$1_0$68
;console.c:16: void con_init()
;	---------------------------------
; Function con_init
; ---------------------------------
_con_init::
	C$console.c$18$1_0$68	= .
	.globl	C$console.c$18$1_0$68
;console.c:18: console = VIDEOSTART;
	ld	hl, #0xf800
	ld	(_console), hl
	C$console.c$19$1_0$68	= .
	.globl	C$console.c$19$1_0$68
;console.c:19: return;
	C$console.c$20$1_0$68	= .
	.globl	C$console.c$20$1_0$68
;console.c:20: }
	C$console.c$20$1_0$68	= .
	.globl	C$console.c$20$1_0$68
	XG$con_init$0$0	= .
	.globl	XG$con_init$0$0
	ret
	G$con_init_timer$0$0	= .
	.globl	G$con_init_timer$0$0
	C$console.c$22$1_0$70	= .
	.globl	C$console.c$22$1_0$70
;console.c:22: void con_init_timer(uint8_t init)
;	---------------------------------
; Function con_init_timer
; ---------------------------------
_con_init_timer::
	C$console.c$24$1_0$70	= .
	.globl	C$console.c$24$1_0$70
;console.c:24: con_timer_counter = 0;
	xor	a, a
	ld	iy, #_con_timer_counter
	ld	0 (iy), a
	ld	1 (iy), a
	ld	2 (iy), a
	ld	3 (iy), a
	C$console.c$25$1_0$70	= .
	.globl	C$console.c$25$1_0$70
;console.c:25: con_timer_ms = init;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #_con_timer_ms
	ld	0 (iy), a
	ld	1 (iy), #0x00
	C$console.c$26$1_0$70	= .
	.globl	C$console.c$26$1_0$70
;console.c:26: return;
	C$console.c$27$1_0$70	= .
	.globl	C$console.c$27$1_0$70
;console.c:27: }
	C$console.c$27$1_0$70	= .
	.globl	C$console.c$27$1_0$70
	XG$con_init_timer$0$0	= .
	.globl	XG$con_init_timer$0$0
	ret
	G$con_gotoxy$0$0	= .
	.globl	G$con_gotoxy$0$0
	C$console.c$29$1_0$72	= .
	.globl	C$console.c$29$1_0$72
;console.c:29: void con_gotoxy(unsigned char x, unsigned char y)
;	---------------------------------
; Function con_gotoxy
; ---------------------------------
_con_gotoxy::
	C$console.c$31$1_0$72	= .
	.globl	C$console.c$31$1_0$72
;console.c:31: console = VIDEOSTART + (y*SCREENWIDTH) + x;
	ld	hl, #3+0
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	a, h
	add	a, #0xf8
	ld	b, a
	ld	a, c
	ld	hl, #2
	add	hl, sp
	ld	iy, #_console
	add	a, (hl)
	ld	0 (iy), a
	ld	a, b
	adc	a, #0x00
	inc	iy
	ld	0 (iy), a
	C$console.c$32$1_0$72	= .
	.globl	C$console.c$32$1_0$72
;console.c:32: return;
	C$console.c$33$1_0$72	= .
	.globl	C$console.c$33$1_0$72
;console.c:33: }
	C$console.c$33$1_0$72	= .
	.globl	C$console.c$33$1_0$72
	XG$con_gotoxy$0$0	= .
	.globl	XG$con_gotoxy$0$0
	ret
	G$con_cls$0$0	= .
	.globl	G$con_cls$0$0
	C$console.c$35$1_0$73	= .
	.globl	C$console.c$35$1_0$73
;console.c:35: void con_cls()
;	---------------------------------
; Function con_cls
; ---------------------------------
_con_cls::
	C$console.c$37$2_0$74	= .
	.globl	C$console.c$37$2_0$74
;console.c:37: for(console = VIDEOSTART; console < VIDEOEND; console++)
	ld	hl, #0xf800
	ld	(_console), hl
00103$:
	ld	iy, #_console
	ld	a, 0 (iy)
	sub	a, #0xb0
	ld	a, 1 (iy)
	sbc	a, #0xfc
	jr	NC,00101$
	C$console.c$39$3_0$75	= .
	.globl	C$console.c$39$3_0$75
;console.c:39: *console = ' ';
	ld	hl, (_console)
	ld	(hl), #0x20
	C$console.c$37$2_0$74	= .
	.globl	C$console.c$37$2_0$74
;console.c:37: for(console = VIDEOSTART; console < VIDEOEND; console++)
	inc	0 (iy)
	jr	NZ,00103$
	inc	1 (iy)
	jr	00103$
00101$:
	C$console.c$41$1_0$73	= .
	.globl	C$console.c$41$1_0$73
;console.c:41: console = VIDEOSTART;
	ld	hl, #0xf800
	ld	(_console), hl
	C$console.c$42$1_0$73	= .
	.globl	C$console.c$42$1_0$73
;console.c:42: return;
	C$console.c$43$1_0$73	= .
	.globl	C$console.c$43$1_0$73
;console.c:43: }
	C$console.c$43$1_0$73	= .
	.globl	C$console.c$43$1_0$73
	XG$con_cls$0$0	= .
	.globl	XG$con_cls$0$0
	ret
	G$con_putc$0$0	= .
	.globl	G$con_putc$0$0
	C$console.c$44$1_0$77	= .
	.globl	C$console.c$44$1_0$77
;console.c:44: void con_putc(char c)
;	---------------------------------
; Function con_putc
; ---------------------------------
_con_putc::
	C$console.c$46$1_0$77	= .
	.globl	C$console.c$46$1_0$77
;console.c:46: *console = c;
	ld	hl, (_console)
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	C$console.c$47$1_0$77	= .
	.globl	C$console.c$47$1_0$77
;console.c:47: console++;
	ld	iy, #_console
	inc	0 (iy)
	jr	NZ,00110$
	inc	1 (iy)
00110$:
	C$console.c$48$1_0$77	= .
	.globl	C$console.c$48$1_0$77
;console.c:48: if(console == VIDEOEND) 
	ld	a, 0 (iy)
	sub	a, #0xb0
	ret	NZ
	ld	a, 1 (iy)
	sub	a, #0xfc
	ret	NZ
	C$console.c$49$1_0$77	= .
	.globl	C$console.c$49$1_0$77
;console.c:49: console = VIDEOSTART;
	ld	hl, #0xf800
	ld	(_console), hl
	C$console.c$50$1_0$77	= .
	.globl	C$console.c$50$1_0$77
;console.c:50: return;
	C$console.c$51$1_0$77	= .
	.globl	C$console.c$51$1_0$77
;console.c:51: }
	C$console.c$51$1_0$77	= .
	.globl	C$console.c$51$1_0$77
	XG$con_putc$0$0	= .
	.globl	XG$con_putc$0$0
	ret
	G$con_puts$0$0	= .
	.globl	G$con_puts$0$0
	C$console.c$53$1_0$79	= .
	.globl	C$console.c$53$1_0$79
;console.c:53: void con_puts(const char *s)
;	---------------------------------
; Function con_puts
; ---------------------------------
_con_puts::
	C$console.c$55$1_0$79	= .
	.globl	C$console.c$55$1_0$79
;console.c:55: while(*s)
	pop	de
	pop	bc
	push	bc
	push	de
00101$:
	ld	a, (bc)
	or	a, a
	ret	Z
	C$console.c$57$2_0$80	= .
	.globl	C$console.c$57$2_0$80
;console.c:57: con_putc(*s);
	push	bc
	push	af
	inc	sp
	call	_con_putc
	inc	sp
	pop	bc
	C$console.c$58$2_0$80	= .
	.globl	C$console.c$58$2_0$80
;console.c:58: s++;
	inc	bc
	C$console.c$60$1_0$79	= .
	.globl	C$console.c$60$1_0$79
;console.c:60: return;
	C$console.c$61$1_0$79	= .
	.globl	C$console.c$61$1_0$79
;console.c:61: }
	C$console.c$61$1_0$79	= .
	.globl	C$console.c$61$1_0$79
	XG$con_puts$0$0	= .
	.globl	XG$con_puts$0$0
	jr	00101$
	G$con_getc_timer$0$0	= .
	.globl	G$con_getc_timer$0$0
	C$console.c$63$1_0$82	= .
	.globl	C$console.c$63$1_0$82
;console.c:63: char con_getc_timer(uint16_t threshold)
;	---------------------------------
; Function con_getc_timer
; ---------------------------------
_con_getc_timer::
	C$console.c$65$1_0$82	= .
	.globl	C$console.c$65$1_0$82
;console.c:65: while(*(BIOS_OUTBOXFLAG) == 0)
00105$:
	ld	a, (#0x0200)
	or	a, a
	jr	NZ,00107$
	C$console.c$67$2_0$83	= .
	.globl	C$console.c$67$2_0$83
;console.c:67: con_timer_counter++;
	ld	iy, #_con_timer_counter
	inc	0 (iy)
	jr	NZ,00130$
	inc	1 (iy)
	jr	NZ,00130$
	inc	2 (iy)
	jr	NZ,00130$
	inc	3 (iy)
00130$:
	C$console.c$68$2_0$83	= .
	.globl	C$console.c$68$2_0$83
;console.c:68: if(con_timer_counter > threshold)
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #0x0000
	ld	a, c
	ld	iy, #_con_timer_counter
	sub	a, 0 (iy)
	ld	a, b
	sbc	a, 1 (iy)
	ld	a, e
	sbc	a, 2 (iy)
	ld	a, d
	sbc	a, 3 (iy)
	jr	NC,00104$
	C$console.c$70$3_0$84	= .
	.globl	C$console.c$70$3_0$84
;console.c:70: con_timer_counter = 0;
	xor	a, a
	ld	0 (iy), a
	ld	1 (iy), a
	ld	2 (iy), a
	ld	3 (iy), a
	C$console.c$71$3_0$84	= .
	.globl	C$console.c$71$3_0$84
;console.c:71: con_timer_ms--; 
	ld	hl, (_con_timer_ms)
	dec	hl
	ld	(_con_timer_ms), hl
	C$console.c$72$3_0$84	= .
	.globl	C$console.c$72$3_0$84
;console.c:72: if(con_timer_ms == 0)
	ld	iy, #_con_timer_ms
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00104$
	C$console.c$74$4_0$85	= .
	.globl	C$console.c$74$4_0$85
;console.c:74: con_timer_ms = 0;
	ld	hl, #0x0000
	ld	(_con_timer_ms), hl
	C$console.c$75$4_0$85	= .
	.globl	C$console.c$75$4_0$85
;console.c:75: con_print_timer();
	call	_con_print_timer
	C$console.c$76$4_0$85	= .
	.globl	C$console.c$76$4_0$85
;console.c:76: *(BIOS_OUTBOXDATA) = 'Q';
	ld	hl, #0x0201
	ld	(hl), #0x51
	C$console.c$77$4_0$85	= .
	.globl	C$console.c$77$4_0$85
;console.c:77: break;
	jr	00107$
00104$:
	C$console.c$80$2_0$83	= .
	.globl	C$console.c$80$2_0$83
;console.c:80: con_print_timer();
	call	_con_print_timer
	jr	00105$
00107$:
	C$console.c$82$1_0$82	= .
	.globl	C$console.c$82$1_0$82
;console.c:82: *(BIOS_OUTBOXFLAG) = 0;         // acknowlege reception
	ld	hl, #0x0200
	ld	(hl), #0x00
	C$console.c$83$1_0$82	= .
	.globl	C$console.c$83$1_0$82
;console.c:83: return *(BIOS_OUTBOXDATA);      // return the data slot
	ld	l, #0x01
	ld	l, (hl)
	C$console.c$84$1_0$82	= .
	.globl	C$console.c$84$1_0$82
;console.c:84: }
	C$console.c$84$1_0$82	= .
	.globl	C$console.c$84$1_0$82
	XG$con_getc_timer$0$0	= .
	.globl	XG$con_getc_timer$0$0
	ret
	G$con_getc$0$0	= .
	.globl	G$con_getc$0$0
	C$console.c$86$1_0$86	= .
	.globl	C$console.c$86$1_0$86
;console.c:86: char con_getc()
;	---------------------------------
; Function con_getc
; ---------------------------------
_con_getc::
	C$console.c$88$1_0$86	= .
	.globl	C$console.c$88$1_0$86
;console.c:88: while(*(BIOS_OUTBOXFLAG) == 0); // blocked wait for the mailbox flag
00101$:
	ld	a, (#0x0200)
	or	a, a
	jr	Z,00101$
	C$console.c$89$1_0$86	= .
	.globl	C$console.c$89$1_0$86
;console.c:89: *(BIOS_OUTBOXFLAG) = 0;         // acknowlege reception
	ld	hl, #0x0200
	ld	(hl), #0x00
	C$console.c$90$1_0$86	= .
	.globl	C$console.c$90$1_0$86
;console.c:90: return *(BIOS_OUTBOXDATA);      // return the data slot
	ld	l, #0x01
	ld	l, (hl)
	C$console.c$91$1_0$86	= .
	.globl	C$console.c$91$1_0$86
;console.c:91: }
	C$console.c$91$1_0$86	= .
	.globl	C$console.c$91$1_0$86
	XG$con_getc$0$0	= .
	.globl	XG$con_getc$0$0
	ret
	G$con_exit$0$0	= .
	.globl	G$con_exit$0$0
	C$console.c$93$1_0$87	= .
	.globl	C$console.c$93$1_0$87
;console.c:93: void con_exit()
;	---------------------------------
; Function con_exit
; ---------------------------------
_con_exit::
	C$console.c$95$1_0$87	= .
	.globl	C$console.c$95$1_0$87
;console.c:95: *(BIOS_INBOXFLAG) = 0x7F;       // request to exit();
	ld	hl, #0x0202
	ld	(hl), #0x7f
	C$console.c$96$1_0$87	= .
	.globl	C$console.c$96$1_0$87
;console.c:96: while(1);
00102$:
	C$console.c$97$1_0$87	= .
	.globl	C$console.c$97$1_0$87
;console.c:97: }
	C$console.c$97$1_0$87	= .
	.globl	C$console.c$97$1_0$87
	XG$con_exit$0$0	= .
	.globl	XG$con_exit$0$0
	jr	00102$
	G$swap$0$0	= .
	.globl	G$swap$0$0
	C$console.c$99$1_0$89	= .
	.globl	C$console.c$99$1_0$89
;console.c:99: void swap(char *x, char *y) {
;	---------------------------------
; Function swap
; ---------------------------------
_swap::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$console.c$100$1_0$89	= .
	.globl	C$console.c$100$1_0$89
;console.c:100: char t = *x; *x = *y; *y = t;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	a, (de)
	ld	-1 (ix), a
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	a, (bc)
	ld	(de), a
	ld	a, -1 (ix)
	ld	(bc), a
	C$console.c$101$1_0$89	= .
	.globl	C$console.c$101$1_0$89
;console.c:101: }
	inc	sp
	pop	ix
	C$console.c$101$1_0$89	= .
	.globl	C$console.c$101$1_0$89
	XG$swap$0$0	= .
	.globl	XG$swap$0$0
	ret
	G$reverse$0$0	= .
	.globl	G$reverse$0$0
	C$console.c$104$1_0$91	= .
	.globl	C$console.c$104$1_0$91
;console.c:104: char* reverse(char *buffer, int i, int j)
;	---------------------------------
; Function reverse
; ---------------------------------
_reverse::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	C$console.c$106$1_0$91	= .
	.globl	C$console.c$106$1_0$91
;console.c:106: while (i < j) {
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	ld	c, 6 (ix)
	ld	b, 7 (ix)
00101$:
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	P, 00103$
	C$console.c$107$2_0$92	= .
	.globl	C$console.c$107$2_0$92
;console.c:107: swap(&buffer[i++], &buffer[j--]);
	inc	sp
	inc	sp
	push	de
	dec	de
	ld	a, -2 (ix)
	add	a, 4 (ix)
	ld	l, a
	ld	a, -1 (ix)
	adc	a, 5 (ix)
	ld	h, a
	push	bc
	pop	iy
	inc	bc
	push	bc
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	add	iy, bc
	push	de
	push	hl
	push	iy
	call	_swap
	pop	af
	pop	af
	pop	de
	pop	bc
	jr	00101$
00103$:
	C$console.c$110$1_0$91	= .
	.globl	C$console.c$110$1_0$91
;console.c:110: return buffer;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	C$console.c$111$1_0$91	= .
	.globl	C$console.c$111$1_0$91
;console.c:111: }
	ld	sp, ix
	pop	ix
	C$console.c$111$1_0$91	= .
	.globl	C$console.c$111$1_0$91
	XG$reverse$0$0	= .
	.globl	XG$reverse$0$0
	ret
	G$con_itoa$0$0	= .
	.globl	G$con_itoa$0$0
	C$console.c$114$1_0$94	= .
	.globl	C$console.c$114$1_0$94
;console.c:114: char* con_itoa(int value, char* buffer, int base)
;	---------------------------------
; Function con_itoa
; ---------------------------------
_con_itoa::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	C$console.c$117$1_0$94	= .
	.globl	C$console.c$117$1_0$94
;console.c:117: if (base < 2 || base > 32) {
	ld	a, 8 (ix)
	sub	a, #0x02
	ld	a, 9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00101$
	ld	a, #0x20
	cp	a, 8 (ix)
	ld	a, #0x00
	sbc	a, 9 (ix)
	jp	PO, 00166$
	xor	a, #0x80
00166$:
	jp	P, 00102$
00101$:
	C$console.c$118$2_0$95	= .
	.globl	C$console.c$118$2_0$95
;console.c:118: return buffer;
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	jp	00119$
00102$:
	C$console.c$122$1_1$96	= .
	.globl	C$console.c$122$1_1$96
;console.c:122: int n = abs(value);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_abs
	pop	af
	C$console.c$124$1_1$96	= .
	.globl	C$console.c$124$1_1$96
;console.c:124: int i = 0;
	ld	bc, #0x0000
	C$console.c$125$1_1$96	= .
	.globl	C$console.c$125$1_1$96
;console.c:125: while (n)
00107$:
	C$console.c$130$1_1$94	= .
	.globl	C$console.c$130$1_1$94
;console.c:130: buffer[i++] = 65 + (r - 10);
	ld	a, c
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, b
	adc	a, #0x00
	ld	-1 (ix), a
	C$console.c$125$1_1$96	= .
	.globl	C$console.c$125$1_1$96
;console.c:125: while (n)
	ld	a, h
	or	a, l
	jr	Z,00109$
	C$console.c$127$1_1$94	= .
	.globl	C$console.c$127$1_1$94
;console.c:127: int r = n % base;
	push	hl
	push	bc
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	pop	hl
	C$console.c$130$1_1$94	= .
	.globl	C$console.c$130$1_1$94
;console.c:130: buffer[i++] = 65 + (r - 10);
	ld	-3 (ix), e
	C$console.c$129$2_1$97	= .
	.globl	C$console.c$129$2_1$97
;console.c:129: if (r >= 10) {
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00105$
	C$console.c$130$3_1$98	= .
	.globl	C$console.c$130$3_1$98
;console.c:130: buffer[i++] = 65 + (r - 10);
	push	bc
	pop	iy
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	add	iy, de
	ld	a, -3 (ix)
	add	a, #0x37
	ld	0 (iy), a
	jr	00106$
00105$:
	C$console.c$133$3_1$99	= .
	.globl	C$console.c$133$3_1$99
;console.c:133: buffer[i++] = 48 + r;
	push	bc
	pop	iy
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	add	iy, de
	ld	a, -3 (ix)
	add	a, #0x30
	ld	0 (iy), a
00106$:
	C$console.c$136$1_1$94	= .
	.globl	C$console.c$136$1_1$94
;console.c:136: n = n / base;
	push	bc
	ld	e, 8 (ix)
	ld	d, 9 (ix)
	push	de
	push	hl
	call	__divsint
	pop	af
	pop	af
	pop	bc
	jr	00107$
00109$:
	C$console.c$140$1_1$96	= .
	.globl	C$console.c$140$1_1$96
;console.c:140: if (i == 0) {
	ld	a, b
	or	a, c
	jr	NZ,00111$
	C$console.c$141$2_1$100	= .
	.globl	C$console.c$141$2_1$100
;console.c:141: buffer[i++] = '0';
	ld	e, c
	ld	d, b
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	add	hl, de
	ld	(hl), #0x30
00111$:
	C$console.c$147$1_1$96	= .
	.globl	C$console.c$147$1_1$96
;console.c:147: if (value < 0 && base == 10) {
	bit	7, 5 (ix)
	jr	Z,00113$
	ld	a, 8 (ix)
	sub	a, #0x0a
	or	a, 9 (ix)
	jr	NZ,00113$
	C$console.c$148$2_1$101	= .
	.globl	C$console.c$148$2_1$101
;console.c:148: buffer[i++] = '-';
	ld	e, c
	ld	d, b
	inc	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	add	hl, de
	ld	(hl), #0x2d
00113$:
	C$console.c$151$1_1$96	= .
	.globl	C$console.c$151$1_1$96
;console.c:151: buffer[i] = '\0'; // null terminate string
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	add	hl, bc
	ld	(hl), #0x00
	C$console.c$153$1_1$96	= .
	.globl	C$console.c$153$1_1$96
;console.c:153: n = strlen(buffer);
	push	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_strlen
	pop	af
	pop	bc
	C$console.c$154$1_1$96	= .
	.globl	C$console.c$154$1_1$96
;console.c:154: switch(n)
	ld	a, l
	dec	a
	or	a, h
	jr	Z,00115$
	ld	a, l
	sub	a, #0x02
	or	a, h
	jr	Z,00116$
	jr	00118$
	C$console.c$156$2_1$102	= .
	.globl	C$console.c$156$2_1$102
;console.c:156: case 1:
00115$:
	C$console.c$157$2_1$102	= .
	.globl	C$console.c$157$2_1$102
;console.c:157: strcat(buffer,"  ");
	push	bc
	ld	hl, #___str_0
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_strcat
	pop	af
	pop	af
	pop	bc
	C$console.c$158$2_1$102	= .
	.globl	C$console.c$158$2_1$102
;console.c:158: i += 2;
	inc	bc
	inc	bc
	C$console.c$159$2_1$102	= .
	.globl	C$console.c$159$2_1$102
;console.c:159: break;
	jr	00118$
	C$console.c$160$2_1$102	= .
	.globl	C$console.c$160$2_1$102
;console.c:160: case 2:
00116$:
	C$console.c$161$2_1$102	= .
	.globl	C$console.c$161$2_1$102
;console.c:161: strcat(buffer," ");
	push	bc
	ld	hl, #___str_1
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_strcat
	pop	af
	pop	af
	pop	bc
	C$console.c$162$2_1$102	= .
	.globl	C$console.c$162$2_1$102
;console.c:162: i += 1;
	inc	bc
	C$console.c$166$1_1$96	= .
	.globl	C$console.c$166$1_1$96
;console.c:166: }
00118$:
	C$console.c$168$1_1$96	= .
	.globl	C$console.c$168$1_1$96
;console.c:168: return reverse(buffer, 0, i - 1);
	dec	bc
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_reverse
	pop	af
	pop	af
	pop	af
00119$:
	C$console.c$169$1_1$94	= .
	.globl	C$console.c$169$1_1$94
;console.c:169: }
	ld	sp, ix
	pop	ix
	C$console.c$169$1_1$94	= .
	.globl	C$console.c$169$1_1$94
	XG$con_itoa$0$0	= .
	.globl	XG$con_itoa$0$0
	ret
Fconsole$__str_0$0_0$0 == .
___str_0:
	.ascii "  "
	.db 0x00
Fconsole$__str_1$0_0$0 == .
___str_1:
	.ascii " "
	.db 0x00
	G$con_print_timer$0$0	= .
	.globl	G$con_print_timer$0$0
	C$console.c$171$1_1$103	= .
	.globl	C$console.c$171$1_1$103
;console.c:171: void con_print_timer()
;	---------------------------------
; Function con_print_timer
; ---------------------------------
_con_print_timer::
	ld	hl, #-40
	add	hl, sp
	ld	sp, hl
	C$console.c$175$1_0$103	= .
	.globl	C$console.c$175$1_0$103
;console.c:175: con_gotoxy(34,10);
	ld	de, #0x0a22
	push	de
	call	_con_gotoxy
	pop	af
	C$console.c$176$1_0$103	= .
	.globl	C$console.c$176$1_0$103
;console.c:176: con_itoa(con_timer_ms, msg, 10);
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	ld	hl, (_con_timer_ms)
	push	hl
	call	_con_itoa
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	call	_con_puts
	pop	af
	C$console.c$178$1_0$103	= .
	.globl	C$console.c$178$1_0$103
;console.c:178: }   
	ld	hl, #40
	add	hl, sp
	ld	sp, hl
	C$console.c$178$1_0$103	= .
	.globl	C$console.c$178$1_0$103
	XG$con_print_timer$0$0	= .
	.globl	XG$con_print_timer$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
