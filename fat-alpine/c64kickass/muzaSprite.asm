.var music = LoadSid("Everlasting_Love.sid")
:BasicUpstart2(start)
start:

    jsr init_sprites
    lda #%11111111
    sta $d015

    // set x and y position
    lda #$80
    sta $d000
    sta $d001

    lda #$a0
    sta $d002
    sta $d003

    lda #$c0
    sta $d004
    sta $d005
    //-------

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
	inc $d000
	dec $d002
	dec $d002
	dec $d004
rti

counter: .byte 00

#import "default-sprites.asm"

.pc=music.location "Music"
.fill music.size, music.getData(i)

.print ""
.print "SID Data"
.print "--------"
.print "location=$"+toHexString(music.location)
.print "init=$"+toHexString(music.init)
.print "play=$"+toHexString(music.play)
.print "songs="+music.songs
.print "startSong="+music.startSong
.print "size=$"+toHexString(music.size)
.print "name="+music.name
.print "author="+music.author
.print "copyright="+music.copyright
.print ""
.print "Additional tech data"
.print "--------------------"
.print "header="+music.header
.print "header version="+music.version
.print "flags="+toBinaryString(music.flags)
.print "speed="+toBinaryString(music.speed)
.print "startpage="+music.startpage
.print "pagelength="+music.pagelength

