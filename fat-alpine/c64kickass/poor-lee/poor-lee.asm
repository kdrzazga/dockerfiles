#import "../_lib.asm"

.const sprite0_ptr = $07f8
.const multicolor = $d01c
.const height = $d01d
.const width = $d017

*=$0801 "basic start"
    .word init_basic
	.byte 33
	.word sys
	.text " 3333"
	.byte $00, $00

*=3333 "main"
	jsr init
	jsr load_screen
	jsr init_sprite
	
!loop:

	jmp !loop- //jump to the previous closest 'loop' label

init:
	poke frame:#15
	poke background:#15
	rts

load_screen:
	
	.var start1=22800
	.var start2=24000
	.for(var i=0; i < 1000; i++){
		.var src1 = start1 + i
		.var target1 = screen_mem + i
		copy_cell src1:target1

		.var src2 = start2 + i
		.var target2 = color_mem + i
		copy_cell src2:target2 
	}
	
	rts

*=$4bb0 "sprite"
init_sprite:
	lda #BLACK // sprite multicolor 1 - trunks
	sta $d025
	lda #2 // sprite multicolor 2 - mouth
	sta $d026
	poke enable_sprites:#$ff
	
	ldy #$00
	
!loop:
	lda sprite_lee, y
	sta 12800, y
	iny
	cpy #(8*8)
	bne !loop-
	
	poke sprite0_color:#7 //body
	poke sprite0_ptr:#200
	poke sprite0_x:#44
	poke sprite0_y:#200
	poke multicolor:#1
	poke height:#1
	poke width:#1
	
	rts
	
// sprite 0 / multicolor / color: $07
sprite_lee:
.byte $00,$05,$00,$00,$09,$40,$00,$1a
.byte $40,$00,$26,$40,$00,$2a,$40,$00
.byte $3a,$00,$00,$0a,$00,$00,$0a,$80
.byte $00,$2a,$80,$00,$2a,$80,$04,$26
.byte $80,$06,$a5,$80,$00,$2a,$00,$00
.byte $15,$00,$00,$15,$00,$00,$51,$00
.byte $00,$41,$00,$00,$41,$00,$00,$41
.byte $00,$01,$41,$40,$05,$41,$50,$87


*=22800 "character data"
chars:

.fill 40, $20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$fe,$fc,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$fe,$fc,$20,$20,$20,$20,$20,$20
.byte $20,$20,$62,$62,$20,$20,$20,$20,$62,$62,$20,$20,$62,$62,$20,$6c,$fe,$a0,$a0,$fc,$20,$20,$20,$fe,$fc,$20,$20,$fe,$fc,$20,$6c,$fe,$a0,$a0,$fc,$20,$20,$20,$20,$20
.byte $20,$fe,$a0,$a0,$fc,$20,$20,$fe,$a0,$a0,$fc,$fe,$a0,$a0,$fc,$a0,$a0,$a0,$a0,$a0,$fc,$20,$fe,$a0,$a0,$fc,$fe,$a0,$a0,$fc,$a0,$a0,$a0,$a0,$e8,$fc,$20,$20,$20,$20
.byte $fe,$a0,$a0,$a0,$a0,$4c,$e9,$a0,$a0,$e8,$e8,$66,$e8,$a0,$a0,$a0,$69,$20,$20,$20,$fb,$a0,$a0,$a0,$e8,$a0,$a0,$a0,$a0,$a0,$69,$20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $e8,$a0,$a0,$a0,$ec,$e2,$e2,$e2,$e2,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $52,$52,$52,$52,$52,$e4,$e4,$e4,$e4,$52,$52,$52,$52,$52,$e4,$e4,$52,$52,$52,$52,$52,$52,$e4,$e4,$52,$52,$20,$20,$20,$20,$20,$20,$fe,$fc,$fe,$fc,$fe,$fc,$fe,$fc
.fill 17, $20
.byte $6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$42,$42,$42,$42,$42,$42,$42,$42
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d
.byte $fe,$fc,$fe,$fc,$fe,$fc,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$58,$20,$6b,$43,$73,$20,$58,$20
.byte $67,$dc,$20,$20,$20,$42,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$42,$20,$42,$20,$20,$20
.byte $67,$dc,$20,$20,$20,$42,$20,$20,$1e,$20,$1e,$20,$20,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$72,$73,$20,$20,$20
.byte $67,$dc,$20,$20,$20,$42,$20,$20,$a0,$a0,$a0,$20,$20,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$5b,$73,$20,$20,$20
.byte $67,$dc,$20,$20,$20,$42,$20,$20,$d7,$20,$d7,$e9,$df,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$6b,$71,$73,$20,$20,$20
.byte $67,$dc,$20,$20,$20,$42,$20,$20,$5f,$c4,$a0,$a0,$a0,$64,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$fe,$fc,$fe,$fc,$fe,$fc,$fe,$fc,$fe,$fc,$fe,$fc,$fe,$fc
.byte $67,$dc,$20,$20,$20,$5d,$20,$20,$70,$5b,$5b,$5b,$73,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$42,$42,$42,$42,$42,$42,$42,$42,$42,$42,$42,$42,$7d
.byte $67,$dc,$20,$20,$20,$58,$20,$20,$6b,$7d,$20,$6d,$73,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$7d,$dc
.byte $67,$dc,$20,$20,$20,$20,$20,$20,$6b,$6e,$20,$70,$73,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$58,$ec,$fb,$58,$20,$6b,$43,$72,$43,$73,$58,$67,$dc
.byte $67,$dc,$20,$20,$20,$20,$20,$20,$6b,$71,$43,$71,$73,$20,$20,$20,$20,$6b,$43,$43,$73,$20,$20,$20,$20,$20,$20,$20,$fc,$fe,$20,$20,$42,$20,$42,$20,$42,$20,$67,$dc
.byte $67,$dc,$20,$20,$20,$20,$20,$20,$6b,$6e,$20,$70,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$fb,$ec,$20,$20,$6b,$43,$5b,$43,$73,$20,$67,$dc
.byte $67,$dc,$20,$20,$20,$20,$20,$20,$6b,$73,$20,$6b,$73,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$e1,$61,$20,$20,$6b,$43,$73,$20,$42,$20,$67,$dc
.byte $67,$dc,$20,$20,$20,$20,$20,$20,$5b,$5b,$5b,$5b,$5b,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$e1,$61,$20,$20,$6b,$43,$71,$43,$73,$20,$67,$dc
.byte $7a,$dc,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$6f,$7a,$dc
.fill 40, $a0
.fill 40, $a0

*=24000 "color data"
colors:
// color codes (1000 .bytes) 25 lines x 40 codes
.byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
.byte $06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$01,$01,$0e,$0e,$06,$06,$06,$06
.byte $06,$06,$01,$01,$0e,$0e,$0e,$06,$01,$01,$0e,$06,$01,$01,$0e,$01,$01,$01,$01,$01,$0e,$0e,$0e,$01,$01,$0e,$0e,$01,$01,$0e,$01,$01,$01,$01,$01,$0e,$06,$06,$0e,$0e
.byte $0e,$01,$01,$01,$01,$0e,$0e,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$0e,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$0e,$0e,$0e,$0e
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$0e,$0e,$0e,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$06,$06,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$0e,$0e,$0e,$0e,$0e,$0e,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$00,$00,$00,$00,$00,$00,$00,$00
.byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$00,$00,$00,$00,$00,$00,$00,$00
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$0e,$01,$01,$01,$0e,$01,$0e
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$0e,$01,$0e,$0e,$0e
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$01,$01,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$01,$0e,$0e,$0e
.byte $00,$00,$0e,$02,$02,$01,$02,$02,$01,$01,$01,$02,$02,$02,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$01,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$02,$02,$02
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$01,$0e,$01,$01,$01,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$01,$01,$01,$01,$01,$01,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$01,$01,$01,$01,$01,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$01,$01,$0e,$01,$01,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$0e,$0e,$0e,$01,$0e,$0e,$01,$01,$0e,$01,$01,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$01,$01,$01,$01,$01,$0e,$01,$01,$01,$01,$01,$01,$00,$00
.byte $00,$00,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$01,$01,$01,$0e,$0e,$0e,$0e,$06,$06,$06,$06,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$0e,$01,$0e,$01,$0e,$01,$00,$00,$00
.byte $00,$00,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$0e,$01,$01,$01,$01,$01,$00,$00,$00
.byte $00,$00,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$0e,$01,$01,$01,$0e,$01,$0e,$00,$00
.byte $00,$00,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$01,$01,$01,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$01,$01,$0e,$0e,$01,$01,$01,$01,$01,$0e,$00,$00
.byte $00,$00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00
.fill 40, $0b
.fill 40, $0b
