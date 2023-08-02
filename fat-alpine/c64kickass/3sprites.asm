//10 SYS2061
*=$0801 "basic starter"
    .byte $0B, $08, $0A, $00, $9E, $32, $30, $36, $31, $00, $00, $00

*=2061 "main"
	lda #$00
	sta $d021

	jsr init_sprites
	jsr $E544  //clear screen
	jsr write_info
	
    // enable all sprites
    lda #%11111111
    sta $d015

    // set x and y position
    lda #$80
    sta $d000
    sta $d001

    lda #$a0
    sta $d002
    sta $d003

    lda #$c0
    sta $d004
    sta $d005
	
end:
    rts
//------------------------


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
.text "sprite 0 (skull), sprite 1 (tank), spri-te 2 (monster)" 

#import "default-sprites.asm"
