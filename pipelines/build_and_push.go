package main

import (
	"context"
	"fmt"

	"dagger.io/dagger"
)

func buildAndPush(ctx context.Context, _args []string) error {
	fmt.Println("Building and pushing with Dagger")

	// initialize Dagger client
	client, err := dagger.Connect(ctx)
	if err != nil {
		return err
	}
	defer client.Close()

	repo := client.Git("https://github.com/andreaswachs/prdattools").
		Branch("main").
		Tree()

	resp, err := client.Container().
		Build(repo).
		Publish(ctx, "andreaswachs/prdattools:latest")

	if err != nil {
		return err
	}

	fmt.Println("Publish response:", resp)

	return nil
}
