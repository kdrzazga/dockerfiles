.const BG_FRAME =$d020
.const SCREEN_TOGGLE =$d011
.const RASTER_POSITION =$d012
.const RASTER_START = $7a

*=$0801

.byte $0d,$08 //signature
.byte 10 // (line number 10)
.byte $00,$9e //sys
.text "2061"
.byte 0,0,0

*=2061
		sei
		
		lda #$00
		sta BG_FRAME
        sta SCREEN_TOGGLE

main:
        ldy #RASTER_START
        ldx 0

loop:   lda colors, x
        cpy RASTER_POSITION
        bne *-3

        sta BG_FRAME

        cpx #51
        beq main

        inx
        iny

        jmp loop

colors:
  .byte $06,$06,$06,$0e,$06,$0e
  .byte $0e,$06,$0e,$0e,$0e,$03
  .byte $0e,$03,$03,$0e,$03,$03
  .byte $03,$01,$03,$01,$01,$03
  .byte $01,$01,$01,$03,$01,$01
  .byte $03,$01,$03,$03,$03,$0e
  .byte $03,$03,$0e,$03,$0e,$0e
  .byte $0e,$06,$0e,$0e,$06,$0e
  .byte $06,$06,$06,$00,$00,$00

  .byte $ff
