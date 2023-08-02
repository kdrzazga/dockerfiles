#import "../_lib.asm"
BasicUpstart2(start)

//Graphic conversion with FloydSteinberg

.const SCREEN_CTRL_REG = $d011
.const MEM_SETUP_REG = $d018
.const FRAME_COLOR = $d020

start:	sei
		lda #%00111011 //Bits #0-#2: Vertical raster scroll. Bit #3: Screen height; 0 = 24 rows; 1 = 25 rows. Bit #4: 0 = Screen off, complete screen is covered by border; 1 = Screen on, normal screen contents are visible. Bit #5: 0 = Text mode; 1 = Bitmap mode.
		sta SCREEN_CTRL_REG
		lda #%00011000 //Bits #1-#3: In text mode, pointer to character memory (bits #11-#13) %100, 4: $2000-$27FF, 8192-10239., %101, 5: $2800-$2FFF, 10240-12287. %110, 6: $3000-$37FF, 12288-14335
		sta MEM_SETUP_REG
		lda #BLACK
		sta FRAME_COLOR
		ldx #0
		lda #BLACK | (WHITE<<4)
loop:	sta $0400,x
		sta $0500,x
		sta $0600,x
		sta $0700,x
		inx
		bne loop
end:
		.var src = $6000
		.var target = $2000
			
		.for(i=0 ; i< 40*200; i++){
			
		}
	
		jmp end

		*=$2000 "Picture 1"
		.var pic1 = floydSteinberg("jez3.jpg")
		.fill 40*200, pic1.get(i)
		
		*=$6000 "Picture 2"
		.var pic2 = floydSteinberg("cycki3.jpg")
		.fill 40*200, pic2.get(i)
		
		*=$8000 "Picture 3"
		.var pic3 = floydSteinberg("camel.jpg")
		.fill 40*200, pic3.get(i)


//--------------------------------------------------------------------------

.function floydSteinberg(filename) {
	.var width = 320
	.var height = 200

	.var picture = LoadPicture(filename)

	// Create intensity map
	.var intensityMap = List();
	.var maxInt = $0;
	.var minInt = $ffffff
	.for (var y=0; y<height; y++) {
		.for (var x=0; x<width; x++) {
			.var rgb = picture.getPixel(x,y)
			.var intensity = sqrt(pow(rgb&$ff,2) + pow((rgb>>8)&$ff,2) + pow((rgb>>16)&$ff,2))
			.eval intensityMap.add(intensity)
			.eval maxInt = max(maxInt, intensity)	
			.eval minInt = min(minInt, intensity)	
		}
		.eval intensityMap.add(0)	// Add extra colunn to catch overflow	
	}
	.for (var x=0; x<width+1; x++) 
		.eval intensityMap.add(0)	// Add extra row to catch overflow

	// Do Floyd-Steinberg dithering
	.var limit = (maxInt+minInt)/2
	.for (var y=0; y<height; y++) {
		.for (var x=0; x<width; x++) {
			.var int = intensityMap.get(x+y*(width+1))
			.var selectedPixel = int < limit ? 0 : 1
			.var selectedIntensity = int < limit ? minInt : maxInt
			.var error = int - selectedIntensity
			.eval intensityMap.set(x+y*(width+1), selectedPixel)

			.var idx;
			.eval idx = (x+1)+(y+0)*(width+1)
			.eval intensityMap.set(idx, intensityMap.get(idx) + error *7/16)
			.eval idx = (x-1)+(y+1)*(width+1)
			.eval intensityMap.set(idx, intensityMap.get(idx) + error *3/16)
			.eval idx = (x+0)+(y+1)*(width+1)
			.eval intensityMap.set(idx, intensityMap.get(idx) + error *5/16)
			.eval idx = (x+1)+(y+1)*(width+1)
			.eval intensityMap.set(idx, intensityMap.get(idx) + error *1/16) 
		}
	}
	
	// Convert to byteStream
	.var result = List()
	.for (var charY=0; charY<25; charY++) {
		.for (var charX=0; charX<40; charX++) {
			.for (var charRow=0;charRow<8; charRow++) {
				.var byte = 0
				.var idx = charX*8 + (charY*8+charRow)*(width+1)
				.for (var pixelNo=0;pixelNo<8; pixelNo++)
					.eval byte=byte*2+intensityMap.get(idx+pixelNo)
				.eval result.add(byte)			
			}
		}
	}
	.return result
}





