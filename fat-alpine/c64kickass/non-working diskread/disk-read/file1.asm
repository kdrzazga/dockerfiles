.const disableCommodoreKey = 657
.const lowerUpperCase = 53272
.const KernalGetInput = $ffe4
.const KernalLOAD = $ffd5

//file
.const logicalNumber = 2
.const deviceNumber = 8
.const secondaryAddress = 0
.const KernalSETLFS = $ffba
.const KernalSETNAM = $ffbd
:BasicUpstart2(start)


start:

    lda #10000000
    sta disableCommodoreKey
    lda #23
    sta lowerUpperCase

    ldx #$00
    petla:	lda tekst, x
    		sta $0400, x
    		inx
    		cpx #(end-tekst)
    		bne petla

    WAIT_KEY:
            jsr KernalGetInput
            beq WAIT_KEY

    lda #logicalNumber
    ldx #deviceNumber
    ldy #secondaryAddress
    jsr KernalSETLFS

    lda #4
    ldx #<filename
    ldy #>filename
    jsr KernalSETNAM

    lda #0
    ldx #$00
    ldy #$04
    jsr KernalLOAD

WAIT_KEY2:
            jsr KernalGetInput
            beq WAIT_KEY2
    rts

    tekst:	.text "Manfred said prayers. As usual they were addressed to the Holy Lady. Who else than the Virgin Mary, his order took the name from, could help him? He was a northern crusader, a Teutonic Knight. His cape was white and as clean the Holy Virgin."
            .fill 14, 32
    end:	.byte 0
    filename:
        .text "text"
    end_filename: .byte 0

    .print "End file1: $" + toHexString(*) + " [" + * +"]"
    * = $0a00