PROJECTNAME		= sokoz80
CODE_START		= 0x0205
DATA_START		= 0x8000
DEPS			= game.h console.h
BASEOBJ			= crt0.rel main.rel console.rel game.rel
LEVELOBJ		= binlevels-original.rel binlevels-sasquatch.rel binlevels-nabokosmos.rel

SERIALPORT		= /dev/ttyUSB0
SEND_SCRIPT		= ../send.py
INCLUDEDIR		= /usr/local/share/sdcc/include
RELEASEDIR		= ./release

CC				= sdcc
AS				= sdasz80
LNK				= sdcc
OBJCOPY			= sdobjcopy

CFLAGS			= -c -mz80 --std-c23 -I $(INCLUDEDIR) --nostdinc --no-std-crt0 --nostdinc 
ASFLAGS			= -xlos -g
LNKFLAGS		= -mz80 -Wl -y --code-loc $(CODE_START) --data-loc $(DATA_START) --no-std-crt0 $(OBJ)
OBJCOPYFLAGS	= -I ihex -O binary


.PHONY:	all

%.rel: %.c $(DEPS)
	$(CC) -o $@ $< $(CFLAGS)

%.rel: %.s
	$(AS) $(ASFLAGS) $< 

all: $(BASEOBJ) $(LEVELOBJ) $(RELEASEDIR)
	# Link all .rel files
	$(LNK)	-o $(PROJECTNAME)-original.ihx $(LNKFLAGS) $(BASEOBJ) binlevels-original.rel
	$(LNK)	-o $(PROJECTNAME)-sasquatch.ihx $(LNKFLAGS) $(BASEOBJ) binlevels-sasquatch.rel
	$(LNK)	-o $(PROJECTNAME)-nabokosmos.ihx $(LNKFLAGS) $(BASEOBJ) binlevels-nabokosmos.rel

	# Convert all .ihx to .bin files in release folder
	$(OBJCOPY) $(OBJCOPYFLAGS) $(PROJECTNAME)-original.ihx $(RELEASEDIR)/original\ \(69\ levels\)/$(PROJECTNAME).bin
	$(OBJCOPY) $(OBJCOPYFLAGS) $(PROJECTNAME)-sasquatch.ihx $(RELEASEDIR)/sasquatch\ \(21\ levels\)/$(PROJECTNAME).bin
	$(OBJCOPY) $(OBJCOPYFLAGS) $(PROJECTNAME)-nabokosmos.ihx $(RELEASEDIR)/nabokosmos\ \(40\ levels\)/$(PROJECTNAME).bin

	$(MAKE) -s clean
	#Done

$(RELEASEDIR):
	mkdir -p $(RELEASEDIR)
	mkdir -p $(RELEASEDIR)/original\ \(69\ levels\)
	mkdir -p $(RELEASEDIR)/sasquatch\ \(21\ levels\)
	mkdir -p $(RELEASEDIR)/nabokosmos\ \(40\ levels\)

.PHONY: clean
clean:
	# Remoe everything except source files
	rm -f *.lst
	rm -f *.sym
	rm -f *.asm
	rm -f *.ihx
	rm -f *.lk
	rm -f *.noi	
	rm -f *.map
	rm -f *.rel
	rm -f *.?db	
	rm -f *.bin
