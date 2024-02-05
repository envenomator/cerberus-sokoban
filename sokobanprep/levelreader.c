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
        
        for(y = 0; y < levelinfo[level].height; y++)
        {
            uint8_t startpos, len;
            fread(&startpos, 1, 1, fptr);
            fread(&len, 1, 1, fptr);
            for(x = 0; x < startpos; x++) {
                printf(" ");
            }
            while(len--) {
                fread(&c, 1, 1, fptr);
                printf("%c",c);
            }
            printf("\n");
        }
        
    }
    fclose(fptr);
    exit(EXIT_SUCCESS);
}