package main

import (
    "encoding/json"
    "net/http"
    "fmt"
    "log"
    "os"
)

type Employee struct {
    name string `json:"name"`
    lastname string `json:"lastname"`
    position string `json:"position"`
}

const logPrefix = "\n[JSON read] "

func readFile(filename string) []byte{
    content, err := os.ReadFile(filename)
    if err != nil {
        log.Fatal(logPrefix + err)
    }
    return content
}

func convertToEmployee(text []byte) []Employee{
    var employees []Employee
    fmt.Println(logPrefix , "Data to convert: " , rawData)
    err := json.Unmarshal(text, &employees)
    if err != nil {
        fmt.Println(err)
    }

    return employees
}

func drawTable(w http.ResponseWriter, r *http.Request){
     var rawData =  readFile("data/employees.json")
     var employees = convertToEmployee(rawData)
     fmt.Println(logPrefix , "Converted employees: " , employees)
}
