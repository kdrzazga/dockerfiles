package main

import (
    "fmt"
    "os"
    "io/ioutil"
    "text/template"
    "strings"
)

var templates *template.Template

func main() {
    var allFiles []string
    files, err := ioutil.ReadDir("./templates")

    if err != nil {
        fmt.Println(err)
    }

    for _, file := range files {
        filename := file.Name()
        if strings.HasSuffix(filename, ".tmpl") {
            allFiles = append(allFiles, "./templates/" + filename)
        }
    }

    templates, err = template.ParseFiles(allFiles...) //parses all .tmpl files in the 'templates' folder

    s1 := templates.Lookup("header.tmpl")
    s1.ExecuteTemplate(os.Stdout, "header", nil)
    fmt.Println("---")
    s2 := templates.Lookup("content.tmpl")
    s2.ExecuteTemplate(os.Stdout, "content", nil)
    fmt.Println("---")
    s3 := templates.Lookup("footer.tmpl")
    s3.ExecuteTemplate(os.Stdout, "footer", nil)
    fmt.Println("---")
    s3.Execute(os.Stdout, nil)
}
