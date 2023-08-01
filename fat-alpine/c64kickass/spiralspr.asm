#import "_lib.asm"

*=$0801 "basic start"
    .word init_basic
	.byte 44
	.word sys
	.text " 4444"
	.byte $00, $00

*=4444 "main"
	jsr setup_sprites

loop:
	jsr move_sprite0
	jsr move_sprite1
	wait #80

	inx
	inc sprite0_color
	jmp loop

setup_sprites:
	poke frame : #0
	poke background : #0
	poke sprite0_y : #100
	poke enable_sprites : #%00000011
	poke sprite0_pointer : #$80
	poke sprite1_pointer : #$81

	ldx #10
	rts

move_sprite0:
	lda cosine, x
	sta sprite0_x
	lda sine, x
	sta sprite0_y
	rts
	
move_sprite1:
	stx sprite1_x
	lda zigzag, x
	sta sprite1_y
	rts

*=$1500	"sine wave data"
sine:
	.for(var i=0;i<256;i++) .byte round(130+i/3*sin(toRadians(360*i/33)))
cosine:
	.for(var i=0;i<256;i++) .byte round(130+0.48*i*cos(toRadians(360*i/33)))
zigzag:
	.for(var i=0;i<256;i++) .byte round(130+70*sin(toRadians(17*i)))

*=$2000 "sprite 0 data"
sprite_data:
	.fill 3, $ff
	.for(var i=0;i<19;i++) .byte %1000000, 0, %00000001
	.fill 3, $ff

*=$2040 "sprite 1 data"
sprite1:
	.fill 3, $ff
	.for(var i=0;i<8;i++) .byte %1000000, %00111100, %00000001
	.fill 3, $ff
	.fill 3, $ff
	.fill 3, $ff
	.for(var i=0;i<8;i++) .byte %1000000, %00111100, %00000001
	.fill 3, $ff
