//10 SYS2061
.const counter = $fa // a zeropage address to be used as a counter
:BasicUpstart2(start)

			.var picture = LoadBinary("nicecouple2.kla", BF_KOALA)
			.var picture2 = LoadBinary("nicecoupleClosed.kla", BF_KOALA)
			
start:

graphics:  	

//-----------------
        lda #0    // reset
        sta counter // counter

        sei       // enable interrupts

loop1:  lda #251  // wait for vertical retrace
loop2:  cmp $d012 // until it reaches 251th raster line ($fb)
        bne loop2 // which is out of the inner screen area

        inc counter // increase frame counter
        lda counter // check if counter
        cmp #50    // reached 50
        bne out1     // if not, pass main1 routine

        jsr main1
		jmp out2
out1:
		cmp #100
		bne out2
		jsr main2
		
		lda #$00    // reset
        sta counter // counter
		
out2:

        lda $d012 // make sure we reached
loop3:  cmp $d012 // the next raster line so next time we
        beq loop3 // should catch the same line next frame

        jmp loop1 // jump to main loop
		
main1:
			ldx #0
			
			lda #'0'
			sta 1024
			
			rts

main2:
			ldx #0
			
			lda #'1'
			sta 1024
			
			rts

			
.print "End Program code: " + *

*=$0c00	"ScreenRam"; 			.fill picture.getScreenRamSize(), picture.getScreenRam(i)
.print "End ScreenRam 1: " + *
*=$1c00	"ColorRam:"; colorRam: 	.fill picture2.getColorRamSize(), picture2.getColorRam(i)
.print "End ColorRam 1: " + *
*=$2000	"Bitmap";				.fill picture2.getBitmapSize(), picture2.getBitmap(i)
.print "End bitmap 1: " + *
*=16200 "ColorRam2:"; colorRam2: 	.fill picture.getColorRamSize(), picture.getColorRam(i)
.print "End ColorRam 2: " + *
*=$4400	"Bitmap2";				.fill picture.getBitmapSize(), picture.getBitmap(i)
.print "End bitmap 2: " + *


