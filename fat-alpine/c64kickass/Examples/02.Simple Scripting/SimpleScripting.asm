/**********************************************
		Simple script demo
************************************************/

.print "Hello World!"				// <- .print outputs to the console
.print ""

.print "Lets do a countdown:"
.for (var i=10; i>0; i--)			// <- For and while loops works like in other programming languages
	.print i
.print ""


.var x = 10.5						// <- This is how we define variables (we also did it in the for-loop)			
.const y = 3						// <- y is a constant 
.print "x*y-5=" + (x*y-5)
.print ""

.var list = List().add("Bill", "Joe", "Edgar")		// <- We can also use structures like lists and hashtables
.print "Who is at place number 2:" + list.get(2)
.print ""


// Several commands can be written on the same line by using ';'
.var a = 10; .var b = 20; .var c = sqrt(pow(a,2)+ pow(b,2))			// <- We also have the entire java math library
.print "Pythagoras says that c is " + c
.print ""

.print "Sinus:"
.var i=0;
.var spaceStr = "                          ";
.while (i++<10) {
	.var x = 5+5*sin(i*2*PI/10)
	.print spaceStr.substring(0,x)+"o"	
}

.print "You can easily handle all sprites:"

.struct Sprite{id, x, y, color}

.var sprite1 = Sprite(1, 50, 50, RED)
.var sprite2 = Sprite(2, 50, 100, WHITE)
.var sprite3 = Sprite(3, 100, 50, YELLOW)
.var sprite4 = Sprite(4, 100, 100, LIGHT_BLUE)
.var sprite5 = Sprite(5, 50, 150, CYAN)
.var sprite6 = Sprite(6, 100, 150, PURPLE)
.var sprite7 = Sprite(7, 150, 50, ORANGE)
.var sprite8 = Sprite(8, 150, 100, LIGHT_GRAY)

.var allSprites = List().add(sprite1, sprite2, sprite3, sprite4, sprite5, sprite6, sprite7, sprite8)
:BasicUpstart2(start)

start:

.for(var i = 0; i < allSprites.size(); i++){
    lda #allSprites.get(i).x
    sta $d000 + 2*i
    lda #allSprites.get(i).y
    sta $d001 + 2*i

    lda #allSprites.get(i).color
    sta $d027 + i
}

lda #%11111111
sta $d015

rts


