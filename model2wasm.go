package main

import (
	"fmt"
	"os"
	"strconv"
)

var vector []float64

func main() {
	for _, arg := range os.Args[1:] {
		if n, err := strconv.ParseFloat(arg, 64); err == nil {
			vector = append(vector, n)
		} else {
			panic(err)
		}
	}

	modelOutput := score(vector)
	fmt.Println(modelOutput)
}
