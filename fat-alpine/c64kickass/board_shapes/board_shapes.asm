#import "../_lib.asm"
BasicUpstart2(start)

.const SCREEN_CTRL_REG = $d011
.const MEM_SETUP_REG = $d018
.const FRAME_COLOR = $d020
.const sprite0_ptr = $07f8
.const multicolor = $d01c
.const height = $d01d
.const width = $d017
.var counter = 0

start:	sei
		lda #%00110000 //Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, Bit #5: 0 = Text mode; 1 = Bitmap mode.
		sta SCREEN_CTRL_REG
		lda #%00011000 //Bits #1-#3: In text mode, pointer to character memory (bits #11-#13) %100, 4: $2000-$27FF, 8192-10239., %101, 5: $2800-$2FFF, 10240-12287. %110, 6: $3000-$37FF, 12288-14335
		sta MEM_SETUP_REG
		lda #BLACK
		sta FRAME_COLOR
		ldx #0
		lda #BLACK | (WHITE<<4)
!loop:	sta $0400,x
		sta $0500,x
		sta $0600,x
		sta $0700,x
		inx
		bne !loop-

		wait 30
		
copy:
		.var src = $4000 + counter
		.var dst = $2000 + counter
		
		lda src
		sta dst
		inc counter

		.if (counter > 7999) jmp end
		jmp copy
		
end:	
		jsr setup_sprites
		jmp *

setup_sprites:

lda #$04 // sprite multicolor 1
sta $d025
lda #$07 // sprite multicolor 2
sta $d026		

	poke enable_sprites:#$ff
	
	ldy #$00
	
!loop:
	lda sprite_triange, y
	sta 12800, y
	iny
	cpy #(8*8)
	bne !loop-
	
	poke sprite0_color:#7 //body
	poke sprite0_ptr:#200
	poke sprite0_x:#44
	poke sprite0_y:#200
	poke multicolor:#1
	poke height:#1
	poke width:#1
	
	rts

// sprite 0 / multicolor / color: $01
sprite_triange:
.byte $00,$3c,$00,$00,$14,$00,$00,$d7
.byte $00,$00,$d7,$00,$00,$d7,$00,$00
.byte $55,$00,$03,$69,$c0,$03,$69,$c0
.byte $03,$69,$c0,$01,$69,$40,$0d,$aa
.byte $70,$0d,$96,$70,$0d,$96,$70,$05
.byte $96,$50,$36,$96,$9c,$36,$55,$9c
.byte $36,$55,$9c,$16,$55,$94,$da,$aa
.byte $a7,$d5,$55,$57,$ff,$ff,$ff,$81

// sprite 1 / multicolor / color: $01
sprite_circle:
.byte $00,$28,$00,$02,$96,$80,$09,$55
.byte $60,$09,$ff,$60,$09,$ff,$60,$25
.byte $eb,$58,$27,$eb,$d8,$27,$96,$d8
.byte $27,$96,$d8,$97,$96,$d6,$9f,$96
.byte $f6,$97,$96,$d6,$27,$96,$d8,$27
.byte $96,$d8,$27,$eb,$58,$25,$eb,$58
.byte $09,$ff,$60,$09,$ff,$60,$09,$55
.byte $60,$02,$96,$80,$00,$28,$00,$81

// sprite 2 / multicolor / color: $01
sprite_rect:
.byte $aa,$aa,$aa,$aa,$aa,$aa,$a5,$55
.byte $aa,$a5,$55,$6a,$a6,$55,$6a,$a5
.byte $95,$5a,$a5,$65,$5a,$a5,$59,$5a
.byte $a5,$56,$5a,$a5,$55,$9a,$a5,$56
.byte $5a,$a5,$59,$5a,$a5,$65,$5a,$a5
.byte $95,$5a,$a6,$55,$5a,$a5,$95,$5a
.byte $a5,$65,$5a,$a9,$59,$5a,$a9,$56
.byte $5a,$aa,$55,$5a,$aa,$aa,$aa,$81

*=$2000 "Picture 1"
.import c64 "board.prg" //320x200 hi-res picture occupies 320x200=64000 pixels / 8 bits per byte = 8000 bytes = $1f40
