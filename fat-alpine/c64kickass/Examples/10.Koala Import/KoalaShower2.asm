:BasicUpstart2(start)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//  					KOALA SHOWER
//
//This code displays the Koala picture in the file picture.prg
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//KOA file (size 10003 bytes) has:
//
//1) 2 byte header
//2) 8000 bytes pixel data - half byte for each pixel 200x160 = 32000 pixels * 0.5 byte = 8000 B 
//3) 1000 byte character data (that I ignore)
//4) 1000 byte color data
//5) 1 byte background color

			.var picture1 = LoadBinary("nice-couple.kla", BF_KOALA)
			.var picture2 = LoadBinary("tuffguy.kla", BF_KOALA)

start:  	lda #%00111000 // old nibble %0011 * 1024 = $c00 -> ScreenRam //young nibble %1000 * 1024 = $2000 -> Bitmap 
			sta $d018
			lda #%11011000
			sta $d016 //Screen control register #2. Bits #0-#2: Horizontal raster scroll. Bit #3: Screen width; 0 = 38 columns; 1 = 40 columns. Bit #4: 1 = Multicolor mode on.
			
			lda #%00111011
			sta $d011 //Screen control register #1 Bits #0-#2: Vertical raster scroll.Bit #3: Screen height; 0 = 24 rows; 1 = 25 rows Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, normal screen contents are visible.
			lda #BLACK
			sta $d020
			lda #picture1.getBackgroundColor()
			sta $d021
			ldx #0

loop1:		.for (var i=0; i<4; i++) {
				lda colorRam1+i*$100,x
				sta $d800+i*$100,x
			}
			inx
			bne loop1
			
WAIT_KEY:
			jsr $FFE4        // Calling KERNAL GETIN 
			beq WAIT_KEY

            inc counter

            rts

counter:    .byte 0
*=$0c00	"ScreenRam 1"; 			.fill picture1.getScreenRamSize(), picture1.getScreenRam(i)
//end $0fe8 [4072], size: $3e8 [1000]
.print "End ScreenRam 1: " + toHexString(*) + " [" + * + "]" 

*=$1c00	"ColorRam: 1"; colorRam1: 	.fill picture1.getColorRamSize(), picture1.getColorRam(i)
//end 1fe8 [8168], size: $3e8 [1000]
.print "End ColorRam 1: " + toHexString(*) + " [" + * + "]" 

*=$2000	"Bitmap 1";				.fill picture1.getBitmapSize(), picture1.getBitmap(i)
//end 3f40 [16192], size: $1f40 [8000]
.print "End bitmap 1: " + toHexString(*) + " [" + * + "]" 



*=$4c00	"ScreenRam 2"; 			.fill picture2.getScreenRamSize(), picture2.getScreenRam(i)
//end 4fe8 [20456], size: 
.print "End ScreenRam 2: " + toHexString(*) + " [" + * + "]" 

*=$5c00	"ColorRam: 2"; colorRam2: 	.fill picture2.getColorRamSize(), picture2.getColorRam(i)
//end 5fe8 [24552], size: 
.print "End ColorRam 2: " + toHexString(*) + " [" + * + "]" 

*=$6000	"Bitmap 2";				.fill picture2.getBitmapSize(), picture2.getBitmap(i)
//end 7f40 [32576], size: $1f40 [8000]
.print "End bitmap 2: " + toHexString(*) + " [" + * + "]" 
