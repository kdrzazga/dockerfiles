//10 SYS2061
.const counter = $fa // a zeropage address to be used as a counter
:BasicUpstart2(start)

			.var picture = LoadBinary("nicecouple2.kla", BF_KOALA)
			.var pictureClosed = LoadBinary("nicecoupleClosed.kla", BF_KOALA)
			
start:

graphics:  	
			lda #%00111000 //Bits #4-#7: Pointer to screen memory (bits #10-#13), relative to VIC bank, memory address
			sta $d018	//Memory setup register
			lda #%11011000//Bit #4: 1 = Multicolor mode on.
			sta $d016	//Screen control register #2
			lda #%00111011
			sta $d011	//Screen control register #1
			lda #BLACK
			sta $d020
			lda #picture.getBackgroundColor()
			sta $d021

//-----------------
        lda #0    // reset
        sta counter // counter

        sei       // enable interrupts

loop1:  lda #251  // wait for vertical retrace
loop2:  cmp $d012 // until it reaches 251th raster line ($fb)   //$d012- Read: Current raster line (bits #0-#7).
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
			lda #%00111000 //Bits #4-#7: Pointer to screen memory (bits #10-#13), relative to VIC bank, memory address
			sta $d018	//Memory setup register
			lda #%11011000//Bit #4: 1 = Multicolor mode on.
			sta $d016	//Screen control register #2
			lda #%00111011
			sta $d011	//Screen control register #1
			lda #BLACK
			sta $d020
			lda #picture.getBackgroundColor()
			sta $d021
			ldx #0

mloop1:		.for (var i=0; i<4; i++) {
				lda colorRam+i*$100,x
				sta $d800+i*$100,x
			}
			inx
			bne mloop1
			rts

main2:	
			lda #%00111000 //Bits #4-#7: Pointer to screen memory (bits #10-#13), relative to VIC bank, memory address
			sta $d018	//Memory setup register
			lda #%11011000//Bit #4: 1 = Multicolor mode on.
			sta $d016	//Screen control register #2
			lda #%00111011
			sta $d011	//Screen control register #1
			lda #BLACK
			sta $d020
			lda #picture.getBackgroundColor()
			sta $d021
			ldx #0
mloop2:		.for (var i=0; i<4; i++) {
				lda colorRam2+i*$100,x
				sta $d800+i*$100,x
			}
			inx
			bne mloop2
			rts

			
.print "End Program code: " + *

*=$0c00	"ScreenRam"; 			.fill picture.getScreenRamSize(), picture.getScreenRam(i)
.print "End ScreenRam closed-eye: " + *
*=$1c00	"ColorRam:"; colorRam: 	.fill pictureClosed.getColorRamSize(), pictureClosed.getColorRam(i)
.print "End ColorRam 1: " + *
*=$2000	"Bitmap";				.fill pictureClosed.getBitmapSize(), pictureClosed.getBitmap(i)
.print "End bitmap 1: " + *
*=16200 "ColorRam2:"; colorRam2: 	.fill picture.getColorRamSize(), picture.getColorRam(i)
.print "End ColorRam 2: " + *
*=$4400	"Bitmap2";				.fill picture.getBitmapSize(), picture.getBitmap(i)
.print "End bitmap 2: " + *
