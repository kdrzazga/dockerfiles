//This is adapted version of program from Commodore & Amiga 3/1993, page 26
//Article 'O skutecznym przerwan sposobie' by Bartlomiej Kachniarz

BasicUpstart2(start)
		* = $2710
start:	sei
		lda #<irq2
		sta $0314
		lda #>irq2
		sta $0315
		cli
		rts
//------------------------

irq2:	ldx #$00
petla:	lda tekst, x
		sta $0400, x
		inx
		cpx #$0a
		bne petla
		jmp $ea31

tekst:	.text "robin hood"
