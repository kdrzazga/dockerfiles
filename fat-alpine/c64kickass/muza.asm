.var music = LoadSid("Everlasting_Love.sid")
:BasicUpstart2(start)
start:
    ldx #0
    ldy #0
    lda #music.startSong-1
    jsr music.init
    sei
    lda #<irq1
    sta $0314
    lda #>irq1
    sta $0315
    asl $d019   //Interrupt status register
    lda #%01111011
    sta $dc0d   //Interrupt control and status register.
    lda #%10000001
    sta $d01a   //Interrupt control register
    lda #$1b
    sta $d011   //Screen control register #1
    lda #%10000000
    sta $d012   //Raster line to generate interrupt at (bits #0-#7).
    cli
this:
    inc 1024
    jmp this

irq1:
    asl $d019   //Interrupt status register
    jsr music.play
    pla
    tay
    pla
    tax
    pla

rti

.pc=music.location "Music"
.fill music.size, music.getData(i)
