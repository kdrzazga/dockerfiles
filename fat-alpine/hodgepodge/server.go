package main

import (
	"fmt"
	"log"
	"net/http"
	"os/exec"
	"strings"
)

func main() {
	log.Printf(help());
	http.HandleFunc("/info", infoHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func help() string{
	return "Usage:\ncurl http://localhost:8080/info";
}

func infoHandler(w http.ResponseWriter, r *http.Request) {
	lispOutput := runLispProgram()
	perlOutput := runPerlScript()

	response := fmt.Sprintf("%s\t:%s\n", lispOutput, perlOutput)
	fmt.Fprint(w, response)
}

func runLispProgram() string {
	cmd := exec.Command("clisp", "generate.lisp")
	output, err := cmd.Output()
	if err != nil {
		log.Printf("Error running Lisp program: %v", err)
		return ""
	}

	return strings.TrimSpace(string(output))
}

func runPerlScript() string {
	cmd := exec.Command("perl", "loggen.pl")
	output, err := cmd.Output()
	if err != nil {
		log.Printf("Error running Perl script: %v", err)
		return ""
	}

	return strings.TrimSpace(string(output))
}
