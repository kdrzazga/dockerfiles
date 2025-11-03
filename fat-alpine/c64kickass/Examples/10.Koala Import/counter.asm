BasicUpstart2(start)
		* = $2710
start:	sei
		lda #<irq2
		sta $0314
		lda #>irq2
		sta $0315
		cli
		jsr write_text
		rts
//------------------------

irq2:	
		jsr write_text
		jmp $ea31

write_text:
		ldx #$00
		lda tekst, x
		sta $0400, x
		inx
		cpx #(end-tekst)
		bne write_text
		rts

tekst:	.text "robin hood"
end:	.byte 0
