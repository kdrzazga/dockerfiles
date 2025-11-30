BasicUpstart2(mainProg)

.const scrollLine = $0400+24*40

.const screenRamArea = $2800
.const colorRamArea = $2be8

			*=$0810 "MAIN PROGRAM"

mainProg: 	{								// <- Here we define a scope
           lda #WHITE
           sta 53280
           sta 646
           lda #LIGHT_BLUE
           sta 53281

copy_data_loop:
            .for (var i = 0; i < 4; i++){
                lda screenRamArea +256*i, x
                sta 1024 + 256*i, x

                lda colorRamArea +256*i, x
                sta $d800 + 256*i, x
            }
            inx
            bne copy_data_loop

			sei
			lda #$18
			sta $d018

			// Wait for line $f2 and set d016	
loop1:		lda #$f2							//<- Here we define 'loop1'
			cmp $d012
			bne loop1
			jsr setScrollD016
			
			// Wait for line $ff and prepare next frame 
loop2:		lda #$ff							// <- Inside the scope labels can collide so we use 'loop2'	
			cmp $d012
			bne loop2
			lda #$c8
			sta $d016
			jsr moveScroll
			
			jmp loop1
}
//----------------------------------------------------
// 			Scroll Routines
//----------------------------------------------------

setScrollD016:	{
value:		lda #0									
			and #$07
			ora #$c0
			sta $d016
			rts			
}

moveScroll: {
			// Step d016
			dec setScrollD016.value+1			//<- We can access labels of other scopes this way!				
			lda setScrollD016.value+1
			and #$07
			cmp #$07
			bne exit
			
			// Move screen chars
			ldx #0
loop1:		lda scrollLine+1,x					// <- Since 'loop1' is in a new scope it doesn't collide with the first 'loop1' label 
			sta scrollLine,x
			inx
			cpx #39
			bne loop1
			
			// Print new char
count:		ldx #0
			lda text,x
			//adc #$81 //make chars reverse
			sta scrollLine+39	
			inx 
			lda text,x
			cmp #$ff
			bne over1
			ldx #0
over1:		stx count+1
			
exit:		rts
			
text:		.text "merry christmats everyone!!! merry christmas, not happy holidays! god bless ya all. spend this festive time among your closest family and friends!"
			.byte 32, 32, $ff
}

#import "charset.asm"
#import "data.asm"
