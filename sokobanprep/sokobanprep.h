#ifndef SOKOBANPREP_H
#define SOKOBANPREP_H

#include <stdint.h>

#define MAXWIDTH 20
#define MAXHEIGHT 15
#define MAXLEVELS 128

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