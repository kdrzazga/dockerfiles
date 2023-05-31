BasicUpstart2(start)
	*=$080d
start:
	jsr print_info
	jsr set_sprite_colors
	jsr enable_sprite
		
	sei
	lda #<irq2
	sta $0314
	lda #>irq2
	sta $0315
	cli
	rts

//------------------------
*=2090
print_info:
	ldx #$00
txt_loop:	
	lda message, x
	sta $0400 + 11*40, x
	inx
	cpx #235
	bne txt_loop
	
	ldx #$00	
txt_loop2:	
	lda message2, x
	sta $0400 + 18*40, x
	inx
	cpx #40
	bne txt_loop2	
	
	rts

message:
.text "irq is used to display van animation and the caption on the top. van is sprite 0, so you can change its color, eg. with poke 53287,5 or double its size with    poke 53271,127 and poke 53277,127. re-run the pogram to reset those changes." 

message2:
.text "sys 2090 - displays this info at anytime"

//------------------------
set_sprite_colors:
	ldx #$00
petla:
	lda sprite_colors, x
	sta $d027, x
	inx
	cpx #$8
	bne petla
	rts

sprite_colors:
.byte $01,$05,$07,$01,$01,$01,$01,$01	
//------------------------

enable_sprite:
    // set sprite pointer index this, multiplied by $40, is the address
    // in this case, the address is $2000 80 * $40 = $2000
    lda #$80
    sta $07f8
	
	lda #1
    sta $d015

    // set x and y position
    lda #$40
    sta $d001
	
	// normal width and height
	lda #0
	sta $d01d
	sta $d017
	
	rts

//------------------------
irq2:
	ldx #$00
loop2:
	lda tekst, x
	sta $0400, x
	
	ldy counter
	iny
	sty counter	
	cpy #$ff
	beq go_right
	cpy #$80
	beq go_right
	cpy #$40
	beq go_right
	
go_right_return:        
	inx
	cpx #26
	bne loop2
	jmp $ea31

go_right:
	ldy position
	iny
	iny
	sty position
    sty $d000	
	jmp go_right_return
       
tekst:	.text "animation within interrupt"

position: .byte $00
counter:  .byte $00

*=$2000
sprite_van:
.byte $88,$61,$10,$88,$91,$90,$50,$91
.byte $50,$50,$f1,$30,$20,$91,$10,$00
.byte $00,$00,$7f,$fe,$00,$40,$05,$80
.byte $40,$04,$60,$40,$04,$10,$40,$04
.byte $08,$40,$04,$08,$40,$07,$fc,$40
.byte $04,$04,$40,$04,$02,$4c,$04,$62
.byte $52,$fe,$96,$12,$00,$90,$0c,$00
.byte $60,$00,$00,$00,$00,$00,$00,$01
