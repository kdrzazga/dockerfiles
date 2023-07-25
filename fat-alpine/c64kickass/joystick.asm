*=$0801
 
  .byte $0C,$08,$40,$00,$9E,$20,$32,$30,$36,$32,$00,$00,$00 // BASIC CODE: 1024 SYS 2062
 
  jsr $E544       // clear screen
  jsr info
  
input_left_check:
  lda #$04                // mask left movement (4 == bit 3 == %0000 0100)
  bit $DC01               // bitwise "and" with joystick port 1
  bne input_right_check  // if not active (==1), go to .input_right_check
  
  lda #$4c                // load character 'l' into register A
  jsr $FFD2               // print character to screen
  
input_right_check:
  lda #$08                // mask left movement (8 == bit 4 == %0000 1000)
  bit $DC01               // bitwise "and" with joystick port 1
  bne input_up_check   // if not active (==1), go to .input_up_check
  
  lda #$52                // load character 'l' into register A
  jsr $FFD2               // print character to screen
  
input_up_check:
  lda #$01                // mask left movement (1 == bit 1 == %0000 0001)
  bit $DC01               // bitwise "and" with joystick port 1
  bne input_down_check   // if not active (==1), go to .input_down_check
  
  lda #$55                 // load character 'u' into register A
  jsr $FFD2               // print character to screen
 
input_down_check:
  lda #$02                // mask left movement (2 == bit 2 == %0000 0010)
  bit $DC01               // bitwise "and" with joystick port 1
  bne input_fire_check   // if not active (==1), go to .input_fire_check
  
  lda #$44                // load character 'd' into register A
  jsr $FFD2               // print character to screen
 
input_fire_check:
  lda #$10                // mask left movement (16 == bit 5 == %0001 0000)
  bit $DC01               // bitwise "and" with joystick port 1
  bne input_left_check   // if not active (==1), go back to .input_left_check
  
  // else print F (for FIRE)
  lda #$46                // load character 'F' into register A
  jsr $FFD2               // print character to screen
  
  jmp input_left_check   // go back to .input_left_check to start over
  
info:
	ldx #$00
txt_loop:	
	lda message, x
	sta $0400 + 3*40, x
	inx
	cpx #40
	bne txt_loop  
  rts
  
  message:
	.text "move joystick and direction will appear"
	