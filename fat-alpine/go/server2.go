//nohup go run server2.go > output2.log 2>&1 &
// curl http://localhost:8081  -> displays HELP
// curl -u admin:admin http://localhost:8081/gitanjali  -> displays indian poem

package main

import (
	"log"
	"net/http"
)

func main() {
	// Define the route handlers
	http.HandleFunc("/", handleDefault)
	http.HandleFunc("/gitanjali", handleGitanjali)

	// Start the server
	log.Println("Server started on http://localhost:8081")
	log.Fatal(http.ListenAndServe(":8081", nil))
}

func handleDefault(w http.ResponseWriter, r *http.Request) {
	// Allow access to everyone
	w.Write([]byte("Usage: http://localhost:8081/ -> displays this message, http://localhost:8081/gitanjali -> writes poem (credentials: admin, admin)"))
}

func handleGitanjali(w http.ResponseWriter, r *http.Request) {
	// Perform basic authentication
	username, password, ok := r.BasicAuth()
	if !ok || username != "admin" || password != "admin" {
		w.Header().Set("WWW-Authenticate", `Basic realm="Restricted"`)
		w.WriteHeader(http.StatusUnauthorized)
		w.Write([]byte("Unauthorized access"))
		return
	}

	// Authorized access, serve Gitanjali poem lines
	poemLines := `Thou hast made me endless, such is thy pleasure. 
This frail vessel thou emptiest again and again, 
and fillest it ever with fresh life.
This little flute of a reed thou hast carried over hills and dales,
and hast breathed through it melodies eternally new.`

	w.Write([]byte(poemLines))
}
