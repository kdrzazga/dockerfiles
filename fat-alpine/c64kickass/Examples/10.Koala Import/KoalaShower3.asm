:BasicUpstart2(start)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//  					KOALA SHOWER
//
//This code displays the Koala picture in the file picture.prg
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
			.var picture = LoadBinary("picture.prg", BF_KOALA)
			.print picture.getBitmapSize()

start:  	lda #%00111000
			sta $d018
			lda #%11011000
			sta $d016 //Screen control register #2. Bits #0-#2: Horizontal raster scroll. Bit #3: Screen width; 0 = 38 columns; 1 = 40 columns. Bit #4: 1 = Multicolor mode on.
			
			lda #%00111011
			sta $d011 //Screen control register #1 Bits #0-#2: Vertical raster scroll.Bit #3: Screen height; 0 = 24 rows; 1 = 25 rows Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, normal screen contents are visible.
			lda #BLACK
			sta $d020
			lda #picture.getBackgroundColor()
			sta $d021
			ldx #0

loop1:		.for (var i=0; i<4; i++) {
				lda colorRam+i*$100,x
				sta $d800+i*$100,x
			}
			inx
			bne loop1
			jmp *

*=$0c00	"ScreenRam"; 			.fill picture.getScreenRamSize(), picture.getScreenRam(i)
*=$1c00	"ColorRam:"	; colorRam: .fill picture.getColorRamSize(), picture.getColorRam(i) //1024 bytes

*=$2000	"Bitmap";				//.fill picture.getBitmapSize(), picture.getBitmap(i)
.fill 00,32
.fill 01,32
.fill 02,32
.fill 03,32
.fill 04,32
.fill 05,32
.fill 06,32
.fill 07,32
.fill 08,32
.fill 09,32
.fill 10,32
.fill 11,32
.fill 12,32
.fill 13,32
.fill 14,32
.fill 15,32



