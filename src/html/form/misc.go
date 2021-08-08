package main

import (
    "fmt"
    "net/http"
    "os"
)

func info(host string, port string){
    fmt.Println("Starting server...")
    fmt.Println()
    fmt.Print("Say hello:")
    fmt.Println(host + port + "/")
    fmt.Println()
    fmt.Print("Import from JSON:")
    fmt.Println(host + port + "/employees")
    fmt.Println()
    fmt.Print("Login form:")
    fmt.Println(host + port + "/login")
    fmt.Println()
    fmt.Print("Quit:")
    fmt.Println(host + port + "/exit")
}

func exit(w http.ResponseWriter, r *http.Request) {
    fmt.Println("Bye...")
    os.Exit(0)
}
