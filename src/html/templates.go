package main

import (
    "html/template"
    "os"
)

type Person struct {
    UserName string
    Emails   []string
    Friends  []*Friend
}

type Friend struct {
    Fname string
}

func main() {
    f1 := Friend{Fname: "jack.ma"}
    f2 := Friend{Fname: "jack.nie.ma"}
    t := template.New("fieldname example")
    t, _ = t.Parse(`hello {{.UserName}}!
            {{range .Emails}}
                an email {{.}}
            {{end}}
            {{with .Friends}}
            {{range .}}
                my friend name is {{.Fname}}
            {{end}}
            {{end}}
            `)

    p := Person{UserName: "Astaxie",
        Emails:  []string{"astaxie@beego.me", "astaxie@gmail.com"},
        Friends: []*Friend{&f1, &f2}}
    t.Execute(os.Stdout, p)
}
