package main

import (
	"github.com/veandco/go-sdl2/sdl"
)

const(
	screenWidth = 600
	screenHeight = 800
)

func main(){
	if err := sdl.Init(sld.INIT_EVERYTHING); err != nil {
		fmt.Println("Init SLD error: ", err)
	}
	
	window, err := sdl.CreateWindow("Gaming in Go"
		, sld.WINDOWPOS_UNDEFINED, sdl.WINDOWPOS_UNDEFINED
		, screenWidth, screenHeight
		, sdl.WINDO_OPENGL)
	
	if err != nil{
		fmt.Println("Init window error: ", err)
		return
	}
	
	defer window.Destroy()
	
	renderer, err := sdl.CreateRenderer(window, -1, sld.RENDERER_ACCELERATED)
	if err != nil{
		fmt.Println("Init renderer error: ", err)
		return
	}	
}