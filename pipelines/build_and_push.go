package main

import (
	"context"
	"fmt"

	"dagger.io/dagger"
)

func buildAndPush(ctx context.Context, args []string) error {
	fmt.Println("Building and pushing with Dagger")

	tag := "latest"
	branch := "main"
	if len(args) == 2 {
		tag = args[1]
		branch = args[0]
	}

	// initialize Dagger client
	client, err := dagger.Connect(ctx)
	if err != nil {
		return err
	}
	defer client.Close()

	repo := client.Git("https://github.com/andreaswachs/prdattools").
		Branch(branch).
		Tree()

	resp, err := client.Container().
		Build(repo).
		Publish(ctx, fmt.Sprintf("andreaswachs/prdattools:%s", tag))

	if err != nil {
		return err
	}

	fmt.Println("Publish response:", resp)

	return nil
}
