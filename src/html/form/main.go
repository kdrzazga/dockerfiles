package main

import (
    "log"
    "net/http"
)

const host = "http://127.0.0.1"
const port = ":9090"

func main() {
    info(host, port)

    http.HandleFunc("/", sayhelloName) // setting router rule
    http.HandleFunc("/login", login)
    http.HandleFunc("/exit", exit)
    http.HandleFunc("/employees", drawTable)

    err := http.ListenAndServe(port, nil) // setting listening port
    if err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}
