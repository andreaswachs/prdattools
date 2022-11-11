.HONY: build
build: 
	docker build -t andreaswachs/prdattools:latest -f Dockerfile .

.PHONY: run
run:
	docker run -it --rm -v $(pwd):/work andreaswachs/prdattools:latest

.PHONY:
build-and-push:
	go run main.go build_and_push.go buildAndPush
