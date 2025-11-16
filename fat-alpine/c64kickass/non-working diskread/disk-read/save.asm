:BasicUpstart2(start)

start:
lda #1
ldx #8
ldy #0
jsr $ffba
lda #3
ldx #<tytul
ldy #>tytul
jsr $ffbd
lda #$04
sta $fc
lda #$04
sta $fd
lda #0
ldx $e8
jsr $ffd8
rts

tytul: .text "K&A"
