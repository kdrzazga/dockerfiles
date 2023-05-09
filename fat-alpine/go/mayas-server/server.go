// nohup go run server.go > output.log 2>&1 &
// curl http://localhost:8083

package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"log"
	"sync"
	"time"
	"strings"
	"net/http"
)

var TXT [10]string
var mu sync.Mutex

func main() {
	go readLines()

	http.HandleFunc("/", handleDefault)
	
	log.Println("Server started on http://localhost:8083")
	log.Fatal(http.ListenAndServe(":8083", nil))

	// Main loop
	for {
		mu.Lock()
		fmt.Println(TXT)
		mu.Unlock()

		randomDuration := time.Duration(rand.Intn(6)+2) * time.Second
		time.Sleep(randomDuration)
	}
}

func handleDefault(w http.ResponseWriter, r *http.Request) {
	txtString := strings.Join(TXT[:], "")
	txtBytes := []byte(txtString)
	w.Write(txtBytes)
}


func readLines() {
	for {
		time.Sleep(time.Duration(rand.Intn(6)+2) * time.Second)
		line := getRandomLineFromFile("script.txt")
		timestamp := time.Now().Format("2006-01-02 15:04:05")
		newLine := fmt.Sprintf("%s - %s", timestamp, line)

		mu.Lock()
		TXT = shiftArray(TXT)
		TXT[0] = newLine
		mu.Unlock()
	}
}

func getRandomLineFromFile(filename string) string {
	file, err := os.Open(filename)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return ""
	}
	defer file.Close()

	lines := make([]string, 0)
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		fmt.Println("Error scanning file:", err)
		return ""
	}

	rand.Seed(time.Now().UnixNano())
	randomIndex := rand.Intn(len(lines))

	return lines[randomIndex]
}

func shiftArray(arr [10]string) [10]string {
	for i := len(arr) - 1; i > 0; i-- {
		arr[i] = arr[i-1]
	}
	return arr
}
