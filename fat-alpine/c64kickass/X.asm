#import "_lib.asm"

.const screenptr = $20
.var x0 = $40
.var x1 = $41
.var yf = $60

:BasicUpstart2(entry)

entry: 
        lda #0
        sta x0
        sta $d020
        sta $d021

        // kernal clear screen
        jsr $e544

        // set screenptr = $0400
        lda #<$0400
        sta screenptr+0
        lda #>$0400
        sta screenptr+1

        lda #80
        sta yf

        lda #39
        sta x1
xloop:
		jsr w8
        lda #$a0
        ldy x0
        // screenRAM[x] = 0xA0
        sta (screenptr), y
        ldy x1
        // screenRAM[39-x] = 0xA0
        sta (screenptr), y

        clc
        lda #160  // line slope
        adc yf
        sta yf
        bcc no_add

        // advance screen ptr by 40
        clc
        lda screenptr
        adc #40
        sta screenptr
        lda screenptr+1
        adc #0
        sta screenptr+1

no_add:
        inc x0
        dec x1
        bpl xloop

		wait 255
		jmp reset

w8:
	wait 15
	rts
	