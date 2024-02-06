#ifndef GAME_H
#define GAME_H

#include <stdbool.h>
#include "sokobanprep/sokobanprep.h"

#define LEVELDATA		0x60000
#define UNDOBUFFERSIZE	128

#define NOSPRITE		255
#define SPRITE_PLAYER	0
#define BITMAPNUMBER	7
#define BITMAP_WIDTH	16
#define BITMAP_HEIGHT	16	
//#define MINIMAP_WIDTH	8
//#define MINIMAP_HEIGHT	8
#define MINIMAP_XSTART	20
#define MINIMAP_YSTART	15

#define BITMAPSIZE		(BITMAP_WIDTH*BITMAP_HEIGHT)

#define HELP_XPOS_MAP		50
#define HELP_YPOS_MAP		13
#define HELP_XPOS_GAME		30
#define HELP_YPOS_GAME		13

// Cerberus character IDs
#define TILE_WALL				0	// white
#define TILE_PLAYER				11	// yellow
#define TILE_PLAYERONGOAL		13	// purple
#define TILE_BOX				8	// green
#define TILE_BOXONGOAL			10	// blue
#define TILE_GOAL				12	// cyan
#define TILE_FLOOR				4	// 'white'

#define TILE_MINIMAP_CLEAR		14

#define CHAR_WALL			'#'
#define CHAR_PLAYER			'@'
#define CHAR_PLAYERONGOAL	'+'
#define CHAR_BOX			'$'
#define CHAR_BOXONGOAL		'*'
#define CHAR_GOAL			'.'
#define CHAR_FLOOR			' '

typedef struct
{
	char ch;
	uint8_t tile_id;
} chartotile;

struct undoitem
{
	uint8_t movekey;	// the key pressed to initiate this move to potentially undo
	bool  pushed;	// an item was pushed in this move to potentially undo
};

void print_playfieldText(uint8_t x, uint8_t y);
uint16_t game_getNumLevels(void);
uint8_t game_readLevels(char *filename);
void game_sendTileData();

void game_initLevel(uint8_t levels, uint8_t levelid);
void game_resetSprites(void);
void game_displayLevel(void);
void game_displayMinimap(void);
bool game_handleKey(char key);
int16_t game_selectLevel(uint8_t levels, uint16_t levelnumber);
char game_getResponse(char *message, char option1, char option2);
void game_displayHelp(uint8_t x, uint8_t y);
void game_handleUndoMove(void);
void game_splash_screen(void);

#endif 


