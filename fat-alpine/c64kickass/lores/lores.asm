.const sys = $9e00
.const init_basic = $080b

.const screen_seg1 = $0400
.const screen_seg2 = $0500
.const screen_seg3 = $0600
.const screen_seg4 = $0700

.const color_ram_seg1 = $d800
.const color_ram_seg2 = $d900
.const color_ram_seg3 = $da00
.const color_ram_seg4 = $db00

.const screen_ctrl_reg1 = $d011
.const screen_ctrl_reg2 = $d016
.const mem_setup_reg = $d018

*=$0801
    .word init_basic
	.byte 206
	.word sys
	.text " 2061"
	.byte $00, $00

*=2061

	lda $4710
	sta $d020
	sta $d021
	
	lda $4710
	sta $d020
	sta $d021
	ldx #$00
	
loaddccimage:
	lda $3f40,x
	sta screen_seg1,x
	lda $4040,x
	sta screen_seg2,x
	lda $4140,x
	sta screen_seg3,x
	lda $4240,x
	sta screen_seg4,x
	lda $4328,x
	sta color_ram_seg1,x
	lda $4428,x
	sta color_ram_seg2,x
	lda $4528,x
	sta color_ram_seg3,x
	lda $4628,x
	sta color_ram_seg4,x
	inx
	bne loaddccimage
	
	lda #$3b
	sta screen_ctrl_reg1
	lda #$18
	sta screen_ctrl_reg2
	lda #$18
	sta mem_setup_reg
	
loop:
	jmp loop

*=$1ffe
.import c64 "home.prg"
