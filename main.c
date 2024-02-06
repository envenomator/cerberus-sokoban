#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "game.h"
#include "console.h"
#include "levels.h"

void test_tiledata(void) {
	con_cls();
	
	con_gotoxy(4,0);
	con_putc(TILE_WALL);
	con_putc(TILE_WALL + 1);
	con_gotoxy(4,1);
	con_putc(TILE_WALL + 2);
	con_putc(TILE_WALL + 3);

	con_gotoxy(8,0);
	con_putc(TILE_FLOOR);
	con_putc(TILE_FLOOR + 1);
	con_gotoxy(8,1);
	con_putc(TILE_FLOOR + 2);
	con_putc(TILE_FLOOR + 3);

	con_gotoxy(12,0);
	con_putc(TILE_PLAYER);
	con_putc(TILE_PLAYER + 6);
	con_gotoxy(12,1);
	con_putc(TILE_PLAYER + 12);
	con_putc(TILE_PLAYER + 18);

	con_gotoxy(16,0);
	con_putc(TILE_PLAYERONGOAL);
	con_putc(TILE_PLAYERONGOAL + 6);
	con_gotoxy(16,1);
	con_putc(TILE_PLAYERONGOAL + 12);
	con_putc(TILE_PLAYERONGOAL + 18);
	
	con_gotoxy(20,0);
	con_putc(TILE_BOX);
	con_putc(TILE_BOX + 6);
	con_gotoxy(20,1);
	con_putc(TILE_BOX + 12);
	con_putc(TILE_BOX + 18);

	con_gotoxy(24,0);
	con_putc(TILE_BOXONGOAL);
	con_putc(TILE_BOXONGOAL + 6);
	con_gotoxy(24,1);
	con_putc(TILE_BOXONGOAL + 12);
	con_putc(TILE_BOXONGOAL + 18);

	con_gotoxy(28,0);
	con_putc(TILE_GOAL);
	con_putc(TILE_GOAL + 6);
	con_gotoxy(28,1);
	con_putc(TILE_GOAL + 12);
	con_putc(TILE_GOAL + 18);

	while(1);
}

int main(void) {
	uint16_t levels;
	int16_t levelnumber = 0;
	bool ingame;
	char key;

	con_init();
	//game_splash_screen();
	
	levels = game_getNumLevels();

	game_sendTileData();		

	// DEBUG	
	//test_tiledata();
	uint8_t ans;
	while(1) {
		levelnumber = game_selectLevel(levels, levelnumber);
		game_initLevel(levels, levelnumber);
		game_sendTileData();
		game_displayLevel();
		while(1);
	}

	while(1);
	// DEBUG
	while(levelnumber >= 0) {
		levelnumber = game_selectLevel(levels, levelnumber); // returns -1 if abort, or valid number between 0-(levels-1)
		if(levelnumber >= 0) {
			// Start game
			ingame = true;
			con_cls();
			game_initLevel(levels, levelnumber);	// initialize playing field data from memory or disk
			game_sendTileData();
			game_displayLevel();
			while(ingame) {
				key = con_getc();
				switch(key) {
					case 'q':
					case 'Q':
					case 27:
						//game_resetSprites();
						ingame = (game_getResponse("Really QUIT level (y/n)?",'y','n') != 'y');
						if(ingame) {
							game_displayLevel();
						}
						break;
					case 'h':
						//game_resetSprites();
						con_cls();
						game_displayHelp(HELP_XPOS_GAME, HELP_YPOS_GAME);
						con_getc();
						con_cls();
						game_displayLevel();
						break;
					case 'u':
						game_handleUndoMove();
						break;
					default:
						ingame = !game_handleKey(key);	// handleKey returns TRUE when game is finished
						if(!ingame) {
							levelnumber++;
							if(levelnumber == levels) levelnumber = 0;
							//delayms(200);
							//game_resetSprites();
							game_getResponse("Level complete!",0xd,27);
						}
					break;
				}						
			}
		}
	}
	con_exit();
	return 0;
}

