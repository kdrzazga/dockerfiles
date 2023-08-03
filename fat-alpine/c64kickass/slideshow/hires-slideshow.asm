#import "../_lib.asm"
BasicUpstart2(start)

.const SCREEN_CTRL_REG = $d011
.const MEM_SETUP_REG = $d018
.const FRAME_COLOR = $d020
.var counter = 0

start:	sei
		lda #%00110000 //Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, Bit #5: 0 = Text mode; 1 = Bitmap mode.
		sta SCREEN_CTRL_REG
		lda #%00011000 //Bits #1-#3: In text mode, pointer to character memory (bits #11-#13) %100, 4: $2000-$27FF, 8192-10239., %101, 5: $2800-$2FFF, 10240-12287. %110, 6: $3000-$37FF, 12288-14335
		sta MEM_SETUP_REG
		lda #BLACK
		sta FRAME_COLOR
		ldx #0
		lda #BLACK | (WHITE<<4)
loop:	sta $0400,x
		sta $0500,x
		sta $0600,x
		sta $0700,x
		inx
		bne loop

		wait 30
		
copy:
		.var src = $4000 + counter
		.var dst = $2000 + counter
		
		lda src
		sta dst
		inc counter

		.if (counter > 7999) jmp end
		jmp copy
		
end:	
		jmp end

		*=$4000 "Picture 1"
		.import c64 "kingsajz.prg" //320x200 hi-res picture occupies 320x200=64000 pixels / 8 bits per byte = 8000 bytes = $1f40
		
		*=$2000 "Picture 2"
		.import c64 "jezpic.prg"
		
		*=$6000 "Picture 3"
		.import c64 "camelpic.prg"
		
		*=$8000 "Picture 4"
		.import c64 "cyc.prg"
