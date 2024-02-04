#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include "game.h"
#include "console.h"

struct undoitem undomove[UNDOBUFFERSIZE];
uint8_t undo_head;
uint8_t num_undomoves;

uint32_t bitmapbuffer[BITMAPSIZE];	// will hold one bitmap at a time, to transmit to the VDU
uint8_t sprites[MAXHEIGHT][MAXWIDTH]; // will contain all sprites on-screen
struct sokobanlevel currentlevel;	// will contain the currentlevel;
uint8_t spritenumber;					// the current number of sprites in the current level

uint8_t player_data[] = {
    0x1,0x3,0x4,0xA,0x8,0x5,0x4,0x3,0x80,0xC0,0x20,0x50,0x10,0xA0,0x20,0xC0,0x6,0xF,0xE,0x1B,0x3,0x2,0x6,0xE,0x60,0xF0,0x70,0xD8,0xC0,0x40,0x60,0x70
};
uint8_t box_data[] = {
    0x0,0x77,0x48,0x44,0x22,0x51,0x48,0x44,0x0,0xEE,0x12,0x22,0x44,0x8A,0x12,0x22,0x44,0x48,0x51,0x22,0x44,0x48,0x77,0x0,0x22,0x12,0x8A,0x44,0x22,0x12,0xEE,0x0
};
uint8_t goal_data[] = {
    0x0,0x0,0x4,0x2,0x1,0x20,0x10,0x9,0x0,0x0,0x20,0x40,0x80,0x4,0x8,0x90,0x9,0x10,0x20,0x1,0x2,0x4,0x0,0x0,0x90,0x8,0x4,0x80,0x40,0x20,0x0,0x0
};
uint8_t box_ongoal_data[] = {
    0x0,0x77,0x68,0x54,0x2A,0x55,0x4A,0x45,0x0,0xEE,0x16,0x2A,0x54,0xAA,0x52,0xA2,0x45,0x4A,0x55,0x2A,0x54,0x68,0x77,0x0,0xA2,0x52,0xAA,0x54,0x2A,0x16,0xEE,0x0
};
uint8_t wall_data[] = {
    0xF7,0xF7,0xF7,0x0,0x7F,0x7F,0x7F,0x0,0xF7,0xF7,0xF7,0x0,0x7F,0x7F,0x7F,0x0,0xF7,0xF7,0xF7,0x0,0x7F,0x7F,0x7F,0x0,0xF7,0xF7,0xF7,0x0,0x7F,0x7F,0x7F,0x0
};
uint8_t floor_data[] = {
    0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
};

void debug_print_playfieldText(void) {
/*
	uint16_t width, height;
	char c;
	
	for(height = 0; height < currentlevel.height; height++) {
		for(width = 0; width < currentlevel.width; width++) {
			c = currentlevel.data[height][width];
			printf("%c",c?c:' ');
		}
		printf(" ");
		for(width = 0; width < currentlevel.width; width++) {
			c = sprites[height][width] + '0';
			if(c > '9') c = 'X';
			printf("%c",c);
		}
		printf("\n\r");
	}
*/
}

void game_sendTileData(void) {
	chardefs *ptr = (chardefs *)0xf000;

	memcpy(ptr[TILE_WALL], wall_data,8);
    memcpy(ptr[TILE_PLAYER],player_data,8);
	memcpy(ptr[TILE_PLAYERONGOAL], player_data, 8);
	memcpy(ptr[TILE_BOX], box_data, 8);
	memcpy(ptr[TILE_BOXONGOAL], box_ongoal_data, 8);
	memcpy(ptr[TILE_GOAL], goal_data, 8);
	memcpy(ptr[TILE_FLOOR], floor_data, 8);	
	return;
}

void game_resetSprites(void)
{
	/*
	uint8_t n;
	
	// disable all sprites
	for(n = 0; n < spritenumber; n++) {
		vdp_spriteSelect(n);
		vdp_spriteHide(n);
		vdp_spriteSetFrame(n,0);
		vdp_spriteClearFramesSelected();
	}
	vdp_spriteWaitRefresh();
	vdp_spriteActivateTotal(0);
	spritenumber = 0;

	// reset all sprite positions and clear out any sprites
	memset(sprites, 255, MAXHEIGHT*MAXWIDTH);

	vdp_spriteWaitRefresh();
	*/
	return;
}

bool canmove(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
	bool can = false;
	uint8_t n1, n2;
	
	n1 = currentlevel.data[yn1][xn1];
	n2 = currentlevel.data[yn2][xn2];
	
	switch(n1) {
		case CHAR_WALL:
			return false;
			break;
		case CHAR_FLOOR:
		case CHAR_GOAL:
			return true;
			break;
	}
	// either BOX or BOXONGOAL next to player
	switch(n2) {
		case CHAR_WALL:
			return false;
			break;
		case CHAR_BOX:
		case CHAR_BOXONGOAL:
			return false;
			break;
	}
	// only FLOOR or empty GOAL remaining at n2
	return true;
}

void move_sprites(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
	// move can happen, no need to check again
	uint8_t spriteid = sprites[yn1][xn1];
	uint8_t n;
	int16_t dx, dy;
	uint8_t n2;
		
	dx = (xn2 - xn1)*BITMAP_WIDTH;
	dy = (yn2 - yn1)*BITMAP_HEIGHT;
	
	if(spriteid != NOSPRITE) {
		//vdp_spriteMoveBy(spriteid, dx, dy);
	}
	//vdp_spriteMoveBy(SPRITE_PLAYER, dx, dy);
	//vdp_spriteWaitRefresh();

	// set destination sprite frame
	if(spriteid != NOSPRITE) {
		// Check if the sprite moved to a goal or floor
		n2 = currentlevel.data[yn2][xn2];
		switch(n2) {
			case CHAR_FLOOR:
				//vdp_spriteSetFrame(spriteid, 0);
				//vdp_spriteWaitRefresh();
				break;
			case CHAR_GOAL:
				//vdp_spriteSetFrame(spriteid, 1);
				//vdp_spriteWaitRefresh();
				break;
			default:
				break;
		}
	}
	// update sprite number matrix
	if(spriteid != NOSPRITE) {
		// player shoves a box here
		sprites[yn2][xn2] = sprites[yn1][xn1];
	}
	sprites[yn1][xn1] = NOSPRITE; // player's sprite isn't handled by using a box spriteid
	sprites[currentlevel.ypos][currentlevel.xpos] = NOSPRITE;
}

void undomove_sprites(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
	// move can happen, no need to check again
	uint8_t spriteid = sprites[yn1][xn1];
	uint8_t n;
	int16_t dx, dy;
	uint8_t n2;
		
	dx = (xn2 - xn1)*BITMAP_WIDTH;
	dy = (yn2 - yn1)*BITMAP_HEIGHT;
	
	if((undomove[undo_head].pushed) && (spriteid != NOSPRITE)) {
		//vdp_spriteMoveBy(spriteid, dx, dy);
	}
	//vdp_spriteMoveBy(SPRITE_PLAYER, dx, dy);
	//vdp_spriteWaitRefresh();

	// set destination sprite frame
	if((undomove[undo_head].pushed) && (spriteid != NOSPRITE)) {
		// Check if the sprite moved to a goal or floor
		n2 = currentlevel.data[yn2][xn2];
		switch(n2) {
			case CHAR_PLAYER:
				//vdp_spriteSetFrame(spriteid, 0);
				//vdp_spriteWaitRefresh();
				break;
			case CHAR_PLAYERONGOAL:
				//vdp_spriteSetFrame(spriteid, 1);
				//vdp_spriteWaitRefresh();
				break;
			default:
				break;
		}
	}
	// update sprite number matrix
	if(undomove[undo_head].pushed) {
		if(spriteid != NOSPRITE) {
			// player shoved a box here
			sprites[yn2][xn2] = sprites[yn1][xn1];
		}
		sprites[yn1][xn1] = NOSPRITE; // player's sprite isn't handled by using a box spriteid			
	}
}

void move_updatelevel(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2) {
	// move can happen, no need to check again
	uint8_t n1, n2;
	bool onlyplayermoves;
	
	// move n1 => n2
	n1 = currentlevel.data[yn1][xn1];
	n2 = currentlevel.data[yn2][xn2];

	switch(n1) {
		case CHAR_FLOOR:
			onlyplayermoves = true;
			currentlevel.data[yn1][xn1] = CHAR_PLAYER;
			break;
		case CHAR_GOAL:
			onlyplayermoves = true;
			currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;
			break;
		default:
			onlyplayermoves = false;
			break;
	}
	if(!onlyplayermoves) {
		switch(n2) {
			case CHAR_FLOOR:
				currentlevel.data[yn2][xn2] = CHAR_BOX;
				break;
			case CHAR_GOAL:
				currentlevel.data[yn2][xn2] = CHAR_BOXONGOAL;
				currentlevel.goalstaken++;
				break;
			default:
				break; // ignore the rest
		}
		switch(n1) {
			case CHAR_BOX:
				currentlevel.data[yn1][xn1] = CHAR_PLAYER;				
				break;
			case CHAR_BOXONGOAL:
				currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;				
				currentlevel.goalstaken--;
				break;
			case CHAR_GOAL:
				currentlevel.data[yn1][xn1] = CHAR_PLAYERONGOAL;
				break;
		}
	}
	
	
	// check where the player was standing on
	if(currentlevel.data[currentlevel.ypos][currentlevel.xpos] == CHAR_PLAYERONGOAL) currentlevel.data[currentlevel.ypos][currentlevel.xpos] = CHAR_GOAL;
	else currentlevel.data[currentlevel.ypos][currentlevel.xpos] = CHAR_FLOOR;
	
	// update player position
	currentlevel.xpos = xn1;
	currentlevel.ypos = yn1;
}

void undomove_updatelevel(uint16_t xn1, uint16_t yn1, uint16_t xn2, uint16_t yn2, uint16_t xn3, uint16_t yn3) {
	uint8_t n1, n2, n3;
	
	// move n1 => n2 => n3
	n1 = currentlevel.data[yn1][xn1]; // Source / from
	n2 = currentlevel.data[yn2][xn2]; // This is the curent player's position
	n3 = currentlevel.data[yn3][xn3]; // Destination / to
	
	switch(n3) {
		case CHAR_FLOOR:
			currentlevel.data[yn3][xn3] = CHAR_PLAYER;
			break;
		case CHAR_GOAL:
			currentlevel.data[yn3][xn3] = CHAR_PLAYERONGOAL;
			break;
		default:
			break;
	}
	
	if(undomove[undo_head].pushed) {
		switch(n1) {
			case CHAR_BOX:
				currentlevel.data[yn1][xn1] = CHAR_FLOOR;
				break;
			case CHAR_BOXONGOAL:
				currentlevel.data[yn1][xn1] = CHAR_GOAL;
				currentlevel.goalstaken--;
				break;
			default:
				break;
		}
		switch(n2) { // revert push to box
			case CHAR_PLAYERONGOAL:
				currentlevel.data[yn2][xn2] = CHAR_BOXONGOAL;
				currentlevel.goalstaken++;
				break;
			default:
				currentlevel.data[yn2][xn2] = CHAR_BOX;
				break;
		}
	}
	else { // only the player switched position, nothing was pushed
		switch(n2) {
			case CHAR_PLAYERONGOAL:
				currentlevel.data[yn2][xn2] = CHAR_GOAL;
				break;
			default:
				currentlevel.data[yn2][xn2] = CHAR_FLOOR;
				break;
		}
	}
	
	// update player position
	currentlevel.xpos = xn3;
	currentlevel.ypos = yn3;
}

void game_handleUndoMove(void) {
	int16_t xn1 = 0, xn2 = 0, yn1 = 0, yn2 = 0, xn3 = 0, yn3 = 0;
	
	if(num_undomoves) {
		xn2 = currentlevel.xpos;
		yn2 = currentlevel.ypos;

		// pop one move off circular buffer
		if(undo_head) undo_head--;
		else undo_head = UNDOBUFFERSIZE-1;		
		// undo_head no points to previous move				
		
		switch(undomove[undo_head].movekey) {
			case 0x8: // undo LEFT
				yn1 = yn2;
				yn3 = yn2;
				xn1 = xn2 - 1;
				xn3 = xn2 + 1;
				break;
			case 0xb: // undo UP
				xn1 = xn2;
				xn3 = xn2;
				yn1 = yn2 - 1;
				yn3 = yn2 + 1;
				break;
			case 0xa: // undo DOWN
				xn1 = xn2;
				xn3 = xn2;
				yn1 = yn2 + 1;
				yn3 = yn2 - 1;
				break;
			case 0x15: // undo RIGHT
				yn1 = yn2;
				yn3 = yn2;
				xn1 = xn2 + 1;
				xn3 = xn2 - 1;
				break;
		}
		undomove_sprites(xn1,yn1,xn2,yn2);			
		undomove_updatelevel(xn1, yn1, xn2, yn2, xn3, yn3);
		
		num_undomoves--;
	}
}

bool game_handleKey(char key) {
	bool done = false;
	bool move = false;
	int16_t	xn1 = 0,xn2 = 0,yn1 = 0,yn2 = 0;
	
	switch(key) {
		case 0x8: // LEFT
			xn1 = currentlevel.xpos - 1;
			yn1 = currentlevel.ypos;
			xn2 = currentlevel.xpos - 2;
			yn2 = currentlevel.ypos;
			move = true;
			break;
		case 0xb:
			xn1 = currentlevel.xpos;
			yn1 = currentlevel.ypos - 1;
			xn2 = currentlevel.xpos;
			yn2 = currentlevel.ypos - 2;
			move = true;
			break;
		case 0xa:
			xn1 = currentlevel.xpos;
			yn1 = currentlevel.ypos + 1;
			xn2 = currentlevel.xpos;
			yn2 = currentlevel.ypos + 2;
			move = true;
			break;
		case 0x15: // RIGHT
			xn1 = currentlevel.xpos + 1;
			yn1 = currentlevel.ypos;
			xn2 = currentlevel.xpos + 2;
			yn2 = currentlevel.ypos;
			move = true;
			break;
		default:
			move = false;
			break;
	}
	if(move) {
		if(canmove(xn1,yn1,xn2,yn2)) {
			undomove[undo_head].movekey = key;
			undomove[undo_head].pushed = (currentlevel.data[yn1][xn1] == CHAR_BOX) || (currentlevel.data[yn1][xn1] == CHAR_BOXONGOAL);
			// rotate buffer always
			if(++undo_head == UNDOBUFFERSIZE) undo_head = 0;
			// maximize number of undo
			if(++num_undomoves > UNDOBUFFERSIZE) num_undomoves = UNDOBUFFERSIZE;
			
			move_sprites(xn1,yn1,xn2,yn2);
			move_updatelevel(xn1,yn1,xn2,yn2);
			done = (currentlevel.goals == currentlevel.goalstaken);
		}
	}
	return done;
}

char game_getResponse(char *message, char option1, char option2) {
	uint8_t n;
	uint8_t len = strlen(message);
	uint8_t start = (80 - len) / 2;
	char ret = 0;
	
	
	// vertical spacing
	for(n = start - 1; n < (start+len+1); n++) {
		//con_gotoxy(n,27);
		//putch(' ');
		//con_gotoxy(n,29);
		//putch(' ');
	}
	// horizontal spacing
	//con_gotoxy(start-1,28);
	//putch(' ');
	printf("%s ", message);

	while((ret != option1) && (ret != option2)) ret = con_getc();
	
	//vdp_cls();

	return ret;
}

void game_splash_screen() {
	chardefs *ptr = (chardefs *)0xf000;

	memcpy(ptr[8], ptr['C'], 8); // green C
	memcpy(ptr[9], ptr['r'], 8); // red r
	memcpy(ptr[10], ptr['b'], 8); // blue b
	memcpy(ptr[11], ptr['u'], 8); // yellow u
	memcpy(ptr[12], ptr['s'], 8); // cyan s
	memcpy(ptr[13], ptr['e'], 8); // purple e
	con_cls();

	con_gotoxy(0,1);
	con_puts("  __        _         _                 ");
	con_gotoxy(0,2);
	con_puts(" / _|      | |       | |                ");
	con_gotoxy(0,3);
	con_puts(" |(_   ___ | | _____ | |__   __ _ _ __  ");
	con_gotoxy(0,4);
	con_puts(" \\_ \\ / _ \\| |/ / _ \\| '_ \\ / _. | '_ \\ ");
	con_gotoxy(0,5);
	con_puts("  _) | (_) |   < (_) | |_) | (_| | | | |");
	con_gotoxy(0,6);
	con_puts(" |__/ \\___/|_|\\_\\___/|_.__/ \\__,_|_| |_|");
	con_gotoxy(0,12);
	//con_puts("          v2.0 For Cerberus (TM)");
	con_puts("          v2.0 ");
	con_putc(8);
	con_putc(13);
	con_putc(9);
	con_putc(10);
	con_putc(13);
	con_putc(9);
	con_putc(11);
	con_putc(12);
	con_puts(" (TM)");
	con_gotoxy(0,14);
	con_puts("        (c) 2024 Jeroen Venema");
}

void game_displayHelp(uint8_t xpos, uint8_t ypos) {
	uint16_t gxpos = xpos * MINIMAP_WIDTH;
	uint16_t gypos = (ypos * 8) + 72;
	/*
	con_gotoxy(xpos,ypos);
	vdp_fgcolour(BRIGHT_WHITE);
	con_puts("Game objective");
	con_gotoxy(xpos,ypos+2);
	vdp_fgcolour(DARK_WHITE);
	con_puts("Push all boxes");
	con_gotoxy(xpos,ypos+3);
	con_puts("in this warehouse");
	con_gotoxy(xpos,ypos+4);
	con_puts("to the target goals.");
	
	con_gotoxy(xpos,ypos+7);
	vdp_fgcolour(BRIGHT_WHITE);
	con_puts("Legend");
	
	vdp_bitmapDraw(TILE_PLAYER_MINI,gxpos,gypos);
	vdp_bitmapDraw(TILE_BOX_MINI, gxpos, gypos + 16);
	vdp_bitmapDraw(TILE_BOXONGOAL_MINI, gxpos, gypos + 32);
	vdp_bitmapDraw(TILE_GOAL_MINI, gxpos, gypos + 56);
	
	vdp_fgcolour(DARK_WHITE);
	con_gotoxy(xpos+2,ypos+9);
	con_puts("You, hard at work");
	con_gotoxy(xpos+2,ypos+11);
	con_puts("Boxes with stuff");
	con_gotoxy(xpos+2,ypos+13);
	con_puts("Boxes in shipping");
	con_gotoxy(xpos+2,ypos+14);
	con_puts("position");
	con_gotoxy(xpos+2,ypos+16);
	con_puts("Shipping goal");
	
	vdp_fgcolour(BRIGHT_WHITE);
	con_gotoxy(xpos,ypos+19);
	con_puts("Game controls");
	
	vdp_fgcolour(DARK_WHITE);
	con_gotoxy(xpos,ypos+21);
	con_puts("Cursor");
	con_gotoxy(xpos,ypos+22);
	con_puts(" keys  - move player");
	con_gotoxy(xpos,ypos+23);
	con_puts("    u  - undo move");
	con_gotoxy(xpos,ypos+24);
	con_puts("esc/q  - quit level");
	con_gotoxy(xpos,ypos+26);
	con_puts("ENTER  - start level");
	*/
	return;
}

int16_t game_selectLevel(uint8_t levels, uint16_t previouslevel) {
	int16_t lvl;
	bool selected = false;
	lvl = previouslevel;
	
	while(!selected) {
		game_initLevel(lvl);			// initialize playing field data from memory or disk
		//vdp_clearGraphics();
		game_displayMinimap();			// display 'current' level

		//con_gotoxy(4,9);
		//vdp_fgcolour(BRIGHT_WHITE);
		printf("Level %03d / %03d",lvl+1,levels); // user level# starts at 1, internally this is level 0

		//con_gotoxy(9,43);
		con_puts("Select level with cursor keys");
		//con_gotoxy(18,45);
		//vdp_fgcolour(DARK_WHITE);
		con_puts("ESC to quit");

		//vdp_plotMoveTo(750,335);
		//vdp_plotColour(DARK_CYAN);
		//vdp_plotLineTo(750,804);
		

		game_displayHelp(HELP_XPOS_MAP, HELP_YPOS_MAP);
		
		switch(con_getc())	{
			case 0x8:
			case 0x0a:
				if(lvl > 0) lvl --;
				else lvl = levels-1;
				break;
			case 0x0b:
			case 0x15:
				if(lvl < levels-1) lvl++;
				else lvl = 0;
				break;
			case 0xd:
				selected = true;
				break;
			case 27:
				lvl = -1;
				selected = true;
				break;
			default:
				break;
		}
	}
	return lvl;
}

void game_displayLevel(void) {
	uint16_t width, height;		// position in level GRID
	uint16_t ystart,xstart,x,y;	// on-screen positions
	char c;
	uint8_t currentlevel_width = currentlevel.width; // compiler bug later on
	uint8_t currentlevel_height = currentlevel.height; // compiler bug later on

	spritenumber = 1;
	// Player sprite
	//vdp_spriteSelect(SPRITE_PLAYER);
	//vdp_spriteClearFramesSelected();
	//vdp_spriteAddFrameSelected(TILE_PLAYER);
	//vdp_spriteHideSelected();

	// calculate on-screen base coordinates
	xstart = ((MAXWIDTH - currentlevel.width) / 2) * BITMAP_WIDTH;
	ystart = ((MAXHEIGHT - currentlevel.height) / 2) *BITMAP_HEIGHT;
	
	y = ystart;
	for(height = 0; height < currentlevel_height; height++) {
		x = xstart;
		for(width = 0; width < currentlevel_width; width++) {
			c = currentlevel.data[height][width];
			sprites[height][width] = NOSPRITE; // Faster in most cases
			switch(c) {
				case CHAR_WALL:
					//vdp_bitmapDraw(TILE_WALL, x, y);
					break;
				case CHAR_PLAYER:
				case CHAR_PLAYERONGOAL:
					//vdp_spriteSelect(SPRITE_PLAYER);
					//vdp_spriteMoveToSelected(x,y);
					//vdp_spriteShowSelected();
					break;
				case CHAR_BOX:
				case CHAR_BOXONGOAL:
					//vdp_spriteSelect(spritenumber);
					//vdp_spriteClearFramesSelected();
					//vdp_spriteAddFrameSelected(TILE_BOX);
					//vdp_spriteAddFrameSelected(TILE_BOXONGOAL);
					if(c == CHAR_BOXONGOAL) /*vdp_spriteSetFrameSelected(1)*/;
					else /*vdp_spriteSetFrameSelected(0)*/;
					//vdp_spriteMoveToSelected(x,y);
					//vdp_spriteShowSelected();
					sprites[height][width] = spritenumber;
					spritenumber++;
					if(c == CHAR_BOXONGOAL) {
						//vdp_bitmapDraw(TILE_GOAL, x, y); // don't forget to draw the goal beneath
					}
					break;
				case CHAR_GOAL:
					//vdp_bitmapDraw(TILE_GOAL, x, y);					
					break;
				case CHAR_FLOOR:
					//vdp_bitmapDraw(TILE_FLOOR, x, y);			
					break;
				default:
					break;
			}
			x += BITMAP_WIDTH;
		}
		y += BITMAP_HEIGHT;
	}
	//vdp_spriteActivateTotal(spritenumber);
	//vdp_spriteWaitRefresh();
}

void game_displayMinimap(void) {
	uint16_t width, height;
	uint16_t ystart,xstart,x,y;
	char c;
	uint8_t currentlevel_width = currentlevel.width; // compiler bug later on
	uint8_t currentlevel_height = currentlevel.height; // compiler bug later on

	// calculate on-screen base coordinates
	xstart = (((MAXWIDTH - currentlevel.width) / 2) * MINIMAP_WIDTH) + MINIMAP_XSTART;
	ystart = (((MAXHEIGHT - currentlevel.height) / 2) * MINIMAP_HEIGHT) + MINIMAP_YSTART;
	
	y = ystart;
	for(height = 0; height < currentlevel_height; height++)	{
		x = xstart;
		for(width = 0; width < currentlevel_width; width++) {
			c = currentlevel.data[height][width];
			switch(c) {
				case CHAR_WALL:
					//vdp_bitmapDraw(TILE_WALL_MINI, x, y);
					break;
				case CHAR_PLAYER:
					//vdp_bitmapDraw(TILE_PLAYER_MINI, x, y);
					break;
				case CHAR_PLAYERONGOAL:
					//vdp_bitmapDraw(TILE_PLAYERONGOAL_MINI, x, y);
					break;
				case CHAR_BOX:
					//vdp_bitmapDraw(TILE_BOX_MINI, x, y);
					break;
				case CHAR_BOXONGOAL:
					//vdp_bitmapDraw(TILE_BOXONGOAL_MINI, x, y);
					break;
					break;
				case CHAR_GOAL:
					//vdp_bitmapDraw(TILE_GOAL_MINI, x, y);					
					break;
				case CHAR_FLOOR:
					//vdp_bitmapDraw(TILE_FLOOR_MINI, x, y);			
					break;
				default:
					break;
			}
			x += MINIMAP_WIDTH;
		}
		y += MINIMAP_HEIGHT;
	}
}

void game_initLevel(uint8_t levelid) {
	memset(&currentlevel, 0, sizeof(struct sokobanlevel));
	memcpy(&currentlevel, (void*)(LEVELDATA+(sizeof(struct sokobanlevel))*levelid), sizeof(struct sokobanlevel));
	// initialize undo buffer
	undo_head = 0;
	num_undomoves = 0;
}