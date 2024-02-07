#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define LOADADDRESSIZE 2
#define HEADERSIZE 12
#define BUFFERSIZE 128
#define MAXWIDTH 20
#define MAXHEIGHT 15

char linebuffer[BUFFERSIZE];

int getplayerpos(char *string);
int get_goalsfromline(char *string);
int get_takengoalsfromline(char *string);
int get_cratesfromline(char *string);
bool isdataline(char *string);

int main(int argc, char *argv[])
{
    unsigned int numlevels = 0, level = 0;
    unsigned int fieldptr = 0;  // will point to the start of each field in memory
    unsigned int previouspayloadsize = 0;
    unsigned int outputlength = 0;
    unsigned int playerpos = 0;
    unsigned int * levelheight;
    unsigned int * levelwidth;
    unsigned int * levelgoals;
    unsigned int * levelgoalstaken; // the number of crates on goals in each level
    unsigned int * levelgoalsopen;  // the number of still to be completed goals in each level
    unsigned int * leveloffset;
    unsigned int * levelcrates;
    bool * validlevel;          // record if each level is valid or not
    unsigned int errorlevels;   // record number of error levels, due to too high or too wide
    bool playerfound = false;
    FILE *fptr,*outptr;
    
    if(argc <= 2)
    {
        printf("Usage:\n\nsokobanprep inputfile outputfile\n");
        exit(1);
    }
    fptr = fopen(argv[1],"r");
    if(fptr == NULL)
    {
        printf("Error opening \"%s\"\n",argv[1]);   
        exit(1);             
    }
    outptr = fopen(argv[2],"wb");
    if(outptr == NULL)
    {
        printf("Error opening \"%s\"\n",argv[2]);
        fclose(fptr);
        exit(1);
    }

    // Determine the number of levels in this file
    while(fgets(linebuffer, sizeof(linebuffer), fptr) != NULL)
    {
        if(strncmp(linebuffer,"Level",5) == 0) numlevels++;
    }
    rewind(fptr);

    
    // determine max width / height per level
    // prepare arrays to store counters per level
    levelheight = malloc(numlevels * sizeof(unsigned int));
    levelwidth = malloc(numlevels * sizeof(unsigned int));
    levelgoals = malloc(numlevels * sizeof(unsigned int));
    levelgoalstaken = malloc(numlevels * sizeof(unsigned int));
    levelgoalsopen = malloc(numlevels * sizeof(unsigned int));
    levelcrates = malloc(numlevels * sizeof(unsigned int));
    leveloffset = malloc(numlevels * sizeof(unsigned int));
    validlevel = malloc(numlevels * sizeof(bool));

    while(fgets(linebuffer, sizeof(linebuffer), fptr) != NULL)
    {
        if(strncmp(linebuffer,"Level",5) == 0)
        {
            level++; // first level is 0, but marked at '1'
            levelheight[level-1] = 0;
            levelwidth[level-1] = 0;
            levelgoals[level-1] = 0;
            levelgoalstaken[level-1] = 0;
            levelgoalsopen[level -1] = 0;
            leveloffset[level-1] = 0;
            levelcrates[level-1] = 0;
        }
        else
        {
            outputlength = strlen(linebuffer) - 1;  // remove EOL character at the end of the string
            if(outputlength) // line has payload data
            {
                if(isdataline(linebuffer)) // line without comments, just the data
                {
                    // store maximum width at this level
                    if(levelwidth[level-1] < outputlength) levelwidth[level-1] = outputlength;

                    levelheight[level-1]++; // add another line to this level
                    levelgoals[level-1] += get_goalsfromline(linebuffer);
                    levelgoalstaken[level-1] += get_takengoalsfromline(linebuffer);
                    levelcrates[level-1] += get_cratesfromline(linebuffer);

                }
            }
        }
    }
    rewind(fptr);

    // now determine the player's position as an offset at each level and store it in the array
    // we will calculate the actual load address later, after we know which levels are valid
    level = 0;
    playerfound = false;
    while(fgets(linebuffer, sizeof(linebuffer), fptr) != NULL)
    {
        if(strncmp(linebuffer,"Level",5) == 0)
        {
            level++; // first level is 0, but marked at '1'
            leveloffset[level-1] = 0; // reset offset for the player at this level
            playerfound = false;
        }
        else
        {
            outputlength = strlen(linebuffer) - 1; //compensate EOL / CR/LF
            if(outputlength) // line has payload
            {
                if(isdataline(linebuffer)) // line without comments, just the data
                {
                    if(playerfound == false)
                    {
                        playerpos = getplayerpos(linebuffer);
                        if(playerpos)
                        {
                            leveloffset[level-1] += playerpos;
                            playerfound = true;
                        }
                        else leveloffset[level-1] += levelwidth[level-1];
                    }
                }
            }
        }
    }
    rewind(fptr);

    printf("%d levels present in \"%s\"\n",numlevels,argv[1]);
    // check the validity of each level and record for later use in calculating headers and level data
    errorlevels = 0;
    for(int n = 0; n < numlevels; n++)
    {
        validlevel[n] = true; // set as default, unless either width or height is out of spec
        if((levelwidth[n] > MAXWIDTH) || (levelheight[n] > MAXHEIGHT))
        {
            printf("Removed level %d -",n+1);
            if(levelwidth[n] > MAXWIDTH)
            {
                printf(" wider than %d cols",MAXWIDTH);
                validlevel[n] = false;
            }
            if((levelwidth[n] > MAXWIDTH) && (levelheight[n] > MAXHEIGHT)) printf (" and");
            if(levelheight[n] > MAXHEIGHT)
            {
                printf(" higher than %d rows",MAXHEIGHT);
                validlevel[n] = false;
            }
            printf("\n");
        }
        if(levelgoals[n] > levelcrates[n])
        {
            printf("Removed level %d - too many goals\n",n+1);
            validlevel[n] = false;
        }
        if(validlevel[n] == false) errorlevels++; // record for later use in calculating resulting levels
    }
    if(errorlevels) printf("Removed %d invalid levels\n",errorlevels);
    printf("Written %d valid levels to \"%s\"\n",numlevels - errorlevels,argv[2]);

    if((numlevels - errorlevels) > 0)
    {
        // OUTPUT #LEVELS as 16-bit integer
        fprintf(outptr,"%c%c",(char)(numlevels-errorlevels), (char)((numlevels-errorlevels)>>8));

        // Produce level header information
        fieldptr = 0;
        for(int n = 0; n < numlevels; n++)
        {
            // calculate payload for level n
            // as the number of bytes AFTER the initial pointer to the number of levels in the file
            // FILE LAYOUT
            //                ## 2 byte number of levels in the file
            // 
            //                Per-level header
            //                ## 2 byte start pointer to payload of level 0 - starting from per-level header
            //                ## 2 byte width of level 0 (in characters)
            //                ## 2 byte height of level 0 (in lines)
            //                ## 2 byte number of goals in this level
            //                ## 2 byte number of reached goals in this level (crates on a goal)
            //                ## 2 byte offset to player character in level 0 - from each level's payload
            //                repeat of these 16-bit values for each additional level
            //                ## start payload(s)

            // first determine if this is a valid level to output in the header
            if(validlevel[n] == true)
            {
                if(fieldptr == 0) // is this the first valid level?
                {
                    fieldptr = LOADADDRESSIZE + (HEADERSIZE * (numlevels - errorlevels));
                }
                else
                {
                    fieldptr += previouspayloadsize;
                }

//                leveloffset[n] = fieldptr + leveloffset[n] - 1; // convert to memory address
                leveloffset[n] = leveloffset[n] -1; // convert to zero-based offset from start of each level
                fprintf(outptr,"%c%c",(char)fieldptr,(char)(fieldptr>>8));
                fprintf(outptr,"%c%c",(char)levelwidth[n],(char)(levelwidth[n]>>8));
                fprintf(outptr,"%c%c",(char)levelheight[n],(char)(levelheight[n]>>8));
                fprintf(outptr,"%c%c",(char)levelgoals[n],(char)(levelgoals[n]>>8));
                fprintf(outptr,"%c%c",(char)levelgoalstaken[n],(char)(levelgoalstaken[n]>>8));
                fprintf(outptr,"%c%c",(char)leveloffset[n],(char)(leveloffset[n]>>8));

                previouspayloadsize = levelwidth[n] * levelheight[n];

            }
        }
        // header generation complete

        // now transform the input to the output file and pad memory space
        level = 0;
        while(fgets(linebuffer, sizeof(linebuffer), fptr) != NULL)
        {
            if(strncmp(linebuffer,"Level",5) == 0)
            {
                level++; // first level is 0, but marked at '1'
            }
            else
            {
                if((level > 0) && (validlevel[level-1])) // only output valid level(s) - ignore the rest
                {
                    outputlength = strlen(linebuffer) - 1; //compensate EOL / CR/LF
                    if(outputlength) // line has payload
                    {
                        if(isdataline(linebuffer)) // line without comments, just the data
                        {
                            // now need to padd to max length with zeroes
                            for(int n = 0; n < levelwidth[level-1]; n++)
                            {
                                if(n < outputlength) fprintf(outptr,"%c",linebuffer[n]);
                                else fprintf(outptr,"%c",0);
                            }
                        }
                    }
                }
            }
        }
    }
    else printf("No valid levels in input file\n");

    free(levelheight);
    free(levelwidth);
    free(levelgoals);
    free(levelgoalstaken);
    free(levelgoalsopen);
    free(leveloffset);
    free(validlevel);
    free(levelcrates);
    fclose(fptr);
    fclose(outptr);
    exit(EXIT_SUCCESS);
}

int getplayerpos(char *string)
{
    unsigned int pos;
    unsigned int length;
    bool found = false;

    length = strlen(string);
    pos = 0;
    while(pos < length)
    {
        if(string[pos] == '@' || string[pos] == '+') break;
        pos++;
    }
    if(pos < length) return pos + 1; // non-zero based position
    else return 0;
}
int get_goalsfromline(char *string)
{
    unsigned int goalnum = 0;
    while(*string)
    {
        if(*string == '.' || *string == '+' || *string == '*') goalnum++;
        string++;
    }
    return goalnum;
}

int get_takengoalsfromline(char *string)
{
    unsigned int takengoals = 0;
    while(*string)
    {
        if(*string == '*') takengoals++;
        string++;
    }
    return takengoals;
    
}

int get_cratesfromline(char *string)
{
    unsigned int cratenum = 0;
    while(*string)
    {
        if(*string == '$' || *string == '*') cratenum++;
        string++;
    }
    return cratenum;
}

bool isdataline(char *string)
{
    bool data;
    data = (*string == ' ') || (*string == '#') || (*string == '@') || (*string == '$') || (*string == '.') || (*string == '+') || (*string == '*');
    return data;
}
