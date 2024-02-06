#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "sokobanprep.h"

struct sokobanlevel levelbuffer;
struct sokobanlevel_info levelinfo[MAXLEVELS];

int main(int argc, char *argv[])
{
    FILE *fptr;
    int x,y;
    int n;
    int level;
    uint16_t levels;
    char c;

    if(argc <= 1)
    {
        printf("Usage:\n\nlevelreader inputfile \n");
        exit(1);
    }
    fptr = fopen(argv[1],"rb");
    if(fptr == NULL)
    {
        printf("Error opening \"%s\"\n",argv[1]);   
        exit(1);             
    }

    level = 0;
    fread(&levels, sizeof(uint16_t), 1, fptr);
    printf("%d levels in file\n", levels);
    for(level = 0; level < levels; level++) {
        fread(&levelinfo[level], sizeof(struct sokobanlevel_info), 1, fptr);
    }
    for(level = 0; level < levels; level++) {
        printf("Level %d\n", level);
        printf("Level width: %d, height: %d\n",levelinfo[level].width, levelinfo[level].height);
        printf("Level  xpos: %d,   ypos: %d\n",levelinfo[level].xpos, levelinfo[level].ypos);
        printf("Level goals: %d\n",levelinfo[level].goals);
        printf("Level goals taken: %d\n",levelinfo[level].goalstaken);
        printf("Level crates: %d\n",levelinfo[level].crates);
        printf("Level data:\n");
        
        // decode all line records in this level, sequentially from file
        for(y = 0; y < levelinfo[level].height; y++)
        {
            uint8_t code;
            uint8_t repeat = 1;

            while(1) {
                fread(&code, 1, 1, fptr);
                if((code == 0) || (code & 0x80)) { // end-of-record or 'character' coded
                    while(repeat--) {
                        printf("%c", code & 0x7f);
                    }
                    if(code == 0) break;
                    repeat = 1;
                }
                else { // 'repeat' coded
                    repeat = code;
                }
            }
            printf("\n");
        }
        
    }
    fclose(fptr);
    exit(EXIT_SUCCESS);
}