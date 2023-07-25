//10 SYS2061
.const counter = $fa // a zeropage address to be used as a counter

*=$0801
    .byte $0B, $08, $0A, $00, $9E, $32, $30, $36, $31, $00, $00, $00

*=$080d
// Start of the program

		lda #$00
		sta $d021
		jsr set_sprite_colors
		jsr $E544  //clear screen
		jsr write_info
	
		// set sprite pointer index
		// this, multiplied by $40, is the address
		// in this case, the address is $2000
		// $80 * $40 = $2000
		//sprite0:
		lda #$80
		sta $07f8
	
		//sprite1:
		// $81 * $40 = $2040
		lda #$81
		sta $07f9
		sta $07fa
		
		
		// enable all sprites
		lda #%11111111
		sta $d015
	
		// set constant y position
		lda #$80
		sta $d001
		sta $d003


        lda #$00    // reset
        sta counter // counter

        sei         // enable interrupts

delay:  lda #$fb    // wait for vertical retrace
loop2:  cmp $d012   // until it reaches 251th raster line ($fb)
        bne loop2   // which is out of the inner screen area

        inc counter // increase frame counter
        lda counter // check if counter
        cmp #6      // reached 6
        bne out     // if not, pass the color changing routine

        lda #$00    // reset
        sta counter // counter

        inc $d000
		dec $d002
		dec $d002

		lda #$d0  //HI byte of address $D019 - collision detection
		ldx #$19  //LO byte 
		jsr $bdcd // KERNEL function to print
out:
        lda $d012 // make sure we reached
loop3:  cmp $d012 // the next raster line so next time we
        beq loop3 // should catch the same line next frame

        jmp delay // jump to main loop
	
end:
    rts
//------------------------

set_sprite_colors:
	ldx #$00
petla:	lda sprite_colors, x
	sta $d027, x
	inx
	cpx #$8
	bne petla
	rts

sprite_colors:
.byte $01,$05,$07,$01,$01,$01,$01,$01	

write_info:
	ldx #$00
petla2:	
	lda message, x
	sta $0400 + 3*40, x
	inx
	cpx #53
	bne petla2
	rts

message:
.text "tanks                                                ." 

*=$2000
sprite0:

.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$60,$ff,$ff,$60,$10,$00,$40
.byte $10,$7f,$ff,$fe,$c0,$00,$03,$9f
.byte $ff,$f9,$30,$00,$05,$25,$55,$54
.byte $30,$00,$04,$1f,$ff,$f8,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01


*=$2040
sprite1:

.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$40,$00,$00,$70,$00,$00,$1c
.byte $00,$00,$07,$1f,$c0,$01,$f0,$20
.byte $00,$60,$10,$00,$40,$10,$00,$40
.byte $10,$7f,$ff,$fe,$c0,$00,$03,$9f
.byte $ff,$f9,$30,$00,$05,$25,$55,$54
.byte $30,$00,$04,$1f,$ff,$f8,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01
