.const sys = $9e00
.const init_basic = $080b

.const enable_sprites = $d015

.const sprite0_pointer = $07f8
.const sprite1_pointer = $07f9
.const sprite0_color = $d027
.const sprite1_color = $d028

.const sprite0_x = $d000
.const sprite0_y = $d001
.const sprite1_x = $d002
.const sprite1_y = $d003

.const frame = $d020
.const background = $d021

.const screen_mem = $400
.const color_mem = $d800
.const reset = $ff48

.pseudocommand poke address:value {
	pha
	lda value
	sta address
	pla
}

.pseudocommand copy_cell src:target {
	pha
	lda src
	sta target
	pla
}

.pseudocommand wait tm {
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
	cpy tm
	bne delay_loop
	pla
	tay
	pla
}
