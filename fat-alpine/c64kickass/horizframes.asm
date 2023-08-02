#import "_lib.asm"
//Opening the top + bottom borders
//inside an IRQ interrupt player
.pc = $0801
:BasicUpstart(init)
.pc = $0810
init:
		 jsr print_info
		
         sei
         lda #RED
         sta frame
         lda #BLACK
         sta background
         lda #<irq1
         sta $314
         lda #>irq1
         sta $315
         lda #$7f
         sta $dc0d
         lda #$1b
         sta $d011
         lda #$01
         sta $d01a
         cli
         jmp main
		 
irq1:    inc $d019
         lda #$00
         sta $d012
         lda #$00
         sta $d011
         lda #<irq2
         sta $314
         lda #>irq2
         sta $315
         jmp $ea7e
		 
irq2:    inc $d019
         lda #$fa
         sta $d012
         lda #$1b //If you want to display a bitmap pic, use #$3b instead
         sta $d011
         lda #<irq1
         sta $314
         lda #>irq1
         sta $315
         jmp $ea7e

main:
		jsr init_sprites
		
		
		lda #%11111111
		sta enable_sprites
	
		// set x and y position
		lda #$80
		sta $d000
		sta $d002
	
		lda #220
		sta $d001
		sta $d004
		sta $d005
		
		lda #15
		sta $d003		
loop:
		inc $d001
		dec $d002
		dec $d004
		dec $d005
		inc $d029
		wait 1
		jmp loop

print_info:
	
	ldx #$00
txt_loop:	
	lda message, x
	sta $0400 + 14*40, x
	inx
	cpx #(24 + 16 + 65)
	bne txt_loop
	rts

message:
.text "displayed are 3 sprites."
.fill 16, 32
.text "now you know that frame is necessary forc64 to avoid twin-sprites" 

#import "default-sprites.asm"
