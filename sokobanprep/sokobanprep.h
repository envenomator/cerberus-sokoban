#ifndef SOKOBANPREP_H
#define SOKOBANPREP_H

#include <stdint.h>

#define MAXWIDTH 20
#define MAXHEIGHT 15
#define MAXLEVELS 128

// Input encoded characters
#define CHAR_WALL			'#'
#define CHAR_PLAYER			'@'
#define CHAR_PLAYERONGOAL	'+'
#define CHAR_BOX			'$'
#define CHAR_BOXONGOAL		'*'
#define CHAR_GOAL			'.'
#define CHAR_FLOOR			' '

// Output encoded characters
#define ENCODING_WALL			(CHAR_WALL + 0x80)
#define ENCODING_PLAYER			(CHAR_PLAYER + 0x80)
#define ENCODING_PLAYERONGOAL	(CHAR_PLAYERONGOAL + 0x80)
#define ENCODING_BOX			(CHAR_BOX + 0x80)
#define ENCODING_BOXONGOAL		(CHAR_BOXONGOAL + 0x80)
#define ENCODING_GOAL			(CHAR_GOAL + 0x80)
#define ENCODING_FLOOR			(CHAR_FLOOR + 0x80)

struct sokobanlevel
{
	uint8_t xpos;
	uint8_t ypos;
	uint8_t width;
	uint8_t height;
	uint8_t goals;
	uint8_t goalstaken;
	uint8_t crates;	
	uint8_t data[MAXHEIGHT][MAXWIDTH]; // Level GRID representation in memory
	uint8_t outputdata[MAXHEIGHT * (MAXWIDTH + 2)]; // Data that is written to file
	uint16_t datasize;
};

struct sokobanlevel_info
{
	uint8_t xpos;
	uint8_t ypos;
	uint8_t width;
	uint8_t height;
	uint8_t goals;
	uint8_t goalstaken;
	uint8_t crates;	
	uint8_t spacer;
	uint16_t datasize;
};

#endif