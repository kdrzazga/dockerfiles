// Service dependet on ADDRESS BOOK
// nohup go run proc_server1.go > proc_server.log 2>&1 &
// curl -i -u admin:admin http://localhost:8082

package main

import (
	"fmt"
	"log"
	"net/http"
	"encoding/json"
)

var msgServerIP string

func main() {

	fmt.Println("PROC SERVER requires ADDRESS BOOK service to keep running")

	resp, err := http.Get("http://localhost:8080/ip/msg_server")
	if err != nil {
		log.Fatal("Failed to fetch MESSAGE SERVER IP:", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		log.Fatal("Failed to fetch MESSAGE SERVER IP:", resp.Status)
	}
	
	var responseBody struct {
		Address string `json:"address"`
	}	

	err = json.NewDecoder(resp.Body).Decode(&responseBody)
	if err != nil {
		log.Fatal("Failed to decode response body:", err)
	}

	msgServerIP = responseBody.Address
	fmt.Println("MESSAGE SERVER IP:", msgServerIP)

	http.HandleFunc("/", handleRequest)
	fmt.Println("Starting server on http://localhost:8082")
	log.Fatal(http.ListenAndServe(":8082", nil))
}

func handleRequest(w http.ResponseWriter, r *http.Request) {
	username, password, _ := r.BasicAuth()

	if username != "admin" || password != "admin" {
		w.Header().Set("WWW-Authenticate", `Basic realm="Restricted"`)
		http.Error(w, "Unauthorized", http.StatusUnauthorized)
		return
	}

	w.Header().Set("Content-Type", "text/plain")
	w.Header().Set("MESSAGE-SERVER", msgServerIP)
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "hello")
}
