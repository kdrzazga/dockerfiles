.const rem = $8f
.const end = $80
.const newline = $08
.const sys = $9e00
.const poke = $9700
.const signature_basic = $080d

*=$0801
.word signature_basic
.byte 10
.word sys
.text "2304:"
.byte end
.byte $00,$19
.byte newline
.byte 20 //$0814 - address of new line of code (line number 20)
.word sys
.text "2345:"
.byte rem
.byte $00,$19 + 16 
.byte newline
.byte 30 //$081e - address of new line of code (line 30)
.word poke 
.text "2040,129:"
.byte rem
.byte $00,$19 + 16 + 15
.byte newline
.byte 40
.word poke 
.text "53287,5:"
.byte rem
.byte $00,$19 + 16 + 15 + 34 // = $5a 
.byte newline
.byte 50
.word poke 
.text "53271,127:"
.byte $97 //poke on the same line
.text " 53277,127:"
.byte rem
.byte $20,$53,$49,$5a,$45
.byte $00, $00, $00, $ff, $ff, 0,0,0, $ff,$ff,$ff, 0,0,0, $ff,$ff,$ff

*=2304
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
*=2345
print_info:
	ldx #$00
txt_loop:	
	lda message, x
	sta $0400 + 11*40, x
	inx
	cpx #237
	bne txt_loop
	
	ldx #$00	
txt_loop2:	
	lda message2, x
	sta $0400 + 18*40, x
	inx
	cpx #(124-8)
	bne txt_loop2	
	
	rts

message:
.text "irq is used to display van animation and the caption on the top. van is sprite 0, so you can change its color, eg. with poke 53287,5 or double its size with    poke 53271,127 and poke 53277,127. disable/re-enable sprite: poke 53269,0/1." 

message2:
.text "poke 2040,128/129 - change sprite. re-run the pogram to reset those changes sys 2345 - displays this info at anytime"

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
    lda #128
    sta 2040
	
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
	cpx #27
	bne loop2
	jmp $ea31

go_right:
	ldy position
	iny
	iny
	sty position
    sty $d000	
	jmp go_right_return
       
tekst:	.text "animation within interrupt "

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

*=$2000 + 8*8
sprite_rocket:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$78,$00,$00,$7e,$00,$00,$7f
.byte $00,$00,$7f,$ff,$00,$a0,$00,$60
.byte $20,$00,$10,$20,$c3,$0c,$50,$92
.byte $41,$10,$92,$40,$d0,$61,$83,$10
.byte $00,$0c,$10,$00,$30,$1f,$ff,$c0
.byte $1f,$c0,$00,$1f,$80,$00,$1e,$00
.byte $00,$00,$00,$00,$00,$00,$00,$3f,$01
