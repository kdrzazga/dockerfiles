package main

import (
	"fmt"
	"math/rand"
	"time"
)

type Player struct {
	X, Y int
}

type Field int

const (
	Empty Field = iota
	Crate
	PlayerField
	GoalField
	Wall
)

type Board struct {
	Fields [][]Field
}

type Game struct {
	Board  *Board
	Player *Player
}

func GenerateBoard(width, length, crates, walls int) *Board {
	board := &Board{
		Fields: make([][]Field, length),
	}

	for i := range board.Fields {
		board.Fields[i] = make([]Field, width)
	}

rand.Seed(time.Now().UnixNano())

	x := rand.Intn(width - crates)
	y := rand.Intn(length - 3 + 1) // Adjusted to ensure three rows are within bounds
	row := 0
	
	for i := 0; i < crates; i++ {
		board.Fields[y+row][x+i] = GoalField
	
		if (i+1)%3 == 0 {
			x = rand.Intn(width - crates) // Reset x to a random value
			row++
		}
	}
	
	for i := 0; i < walls; i++ {
		x := rand.Intn(width)
		y := rand.Intn(length)

		board.Fields[y][x] = Wall
	}

	for i := 0; i < crates; i++ {
		x := rand.Intn(width)
		y := rand.Intn(length)

		if board.Fields[y][x] == Empty {
			board.Fields[y][x] = Crate
		} else {
			i--
		}
	}

	playerX := rand.Intn(width)
	playerY := rand.Intn(length)

	if board.Fields[playerY][playerX] == Empty {
		board.Fields[playerY][playerX] = PlayerField
	} else {
		return GenerateBoard(width, length, crates, walls)
	}

	return board
}

func PrintBoard(board *Board) {
	for _, row := range board.Fields {
		for _, field := range row {
			switch field {
			case Empty:
				fmt.Print(" ")
			case Crate:
				fmt.Print("C")
			case PlayerField:
				fmt.Print("P")
			case GoalField:
				fmt.Print("G")
			case Wall:
				fmt.Print("#")
			}
		}
		fmt.Println()
	}
}