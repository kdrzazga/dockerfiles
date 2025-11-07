.var music = LoadSid("Horse_Games.sid")
//.var music = LoadSid("Bach.sid")
//.var music = LoadSid("Warrior_of_Ras_II-Kaiv.sid")
:BasicUpstart2(start)

			.var picture = LoadBinary("kun.kla", BF_KOALA)
			//.var picture = LoadBinary("cwaniaczki.kla", BF_KOALA)
			//.var picture = LoadBinary("brownnoble.kla", BF_KOALA)

start:
            lda #$08 // sprite multicolor 1
            sta $d025
            lda #$06 // sprite multicolor 2
            sta $d026

setup_gfx: 	lda #%00111000
			sta $d018 //Memory setup register
			lda #%11011000
			sta $d016 //Screen control register #2. Bits #0-#2: Horizontal raster scroll. Bit #3: Screen width; 0 = 38 columns; 1 = 40 columns. Bit #4: 1 = Multicolor mode on.

			lda #%00111011
			sta $d011 //Screen control register #1 Bits #0-#2: Vertical raster scroll.Bit #3: Screen height; 0 = 24 rows; 1 = 25 rows Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, normal screen contents are visible.
			lda #BLACK
			sta $d020
			lda #picture.getBackgroundColor()
			sta $d021
			ldx #0

loop1:		.for (var i=0; i<4; i++) {
				lda colorRam+i*$100,x
				sta $d800+i*$100,x
			}
			inx
			bne loop1

play_music:
		
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
            lda #%00111011
            sta $d011   //Screen control register #1 - watch for conflict with value from lines 16 (16&17)
            lda #%10000000
            sta $d012   //Raster line to generate interrupt at (bits #0-#7).
            cli

this:
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

// sprite 0 / singlecolor / color: $03
sprite_0:
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00001010,%00000000,%00000000
.byte %00001100,%00000000,%00000000
.byte %00010110,%00000000,%00000000
.byte %01111110,%00000000,%00111000
.byte %01111111,%11111111,%11000100
.byte %00000001,%11111111,%11100100
.byte %00000001,%11111111,%11110000
.byte %00000000,%10010000,%10010000
.byte %00000000,%10010000,%10010000
.byte %00000000,%10010000,%10010000
.byte %00000000,%10010000,%10010000
.byte %00000001,%10010000,%10010000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000

// sprite 1 / singlecolor / color: $00
sprite_1:
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00111000,%00000000
.byte %00000000,%01011100,%00000000
.byte %00000000,%01111100,%00000000
.byte %00000000,%00111000,%00000000
.byte %00000000,%00010000,%00000000
.byte %00000000,%00111000,%00000000
.byte %00000000,%01011000,%00000000
.byte %00000001,%10011000,%00000000
.byte %00000000,%00011000,%00000000
.byte %00000000,%00011000,%00000000
.byte %00000000,%00111100,%00000000
.byte %00000000,%01111000,%00000000
.byte %00000000,%11000000,%00000000
.byte %00000000,%10000000,%00000000
.byte %00000001,%10000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000

// sprite 2 / singlecolor / color: $01
*=($87 * $40) "sprite 2"
sprite_2:
.byte %00000000,%00111000,%00000000
.byte %00000001,%11111111,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00100000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000
.byte %00000000,%00000000,%00000000

*=$0c00	"ScreenRam"; 			.fill picture.getScreenRamSize(), picture.getScreenRam(i)
*=$1c00	"ColorRam:"; colorRam: 	.fill picture.getColorRamSize(), picture.getColorRam(i)
*=$2000	"Bitmap";				.fill picture.getBitmapSize(), picture.getBitmap(i)

.print "End bitmap = $" + toHexString(*)
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

