		.module crt0
        
        .area   _CODE

        ld      sp, #0xeffd               ; highest address in user memory, just below xmail
        call    gsinit                  ; call SDCC init code

        ;; call C main function
        call    _main			

loop:
        jp loop

        ;;	(linker documentation:) where specific ordering is desired - 
        ;;	the first linker input file should have the area definitions 
        ;;	in the desired order
        .area   _GSINIT
        .area   _GSFINAL	
        .area   _HOME
        .area   _INITIALIZER
        .area   _INITFINAL
        .area   _INITIALIZED
        .area   _DATA
        .area   _BSS
        .area   _HEAP

        ;;	this area contains data initialization code.
        .area _GSINIT
gsinit:	
        ;; initialize vars from initializer
        ld      de, #s__INITIALIZED
        ld      hl, #s__INITIALIZER
        ld      bc, #l__INITIALIZER
        ld      a, b
        or      a, c
        jr      z, gsinit_none
        ldir
gsinit_none:
        .area _GSFINAL
        ret

        .area _DATA
        .area _BSS
        .area _HEAP
__heap::
