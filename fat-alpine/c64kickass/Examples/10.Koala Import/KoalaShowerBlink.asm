:BasicUpstart2(start)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//  					KOALA SHOWER
//
//This code displays the Koala picture in the file picture.prg
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
			.var picture = LoadBinary("nice-couple.kla", BF_KOALA)
			.var picture2 = LoadBinary("tuffguy.kla", BF_KOALA)
			
start:  	
			lda #$38
			sta $d018
			lda #$d8
			sta $d016
			lda #$3b
			sta $d011
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

WAIT_KEY:
			jsr $FFE4        // Calling KERNAL GETIN 
			beq WAIT_KEY
			
			ldx #0
loop2:		.for (var i=0; i<4; i++) {
				lda colorRam2+i*$100,x
				sta colorRam+i*$100,x
			}
			inx
			bne loop2
			jmp start

			
.print "End Program code: " + *

*=$0c00	"ScreenRam"; 			.fill picture.getScreenRamSize(), picture.getScreenRam(i)
.print "End ScreenRam 1: $" + toHexString(*) + " [" + * +"]"
*=$1c00	"ColorRam:"; colorRam: 	.fill picture.getColorRamSize(), picture.getColorRam(i)
.print "End ColorRam 1: $" + toHexString(*) + " [" + * +"]"
*=$2000	"Bitmap";				.fill picture.getBitmapSize(), picture.getBitmap(i)
.print "End bitmap 1: $" + toHexString(*) + " [" + * +"]"


*=16200 "ColorRam2:"; colorRam2: 	.fill picture2.getColorRamSize(), picture.getColorRam(i)
.print "End ColorRam 2: $" + toHexString(*) + " [" + * +"]"
*=$4400	"Bitmap2";				.fill picture2.getBitmapSize(), picture2.getBitmap(i)
.print "End bitmap 2: $" + toHexString(*) + " [" + * +"]"


