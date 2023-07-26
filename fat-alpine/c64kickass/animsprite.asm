.const enable_sprites = $d015
.const sprite0_pointer = $07f8
.const sprite0_x = $d000
.const sprite0_y = $d001
.const sprite0_color = $d027

//10 SYS2061
*=$0801
    .byte $0B, $08, 10, $00, $9E
	.text "2061"
	.byte $00, $00, $00

*=2061

lda #$80
sta sprite0_pointer

lda #3
sta sprite0_color

lda #%00000001
sta enable_sprites

lda #99
sta sprite0_x
sta sprite0_y
rts

wait:  lda #$fb    // wait for vertical retrace
loop2:  cmp $d012   // until it reaches 251th raster line ($fb)
        bne loop2   // which is out of the inner screen area
		rts

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
