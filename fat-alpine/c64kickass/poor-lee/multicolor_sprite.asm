#import "_lib.asm"

.const sprite0_ptr = $07f8
.const multicolor = $d01c
.const height = $d01d
.const width = $d017


*=10000 "main"
	lda #BLACK // sprite multicolor 1 - trunks
	sta $d025
	lda #2 // sprite multicolor 2 - mouth
	sta $d026
	poke enable_sprites:#$ff
	
	ldy #$00
	
loop:
	lda sprite_0, y
	sta 12800, y
	iny
	cpy #(8*8)
	bne loop
	
	poke sprite0_color:#7 //body
	poke sprite0_ptr:#200
	poke sprite0_x:#44
	poke sprite0_y:#200
	poke multicolor:#1
	poke height:#1
	poke width:#1
	
	rts

// sprite 0 / multicolor / color: $07
sprite_0:
.byte $00,$05,$00,$00,$09,$40,$00,$1a
.byte $40,$00,$26,$40,$00,$2a,$40,$00
.byte $3a,$00,$00,$0a,$00,$00,$0a,$80
.byte $00,$2a,$80,$00,$2a,$80,$04,$26
.byte $80,$06,$a5,$80,$00,$2a,$00,$00
.byte $15,$00,$00,$15,$00,$00,$51,$00
.byte $00,$41,$00,$00,$41,$00,$00,$41
.byte $00,$01,$41,$40,$05,$41,$50,$87

