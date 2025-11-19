#import "PseudoCmds.lib"

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

poke 53280 : #0
poke 53281 : 53280 //content of 53280

.for(var i = 0; i < allSprites.size(); i++){
    poke $d000 + 2*i : #allSprites.get(i).x
    poke $d001 + 2*i : #allSprites.get(i).y

    poke $d027 + i: #allSprites.get(i).color
}

poke $d015 : #%11111111

rts

