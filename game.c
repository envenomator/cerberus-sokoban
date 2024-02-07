#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include "game.h"
#include "console.h"

// Function prototypes for local functions
void displayGRIDTile(uint8_t x, uint8_t y);
void displayTile(uint8_t tileid, uint8_t xpos, uint8_t ypos);

// These files are linked separately by SDCC, so we cannot include levels.h here
extern const uint8_t binlevels[];

// Module variables
struct sokobanlevel currentlevel;	// will contain the currentlevel;
struct undoitem undomove[UNDOBUFFERSIZE];
uint8_t undo_head;
uint8_t num_undomoves;

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

uint16_t game_getNumLevels(void) {
	uint16_t numlevels = 0;

	// Number of levels in the header
	memcpy(&numlevels, binlevels, sizeof(uint16_t));
	return numlevels;
}

void game_saveCerberusPlayerCharacter(void) {
	chardefs *ptr = (chardefs *)0xf000;

	// 'Save' cerberus to character code 151
	memcpy(&ptr[151], &ptr[0], 8);

}

void game_sendTileData(void) {
	// Send 4 tile sections (4 chars per tile
	chardefs *ptr = (chardefs *)0xf000;
	uint8_t tilesection = 0;

	// copy color sections, spaced out 6 apart
	for(uint8_t n = 0; n < (4*6); n = n + 6) {
		memcpy(&ptr[TILE_PLAYER + n], &player_data[tilesection], 8);
		memcpy(&ptr[TILE_PLAYERONGOAL + n], &player_data[tilesection], 8);
		memcpy(&ptr[TILE_BOX + n], &box_data[tilesection], 8);
		memcpy(&ptr[TILE_BOXONGOAL + n], &box_ongoal_data[tilesection], 8);
		memcpy(&ptr[TILE_GOAL + n], &goal_data[tilesection], 8);
		tilesection += 8;
	}
	// copy white tile sections
	memcpy(&ptr[TILE_WALL], wall_data, 32);
	memcpy(&ptr[TILE_FLOOR] , floor_data, 32);	

	return;
}

bool canmove(uint8_t xn1, uint8_t yn1, uint8_t xn2, uint8_t yn2) {
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

void move_updatelevel(uint8_t xn1, uint8_t yn1, uint8_t xn2, uint8_t yn2) {
	// move can happen, no need to check again
	uint8_t n1, n2;
	uint8_t player_oldxpos, player_oldypos;

	player_oldxpos = currentlevel.xpos;
	player_oldypos = currentlevel.ypos;

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

	// update screen tiles
	displayGRIDTile(xn2, yn2);
	displayGRIDTile(xn1, yn1);
	displayGRIDTile(player_oldxpos, player_oldypos);
}

void undomove_updatelevel(uint8_t xn1, uint8_t yn1, uint8_t xn2, uint8_t yn2, uint8_t xn3, uint8_t yn3) {
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

	// update screen tiles
	displayGRIDTile(xn2, yn2);
	displayGRIDTile(xn1, yn1);
	displayGRIDTile(currentlevel.xpos, currentlevel.ypos);
}

void game_handleUndoMove(void) {
	int8_t xn1 = 0, xn2 = 0, yn1 = 0, yn2 = 0, xn3 = 0, yn3 = 0;
	
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
		undomove_updatelevel(xn1, yn1, xn2, yn2, xn3, yn3);
		num_undomoves--;
	}
}

bool game_handleKey(char key) {
	bool done = false;
	bool move = false;
	int8_t	xn1 = 0,xn2 = 0,yn1 = 0,yn2 = 0;
	
	switch(key) {
		case KEY_LEFT:
			xn1 = currentlevel.xpos - 1;
			yn1 = currentlevel.ypos;
			xn2 = currentlevel.xpos - 2;
			yn2 = currentlevel.ypos;
			move = true;
			break;
		case KEY_UP:
			xn1 = currentlevel.xpos;
			yn1 = currentlevel.ypos - 1;
			xn2 = currentlevel.xpos;
			yn2 = currentlevel.ypos - 2;
			move = true;
			break;
		case KEY_DOWN:
			xn1 = currentlevel.xpos;
			yn1 = currentlevel.ypos + 1;
			xn2 = currentlevel.xpos;
			yn2 = currentlevel.ypos + 2;
			move = true;
			break;
		case KEY_RIGHT:
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
			
			move_updatelevel(xn1,yn1,xn2,yn2);
			done = (currentlevel.goals == currentlevel.goalstaken);
		}
	}
	return done;
}

char game_getResponse(char *message, char option1, char option2) {
	uint8_t n;
	uint8_t len = strlen(message);
	uint8_t start = (SCREENWIDTH - len) / 2;
	char ret = 0;

	// vertical spacing
	for(n = start - 1; n < (start+len+1); n++) {
		con_gotoxy(n,14);
		con_putc(' ');
		con_gotoxy(n,16);
		con_putc(' ');
	}
	// horizontal spacing
	con_gotoxy(start-1,15);
	con_putc(' ');
	printf("%s ", message);

	while((ret != option1) && (ret != option2)) ret = con_getc();
	return ret;
}

void game_displayHelp(uint8_t xstart, uint8_t ystart) {

	con_gotoxy(xstart,ystart);
	con_puts("   game controls:");
	con_gotoxy(xstart,ystart + 2);
	con_puts("cursor:move player");
	con_gotoxy(xstart,ystart + 3);
	con_puts(" ESC/q:quit");
	con_gotoxy(xstart,ystart + 4);
	con_puts("     u:undo");
	con_gotoxy(xstart,ystart + 5);
	con_puts("     r:reset level");
}

int16_t game_selectLevel(uint8_t levels, uint16_t previouslevel) {
	int16_t lvl;
	bool selected = false;
	lvl = previouslevel;
	chardefs *ptr = (chardefs *)0xf000;

	// Generate color-coded 'Cerberus'
	memcpy(ptr[8], ptr['C'], 8); // green C
	memcpy(ptr[9], ptr['r'], 8); // red r
	memcpy(ptr[10], ptr['b'], 8); // blue b
	memcpy(ptr[11], ptr['u'], 8); // yellow u
	memcpy(ptr[12], ptr['s'], 8); // cyan s
	memcpy(ptr[13], ptr['e'], 8); // purple e
	memcpy(ptr[17], ptr['e'], 8); // yellow e
	memcpy(ptr[18], ptr['r'], 8); // cyan r

	con_cls();
	con_gotoxy(0,0);
	con_puts("  __        _         _                 ");
	con_gotoxy(0,1);
	con_puts(" / _|      | |       | |                ");
	con_gotoxy(0,2);
	con_puts(" |(_   ___ | | _____ | |__   __ _ _ __  ");
	con_gotoxy(0,3);
	con_puts(" \\_ \\ / _ \\| |/ / _ \\| '_ \\ / _. | '_ \\ ");
	con_gotoxy(0,4);
	con_puts("  _) | (_) |   < (_) | |_) | (_| | | | |");
	con_gotoxy(0,5);
	con_puts(" |__/ \\___/|_|\\_\\___/|_.__/ \\__,_|_| |_|");
	con_gotoxy(12,8);
	con_puts("v2.0 ");
	con_putc(8);
	con_putc(17);
	con_putc(18);
	con_putc(10);
	con_putc(13);
	con_putc(9);
	con_putc(11);
	con_putc(12);
	con_gotoxy(0,10);
	con_puts("        (c)2024 Jeroen Venema");

	game_displayHelp(0,17);

	con_gotoxy(0,27);
	con_puts("  ENTER to start");

	while(!selected) {
		game_initLevel(levels, lvl);	// initialize playing field data from memory or disk
		con_gotoxy(22,13);
		printf("Level %03d / %03d", lvl + 1, levels);
		game_displayMinimap();			// display 'current' level
		switch(con_getc())	{
			case KEY_UP:
			case KEY_LEFT:
				if(lvl > 0) lvl --;
				else lvl = levels-1;
				break;
			case KEY_DOWN:
			case KEY_RIGHT:
				if(lvl < levels-1) lvl++;
				else lvl = 0;
				break;
			case KEY_ENTER:
				selected = true;
				break;
			case 'q':
				lvl = -1;
				selected = true;
				break;
			default:
				break;
		}
	}
	return lvl;
}

// Display Tile ID on screen X/Y position
void displayTile(uint8_t tileid, uint8_t xpos, uint8_t ypos) {
	uint8_t tilebase = TILE_FLOOR;
	bool color = true;

	switch(tileid) {
		case CHAR_WALL:
			tilebase = TILE_WALL;
			color = false;
			break;
		case CHAR_PLAYER:
			tilebase = TILE_PLAYER;
			break;
		case CHAR_PLAYERONGOAL:
			tilebase = TILE_PLAYER;
			break;
		case CHAR_BOX:
			tilebase = TILE_BOX;
			break;
		case CHAR_BOXONGOAL:
			tilebase = TILE_BOXONGOAL;
			break;
		case CHAR_GOAL:
			tilebase = TILE_GOAL;
			break;
		case 0:
		case CHAR_FLOOR:
			tilebase = TILE_FLOOR;
			color = false;
			break;
	}
	con_gotoxy(xpos,ypos);
	con_putc(tilebase);
	con_putc(tilebase + (color?6:1));

	con_gotoxy(xpos, ypos + 1);
	con_putc(tilebase + (color?12:2));
	con_putc(tilebase + (color?18:3));
}

// displays TileID from GRID using currentlevel[y][x] coordinates
// Calculates screen position and displays it on screen
void displayGRIDTile(uint8_t x, uint8_t y) {
	uint8_t screenxpos, screenypos;

	screenxpos = (((MAXWIDTH - currentlevel.width) >> 1) + x) << 1;
	screenypos = (((MAXHEIGHT - currentlevel.height) >> 1) + y) << 1;
	displayTile(currentlevel.data[y][x], screenxpos, screenypos);
}

void game_displayLevel(void) {
	// Paint the entire screen with central oriented level
	uint8_t width, height;
	uint8_t levelwidth, levelheight;
	uint8_t xstart, ystart;
	uint8_t screenxpos, screenypos;

	xstart = ((MAXWIDTH - currentlevel.width) >> 1);	// GRID coordinate
	ystart = ((MAXHEIGHT - currentlevel.height) >> 1);	// GRID coordinate

	levelwidth = currentlevel.width;
	levelheight = currentlevel.height;

	con_cls();
	for(height = 0; height < levelheight; height++) {
		screenypos = (ystart + height) << 1;
		for(width = 0; width < levelwidth; width++) {
			screenxpos = (xstart + width) << 1;
			displayTile(currentlevel.data[height][width], screenxpos, screenypos);
		}
	}
}

void game_displayMinimap(void) {
	uint8_t width, height, maxwidth, maxheight;
	char c,out;
	
	// clear out full area
	for(height = 0; height < MAXHEIGHT; height++) {
		con_gotoxy(MINIMAP_XSTART, MINIMAP_YSTART + height);
		for(width = 0; width < MAXWIDTH; width++) {
			con_putc(' ');
		}
	}
	// paint minimap
	maxwidth = currentlevel.width;
	maxheight = currentlevel.height;
	for(height = 0; height < maxheight; height++) {
		con_gotoxy(MINIMAP_XSTART, MINIMAP_YSTART + height);
		for(width = 0; width < maxwidth; width++) {
			c = currentlevel.data[height][width];
			switch(c) {
				case '#':
					out = 136;
					break;
				case '@':
					out = 151; // Special Cerberus player character, mapped to char 151
					break;
				case '$':
					out = '#';
					break;
				default:
					out = c;
			}
			con_putc(out);
		}
	}
}

void game_initLevel(uint8_t levels, uint8_t levelid) {
	uint8_t y;
	uint8_t *ptr,*outptr;
	struct sokobanlevel_info *sblptr;

	memset(&currentlevel, 0, sizeof(struct sokobanlevel));
	// copy over level information
	sblptr = (struct sokobanlevel_info *)&binlevels[2]; // just after the uint16_t levels number
	currentlevel.xpos = sblptr[levelid].xpos;
	currentlevel.ypos = sblptr[levelid].ypos;
	currentlevel.width = sblptr[levelid].width;
	currentlevel.height = sblptr[levelid].height;
	currentlevel.goals = sblptr[levelid].goals;
	currentlevel.goalstaken = sblptr[levelid].goalstaken;
	currentlevel.crates = sblptr[levelid].crates;
	currentlevel.datasize = sblptr[levelid].datasize;

	// decode run-length encoded level data
	ptr = (uint8_t *)&sblptr[levels]; // the first byte after the info array
	for(uint8_t n = 0; n < levelid; n++) {
		ptr += sblptr[n].datasize;	// advance to correct level data part
	}
	for(y = 0; y < currentlevel.height; y++)
	{
		uint8_t code;
		uint8_t repeat = 1;

		outptr = &currentlevel.data[y][0];
		while(1) {
			code = *ptr++;
			if((code == 0) || (code & 0x80)) { // end-of-record or 'character' coded
				while(repeat--) {
					*outptr++ = code & 0x7f;
				}
				if(code == 0) break;
				repeat = 1;
			}
			else { // 'repeat' coded
				repeat = code;
			}
		}
	}	

	// initialize undo buffer
	undo_head = 0;
	num_undomoves = 0;
}

/*
void print_playfieldText(uint8_t x, uint8_t y) {
	uint16_t width, height, maxwidth, maxheight;
	char c;
	
	maxwidth = currentlevel.width;
	maxheight = currentlevel.height;
	for(height = 0; height < maxheight; height++) {
		con_gotoxy(x, y + height);
		for(width = 0; width < maxwidth; width++) {
			c = currentlevel.data[height][width];
			con_putc(c);
		}
	}
}
*/