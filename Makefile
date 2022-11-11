.HONY: build
build: 
	docker build -t andreaswachs/prdattools:latest -f Dockerfile.prdattools .

.PHONY: run
run:
	docker run -it --rm -v $(pwd):/work andreaswachs/prdattools:latest


.PHONY: push
push:
	docker push andreaswachs/prdattools:latest


.PHONY:
build-and-push: build push
