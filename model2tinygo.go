package main

import (
	"flag"
	"io/ioutil"
	"log"
	"os"
	"text/template"
)

type ModelCode struct {
	Code string
}

func main() {
	var filenameInput = flag.String("input-name", "", "path to m2cgen go file")
	var filenameOutput = flag.String("output-name", "", "path to generated go file output")
	flag.Parse()

	fileContent, err := ioutil.ReadFile(*filenameInput)
	if err != nil {
		log.Fatal(err)
	}
	modelOutput := ModelCode{string(fileContent)}

	codeTemplate, err := template.ParseFiles("templates/main.go.tmpl")
	if err != nil {
		panic(err)
	}

	f, err := os.Create(*filenameOutput)

	err = codeTemplate.Execute(f, modelOutput)
	if err != nil {
		panic(err)
	}
}
