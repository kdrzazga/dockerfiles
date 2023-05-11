//nohup go run server.go > output.log 2>&1 &
//curl -X POST -H "Content-Type: application/json" -d '{"text": "Hello, server!"}' http://localhost:8080/api/message


package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Message struct {
	Text string `json:"text"`
}

func main() {
	// Define the route handlers
	http.HandleFunc("/api/message", handleMessage)
	http.HandleFunc("/", handleGet)

	// Start the server
	log.Println("Server started on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func handleGet(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}

	response := Message{Text: "USAGE:\ncurl -X POST -H \"Content-Type: application/json\" -d '{\"text\": \"Hello, server!\"}' http://localhost:8080/api/message\ncurl http://localhost:8080 -> displays this message"}

	w.Header().Set("Content-Type", "application/json")
	err := json.NewEncoder(w).Encode(response)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
}

func handleMessage(w http.ResponseWriter, r *http.Request) {
	// Allow only POST requests
	if r.Method != http.MethodPost {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}

	// Parse the JSON request body
	var message Message
	err := json.NewDecoder(r.Body).Decode(&message)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	// Process the message
	response := Message{Text: "Received message: " + message.Text}

	// Send the JSON response
	w.Header().Set("Content-Type", "application/json")
	err = json.NewEncoder(w).Encode(response)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
}

