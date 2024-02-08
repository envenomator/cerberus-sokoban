#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "game.h"
#include "console.h"

int main(void) {
	uint16_t levels;
	int16_t levelnumber = 0;
	bool ingame;
	char key;

	con_init();
	levels = game_getNumLevels();
    game_saveCerberusPlayerCharacter();
	game_sendTileData();		

	while(1) {
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
						ingame = (game_getResponse("Really QUIT level (y/n)?",'y','n') != 'y');
						if(ingame) {
							game_displayLevel();
						}
						break;
					case 'r':
					case 'R':
						if(game_getResponse("Really RESET level (y/n)?",'y','n') == 'y') {
							game_initLevel(levels, levelnumber);
						}
						game_displayLevel();
						break;
					case 'u':
					case 'U':
						game_handleUndoMove();
						break;
					case KEY_DOWN:
					case KEY_UP:
					case KEY_LEFT:
					case KEY_RIGHT:
						ingame = !game_handleKey(key);	// handleKey returns TRUE when game is finished
						if(!ingame) {
							levelnumber++;
							if(levelnumber == levels) levelnumber = 0;
							game_getResponse("Level complete!",0xd,27);
						}
						break;
					default:
						con_cls();
						game_displayHelp(10,13);
						con_getc();
						con_cls();
						game_displayLevel();
						break;
				}						
			}
		}
	}
}

