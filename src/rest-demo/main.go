package main

import (
	"log"
	"net/http"
)

func main() {
	router := NewRouter()

    log.Println("http://localhost:8000/")

	log.Fatal(http.ListenAndServe(":8000", router))
}

