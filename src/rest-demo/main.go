package main

import (
	"log"
	"net/http"
)

func main() {
	router := NewRouter()
    port := ":8000"

    log.Println("http://localhost" + port +"/status")
	log.Fatal(http.ListenAndServe(port, router))
}

