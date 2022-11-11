package main

import (
	"context"
	"fmt"
	"os"
)

var pipelines = make(map[string]func(context.Context, []string) error)

func main() {
	argc := len(os.Args)
	if argc < 2 {
		fmt.Println("Usage: pipelines <pipeline_name> [args]")
		os.Exit(1)
	}

	setupPipelines()

	var args []string
	if argc > 2 {
		args = os.Args[2:]
	}

	if err := pipelines[os.Args[1]](context.Background(), args); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func setupPipelines() {
	pipelines["buildAndPush"] = buildAndPush
}
