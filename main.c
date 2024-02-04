#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "game.h"
#include "console.h"
#include "levels.h"

int main(void) {
	uint8_t levels;
	int16_t levelnumber = 0;
	//bool quit;
	bool ingame;
	char key;

	con_init();
	game_splash_screen();
	while(1);
	levels = sizeof(levels) / sizeof(struct sokobanlevel);
	
	game_sendTileData();		
	while(levelnumber >= 0) {
		levelnumber = game_selectLevel(levels, levelnumber); // returns -1 if abort, or valid number between 0-(levels-1)
		if(levelnumber >= 0) {
			// Start game
			ingame = true;
			con_cls();
			game_initLevel(levelnumber);	// initialize playing field data from memory or disk
			game_displayLevel();
			while(ingame) {
				key = con_getc();
				switch(key) {
					case 'q':
					case 'Q':
					case 27:
						game_resetSprites();
						ingame = (game_getResponse("Really QUIT level (y/n)?",'y','n') != 'y');
						if(ingame) {
							game_displayLevel();
						}
						break;
					case 'h':
						game_resetSprites();
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
							game_resetSprites();
							game_getResponse("Level complete!",0xd,27);
						}
					break;
				}						
			}
		}
	}
	puts("Thank you for playing Sokoban\r\n");
	con_exit();
	return 0;
}

