.const sys = $9e00
.const init_basic = $080b
.const ML = 7922
*=$0801
    .word init_basic
	.byte 10
	.word sys
	.text "2061"
	.byte $00, $00, $00

*=2061
lda #3
sta 251
lda #1
sta 252

jsr ML

//--------------------------------------------------------------------

//This routine sets or erases a point on the hires screen based
//on coordinates and drawmode determined before-hand.  you can change
//"screen" to wherever your hires screen is located.
//plotPoint works by first determining which 8x8 cell the point is
//located in and uses tables to figure that out.
//The in-cell offset is determined by just isolating the lowest 3 bits
//of each point (0-7).  The pixel masking uses tables, too.

//--------------------------------------------------------------------

pointX:                   //0-319
.word 100

pointY:                   //0-199
.byte 100

drawmode:                 //0 = erase point, 1 =set point
.byte 1

.const screen = $2000              //for example
.const dest = $fb

//--------------

plotPoint:

//-------------------------
//calc Y-cell, divide by 8
//y/8 is y-cell table index
//-------------------------
lda pointY
lsr                         /// 2
lsr                         /// 4
lsr                         /// 8
tay                         //tbl_8,y index

//------------------------
//calc X-cell, divide by 8
//divide 2-byte pointX / 8
//------------------------
ror pointX+1                //rotate the high byte into carry flag
lda pointX
ror                         //lo byte / 2 (rotate C into low byte)
lsr                         //lo byte / 4
lsr                         //lo byte / 8
tax                         //tbl_8,x index

//----------------------------------
//add x & y to calc cell point is in
//----------------------------------
clc

lda tbl_vbaseLo,y           //table of screen row base addresses
adc tbl_8Lo,x               //+ (8 * Xcell)
sta dest                    //= cell address

lda tbl_vbaseHi,y           //do the high byte
adc tbl_8Hi,x
sta dest+1

//---------------------------------
//get in-cell offset to point (0-7)
//---------------------------------
lda pointX                  //get pointX offset from cell topleft
and #%00000111              //3 lowest bits = (0-7)
tax                         //put into index register

lda pointY                  //get pointY offset from cell topleft
and #%00000111              //3 lowest bits = (0-7)
tay                         //put into index register

//----------------------------------------------
//depending on drawmode, routine draws or erases
//----------------------------------------------

lda drawmode                //(0 = erase, 1 = set)
beq erase                   //if = 0 then branch to clear the point

//---------
//set point
//---------
lda (dest),y                //get row with point in it
ora tbl_orbit,x             //isolate and set the point
sta (dest),y                //write back to screen
jmp past                    //skip the erase-point section

//-----------
//erase point
//-----------
erase:                    //handled same way as setting a point
lda (dest),y                //just with opposite bit-mask
and tbl_andbit,x            //isolate and erase the point
sta (dest),y                //write back to screen

past:
rts

//----------------------------------------------------------------

tbl_vbaseLo:
.byte <screen+(0*320),screen+(1*320),screen+(2*320),screen+(3*320)
.byte <screen+(4*320),screen+(5*320),screen+(6*320),screen+(7*320)
.byte <screen+(8*320),screen+(9*320),screen+(10*320),screen+(11*320)
.byte <screen+(12*320),screen+(13*320),screen+(14*320),screen+(15*320)
.byte <screen+(16*320),screen+(17*320),screen+(18*320),screen+(19*320)
.byte <screen+(20*320),screen+(21*320),screen+(22*320),screen+(23*320)
.byte <screen+(24*320)

tbl_vbaseHi:
.byte >screen+(0*320),screen+(1*320),screen+(2*320),screen+(3*320)
.byte >screen+(4*320),screen+(5*320),screen+(6*320),screen+(7*320)
.byte >screen+(8*320),screen+(9*320),screen+(10*320),screen+(11*320)
.byte >screen+(12*320),screen+(13*320),screen+(14*320),screen+(15*320)
.byte >screen+(16*320),screen+(17*320),screen+(18*320),screen+(19*320)
.byte >screen+(20*320),screen+(21*320),screen+(22*320),screen+(23*320)
.byte >screen+(24*320)

tbl_8Lo:
.byte <0*8,1*8,2*8,3*8,4*8,5*8,6*8,7*8,8*8,9*8
.byte <10*8,11*8,12*8,13*8,14*8,15*8,16*8,17*8,18*8,19*8
.byte <20*8,21*8,22*8,23*8,24*8,25*8,26*8,27*8,28*8,29*8
.byte <30*8,31*8,32*8,33*8,34*8,35*8,36*8,37*8,38*8,39*8

tbl_8Hi:
.byte >0*8,1*8,2*8,3*8,4*8,5*8,6*8,7*8,8*8,9*8
.byte >10*8,11*8,12*8,13*8,14*8,15*8,16*8,17*8,18*8,19*8
.byte >20*8,21*8,22*8,23*8,24*8,25*8,26*8,27*8,28*8,29*8
.byte >30*8,31*8,32*8,33*8,34*8,35*8,36*8,37*8,38*8,39*8

tbl_orbit:
.byte %10000000
.byte %01000000
.byte %00100000
.byte %00010000
.byte %00001000
.byte %00000100
.byte %00000010
.byte %00000001

tbl_andbit:
.byte %01111111
.byte %10111111
.byte %11011111
.byte %11101111
.byte %11110111
.byte %11111011
.byte %11111101
.byte %11111110
