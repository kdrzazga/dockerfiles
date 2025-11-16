.const disableCommodoreKey = 657
.const lowerUpperCase = 53272
//:BasicUpstart2(start)

*=$0a00
start:

    lda #10000000
    sta disableCommodoreKey
    lda #23
    sta lowerUpperCase

    ldx #$00
    petla:	lda tekst, x
    		sta $0400 + (8*40), x
    		inx
    		cpx #(end-tekst)
    		bne petla
    		rts

    tekst:	.text "It was decorated with black cross. Dark as souls of pagans from this cursed, wet country, thought he.He wanted to bring the light of faith to this unholy land. And the only way was to do it with a sword - just like the Great Master has said, he thought"
            //.fill 14, 32
    end:	.byte 0
