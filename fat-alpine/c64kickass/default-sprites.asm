init_sprites:
	ldx #$00
petla:	lda sprite_colors, x
	sta $d027, x
	inx
	cpx #$8
	bne petla
	
    // set sprite pointer index
    // this, multiplied by $40, is the address
    // in this case, the address is $2000
    // $80 * $40 = $2000
	//sprite0:
    lda #$80
    sta $07f8

	//sprite1:
    // $81 * $40 = $2040
    lda #$81
    sta $07f9

	//sprite2:
    // $82 * $40 = $2080
    lda #$82
    sta $07fa
	
	rts

sprite_colors:
.byte $01,$05,$07,$01,$01,$01,$01,$01	

*=$2000 "sprite 0 skull"
sprite0:

.byte $00,$7c,$00,$00,$82,$00,$01,$01
.byte $00,$01,$49,$00,$01,$01,$00,$01
.byte $02,$00,$00,$b2,$00,$00,$82,$00
.byte $00,$ba,$00,$00,$aa,$00,$e0,$ba
.byte $1e,$90,$82,$12,$80,$7c,$02,$58
.byte $00,$76,$0e,$03,$c0,$03,$9c,$00
.byte $00,$f0,$00,$0f,$bc,$00,$38,$07
.byte $80,$20,$00,$f0,$c0,$00,$0e,$01

*=$2040 "sprite 1 tank"
sprite1:

.fill 8, 0
.byte $00,$40,$00,$00,$70,$00,$00,$1c
.byte $00,$00,$07,$1f,$c0,$01,$f0,$20
.byte $00,$60,$10,$00,$40,$10,$00,$40
.byte $10,$7f,$ff,$fe,$c0,$00,$03,$9f
.byte $ff,$f9,$30,$00,$05,$25,$55,$54
.byte $30,$00,$04,$1f,$ff,$f8,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01

*=$2080 "sprite 2 monster"
sprite2:

.byte $00,$00,$00,$00,$1f,$80,$01,$ff
.byte $e0,$0f,$ff,$e0,$1f,$ff,$f0,$3f
.byte $ff,$f0,$7f,$f9,$f8,$7f,$f9,$f8
.byte $7f,$ff,$fc,$ff,$ff,$fc,$ff,$ff
.byte $fe,$c3,$ff,$fe,$81,$ff,$fc,$00
.byte $ff,$fc,$00,$3f,$f8,$00,$1f,$f8
.byte $7e,$03,$fc,$3f,$ff,$fe,$1f,$ff
.byte $fe,$3f,$ff,$ff,$7c,$7e,$0f,$01
