//10 SYS2061
.const counter = $fa // a zeropage address to be used as a counter
:BasicUpstart2(start)

start:
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
			lda #'0'
			sta 1024
			rts

main2:
			lda #'1'
			sta 1024
			rts


.print "End Program code: " + *
