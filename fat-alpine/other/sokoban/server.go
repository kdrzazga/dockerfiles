// go run  logic.go server.go

package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

type Controller struct {
	Game *Game
}

func NewController() *Controller {
	board := &Board{
		Fields: [][]Field{
			{Empty, Empty, Empty},
			{PlayerField, GoalField, Empty},
			{Empty, Crate, Empty},
		},
	}

	player := &Player{
		X: 1,
		Y: 0,
	}

	game := &Game{
		Board:  board,
		Player: player,
	}

	return &Controller{
		Game: game,
	}
}

func ValidateMethod(handler http.HandlerFunc, allowedMethods ...string) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		for _, method := range allowedMethods {
			if r.Method == method {
				handler(w, r)
				return
			}
		}
		log.Println("Method not allowed")
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
	}
}

func AuthMiddleware(handler http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		username, password, _ := r.BasicAuth()
		if username != "user1" || password != "pass1" {
			log.Println("Unauthorized")
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}

		handler(w, r)
	}
}

func (c *Controller) StartGame(w http.ResponseWriter, r *http.Request) {
	log.Println("StartGame request")
	// Implement your logic to start the game here
}

func (c *Controller) GameStatus(w http.ResponseWriter, r *http.Request) {
	log.Println("Get Game Status request")
	// Implement your logic to get the game status here
}

func (c *Controller) GetInfo(w http.ResponseWriter, r *http.Request) {
	log.Println("Get info")
	
	list := []string{"Avaialble endpoints:", "", "GET /", "POST /start-game", "GET /game-status", "GET /board", "POST /move/up", "POST /move/down", "POST /move/left", "POST /move/right"}

	w.WriteHeader(http.StatusOK)
	
	for _, item := range list {
		w.Write([]byte(item + "\n"))	
		fmt.Println(item)
	}
}

func (c *Controller) GetBoard(w http.ResponseWriter, r *http.Request) {
	log.Println("Get Board request")
	// Implement your logic to get the board here
}

func (c *Controller) MoveUp(w http.ResponseWriter, r *http.Request) {
	log.Println("Move up request")
	// Implement your logic to move the player up here
}

func (c *Controller) MoveDown(w http.ResponseWriter, r *http.Request) {
	log.Println("Move down request")
	// Implement your logic to move the player down here
}

func (c *Controller) MoveLeft(w http.ResponseWriter, r *http.Request) {
	log.Println("Move left request")
	// Implement your logic to move the player left here
}

func (c *Controller) MoveRight(w http.ResponseWriter, r *http.Request) {
	log.Println("Move right request")
	// Implement your logic to move the player right here
}

func (c *Controller) Quit(w http.ResponseWriter, r *http.Request) {
	log.Println("BYE")
	os.Exit(0)
}

func main() {
	log.SetOutput(os.Stdout)
	log.SetFlags(log.Ldate | log.Ltime)

	fmt.Println("Starting server on 8999")
	controller := NewController()

	http.HandleFunc("/start-game", AuthMiddleware(ValidateMethod(controller.StartGame, http.MethodPost)))
	http.HandleFunc("/game-status", controller.GameStatus)
	http.HandleFunc("/board", controller.GetBoard)
	http.HandleFunc("/", controller.GetInfo)
	http.HandleFunc("/move/up", AuthMiddleware(ValidateMethod(controller.MoveUp, http.MethodPost)))
	http.HandleFunc("/move/down", AuthMiddleware(ValidateMethod(controller.MoveDown, http.MethodPost)))
	http.HandleFunc("/move/left", AuthMiddleware(ValidateMethod(controller.MoveLeft, http.MethodPost)))
	http.HandleFunc("/move/right", AuthMiddleware(ValidateMethod(controller.MoveRight, http.MethodPost)))
	http.HandleFunc("/quit", AuthMiddleware(ValidateMethod(controller.Quit, http.MethodPost)))

	board := GenerateBoard(6, 4, 3, 8)
	PrintBoard(board)

	log.Fatal(http.ListenAndServe(":8999", nil))
}
