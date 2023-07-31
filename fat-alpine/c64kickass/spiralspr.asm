.const sys = $9e00
.const init_basic = $080b
.const irq2l = $0314
.const irq2h = $0315

.const enable_sprites = $d015

.const sprite0_pointer = $07f8
.const sprite0_color = $d027

.const sprite0_x = $d000
.const sprite0_y = $d001

.const frame = $d020
.const background = $d021

.pseudocommand poke address:value {
	pha
	lda value
	sta address
	pla
}

*=$0801 "basic start"
    .word init_basic
	.byte 44
	.word sys
	.text " 4444"
	.byte $00, $00

*=4444 "main"
	jsr setup_sprites	
loop:
	lda cosine, x
	sta sprite0_x
	lda sine, x
	sta sprite0_y
	jsr delay
	inx
	inc sprite0_color
	jmp loop
	
setup_sprites:
	poke frame : #0
	poke background : #0
	poke sprite0_y : #100
	poke enable_sprites : #%00000001	
	poke sprite0_pointer : #$80
	
	ldx #10
	rts
	
delay:
	pha
	tya
	pha
	ldy #0
delay_loop:
	
	.for(var d=0; d<123; d++){
		nop
	}
	iny
	cpy #$70
	bne delay_loop
	pla
	tay
	pla
	rts
	
*=$1500	"sine wave data"
sine:
	.for(var i=0;i<256;i++) .byte round(130+i/3*sin(toRadians(360*i/33)))
cosine:
	.for(var i=0;i<256;i++) .byte round(130+0.48*i*cos(toRadians(360*i/33)))
	
*=$2000 "sprite data"
sprite_data:
	.fill 3, $ff
	.for(var i=0;i<19;i++) .byte %1000000, 0, %00000001
	.fill 3, $ff
	
