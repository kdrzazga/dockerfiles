package main

import (
    "fmt"
    "io/ioutil"
    "net/http"
    "time"
)

func main() {
    urls := []string{
        "https://www.example.com",
        "https://www.google.com",
        "https://www.github.com",
    }

    // Create a channel to hold the results of the HTTP requests.
    results := make(chan string)

    // Launch a goroutine for each URL to download the web page.
    for _, url := range urls {
        go func(url string) {
            resp, err := http.Get(url)
            if err != nil {
                fmt.Println("Error fetching", url, err)
                return
            }
            defer resp.Body.Close()

            body, err := ioutil.ReadAll(resp.Body)
            if err != nil {
                fmt.Println("Error reading", url, err)
                return
            }

            results <- fmt.Sprintf("Downloaded %d bytes from %s", len(body), url)
        }(url)
    }

    // Wait for all goroutines to finish and collect the results.
    for i := 0; i < len(urls); i++ {
        select {
        case result := <-results:
            fmt.Println(result)
        case <-time.After(5 * time.Second):
            fmt.Println("Timed out waiting for results.")
            return
        }
    }
}
