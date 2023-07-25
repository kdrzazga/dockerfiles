.const image0= $ce00   // first graphics piece to show
.const image1= $cf00   // second piece
.const tech=   $cd00   // x-shift
.const raster= $fa     // rasterline for the interrupt
.const dummy=  $cfff   // dummy-address for timing (refer to missing_cycles-article)

BasicUpstart2(start)
*= $c000
start:  sei             // disable interrupts
        lda #$7f        // disable timer interrupts (cia)
        sta $dc0d
        lda #$01        // enable raster interrupts (vic)
        sta $d01a
        sta $d015       // enable the timing sprite
        lda #<irq
        sta $0314       // interrupt vector to our routine
        lda #>irq
        sta $0315
        lda #raster     // set the raster compare (9th bit will be set
        sta $d012       //  inside the raster routine)
        lda #raster-20  // sprite is situated 20 lines before the interrupt
        sta $d001

        ldx #111
        ldy #0
        sty $d017       // disable y-expand
        lda #$32
        sta $01         // select character rom
loop0:
		lda $d000,x
        sta image0,y    // copy a part of the charset to be the graphics
        sta image0+112,y
        lda $d800,x
        sta image1,y
        sta image1+112,y
        iny             // until we copied enough
        dex
        bpl loop0
        lda #$37        // char rom out of the address space
        sta $01

        ldy #15
loop1:
		lda xpos,y      // take a half of a sinus and mirror it to make
        sta tech,y      //  a whole cycle and then copy it as many times
        sta tech+32,y   //   as necassary
        lda #24
        sec
        sbc xpos,y
        sta tech+16,y
        sta tech+48,y
        dey
        bpl loop1
        ldy #64
loop2:   lda tech,y
        sta tech+64,y
        sta tech+128,y
        dey
        bpl loop2
        cli             // enable interrupts
        rts             // return to basic (?)


irq:     lda #$13        // open the bottom border (top border will open too)
        sta $d011
        nop
        ldy #111	// reduce for ntsc ?
        inc dummy       // do the timing with a sprite
        bit $ea         // wait a bit (add a nop for ntsc)

loop3:   lda tech,y      // do the x-shift
        sta $d016
first:   ldx image0,y    // load the graphics to registers
second:  lda image1,y
        sta $3fff       // alternate the graphics
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        lda #0          // throw away 2 cycles (add a nop for ntsc)
        dey
        bpl loop3

        sta $3fff       // clear the graphics
        lda #8
        sta $d016       // x-scroll to normal
        lda #$1b
        sta $d011       // normal screen (be ready to open the border again)
        lda #111
        dec first+1     // move the graphics by changing the low byte of the
        bpl over        //  load instruction
        sta first+1
over:    sec
        sbc first+1
        sta second+1    // another graphics goes to opposite direction
        lda loop3+1     // move the x-shift also
        sec
        sbc #2
        and #31         // sinus cycle is 32 bytes
        sta loop3+1

        lda #1
        sta $d019       // acknowledge the raster interrupt
        jmp $ea31       // jump to the normal irq-handler

xpos:   .byte $c,$c,$d,$e,$e,$f,$f,$f,$f,$f,$f,$f,$e,$e,$d,$c
        .byte $c,$b,$a,$9,$9,$8,$8,$8,$8,$8,$8,$8,$9,$9,$a,$b
                        // half of the sinus
