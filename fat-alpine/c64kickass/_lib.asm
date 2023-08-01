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

.pseudocommand poke address:value {
	pha
	lda value
	sta address
	pla
}
