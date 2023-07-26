.const enable_sprites = $d015

.const sprite0_pointer = $07f8
.const sprite0_x = $d000
.const sprite0_y = $d001

.const sprite1_pointer = $07f9
.const sprite1_x = $d002
.const sprite1_y = $d003

.const sprite2_pointer = $07fa
.const sprite2_x = $d004
.const sprite2_y = $d005

.const sprite3_pointer = $07fb
.const sprite3_x = $d006
.const sprite3_y = $d007

.const sprite4_pointer = $07fc
.const sprite4_x = $d008
.const sprite4_y = $d009

.const sprite0_color = $d027
.const sprite1_color = $d028
.const sprite2_color = $d029
.const sprite3_color = $d02a
.const sprite4_color = $d02b

.const sprite_height_ptr = $d017
.const sprite_width_ptr = $d01d

.const raster_ptr = $d012
.const counter = $fa // a zeropage address to be used as a counter
.const sys = $9e00
.const init_basic = $080b

*=$0801
    .word init_basic
	.byte 10
	.word sys
	.text "2061"
	.byte $00, $00, $00

*=2061

lda #3
sta sprite0_color
lda #7
sta sprite1_color
lda #13
sta sprite2_color
lda #14
sta sprite3_color
sta sprite4_color

lda #%00011111
sta enable_sprites

lda #99
sta sprite0_x
sta sprite0_y
sta sprite1_y
sta sprite2_x

lda #130
sta sprite1_x
sta sprite2_y
sta sprite3_x
sta sprite3_y

lda #150
sta sprite4_x
sta sprite4_y

lda #%00001100
sta sprite_height_ptr

lda #%00011000
sta sprite_width_ptr

ldx #$80

delay:  lda #$fb    // wait for vertical retrace
loop2:  cmp raster_ptr   // until it reaches 251th raster line ($fb)
        bne loop2   // which is out of the inner screen area

        inc counter // increase frame counter
        lda counter // check if counter
        cmp #6      // reached 6
        bne out     // if not, pass the switching routine

        lda #$00    // reset
        sta counter // counter

loop:	
		stx sprite0_pointer
		stx sprite1_pointer
		stx sprite2_pointer
		stx sprite3_pointer
		stx sprite4_pointer

		inx
	
		cpx #$83
		beq reset_sprite_loop
		
		jmp delay

reset_sprite_loop:
		ldx #$80
		jmp delay		
out:
        lda raster_ptr // make sure we reached
loop3:  cmp raster_ptr // the next raster line so next time we
        beq loop3 // should catch the same line next frame

        jmp delay

*=$2000
// sprite 0 / singlecolor / color: $01
sprite_0:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$f8,$00,$00,$84,$00,$01
.byte $94,$00,$01,$04,$00,$11,$88,$00
.byte $08,$f8,$00,$04,$40,$00,$03,$e0
.byte $00,$00,$90,$00,$01,$08,$00,$03
.byte $00,$00,$03,$c0,$00,$02,$20,$00
.byte $0c,$20,$00,$30,$40,$00,$20,$60
.byte $00,$00,$00,$00,$00,$00,$00,$01

*=$2040
// sprite 1 / singlecolor / color: $01
sprite_1:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$f8,$00,$00,$84,$00,$01
.byte $94,$00,$01,$04,$00,$01,$88,$00
.byte $00,$f8,$00,$0c,$40,$00,$03,$c0
.byte $00,$00,$a0,$00,$01,$a0,$00,$03
.byte $18,$00,$03,$00,$00,$02,$80,$00
.byte $0c,$80,$00,$31,$00,$00,$21,$00
.byte $00,$02,$00,$00,$03,$00,$00,$01

*=$2080
// sprite 2 / singlecolor / color: $01
sprite_2:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$f8,$00,$00,$84,$00,$01
.byte $94,$00,$01,$04,$00,$01,$88,$00
.byte $00,$f8,$00,$00,$40,$00,$03,$c0
.byte $00,$04,$a0,$00,$09,$a0,$00,$03
.byte $18,$00,$03,$00,$00,$03,$80,$00
.byte $01,$40,$00,$01,$20,$00,$01,$18
.byte $00,$02,$00,$00,$03,$00,$00,$01

*=$20c0
// sprite 3 / singlecolor / color: $01
sprite_3:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$f0,$00,$00,$88,$00,$01
.byte $94,$00,$01,$04,$00,$01,$8c,$00
.byte $00,$f8,$00,$0c,$40,$00,$03,$c0
.byte $00,$00,$a0,$00,$01,$a0,$00,$03
.byte $18,$00,$03,$00,$00,$02,$80,$00
.byte $04,$80,$00,$08,$40,$00,$10,$30
.byte $00,$18,$00,$00,$00,$00,$00,$01
