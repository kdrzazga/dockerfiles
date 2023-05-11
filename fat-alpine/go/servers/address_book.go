// Needs to be run as first of three servers
// nohup go run address_book.go > address_book.log 2>&1 &
// curl http://localhost:8080
// curl -i http://localhost:8080/ip/msg_server

package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"
)

var ipTable map[string]string
var lines string

func main() {
	loadIPTable()

	http.HandleFunc("/ip/", getServerAddress)
	http.HandleFunc("/", info)

	fmt.Println("Starting server on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func loadIPTable() {
	fileData, err := ioutil.ReadFile("iptable.properties")
	if err != nil {
		log.Fatal("Failed to read iptable.properties file:", err)
	}
	
	ipTable = make(map[string]string)

	lines = string(fileData)
	properties := strings.Split(lines, "\n")

	for _, prop := range properties {
		keyValue := strings.Split(prop, "=")
		
		if len(keyValue) == 2 {
			key := strings.TrimSpace(keyValue[0])
			value := strings.TrimSpace(keyValue[1])
			ipTable[key] = value
		}
	}
	
	for key, value := range ipTable {
		fmt.Printf("http://localhost:8080/ip/%s\n", key)
		fmt.Printf("%s -> %s\n\n", key, value)
	}
}

func info(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(lines))
	for key := range ipTable {
		fmt.Fprintf(w, "http://localhost:8080/ip/%s\n", key)
	}
}

func getServerAddress(w http.ResponseWriter, r *http.Request) {
	path := r.URL.Path[len("/ip/"):]
	serverName := strings.ToLower(path)

	address, ok := ipTable[serverName]
	if !ok {
		http.Error(w, "Server [" + serverName + "] not found in iptable.properties", http.StatusInternalServerError)
		return
	}

	response := map[string]string{"address": address}
	jsonResponse, err := json.Marshal(response)
	if err != nil {
		http.Error(w, "Failed to marshal JSON response", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(jsonResponse)
}
