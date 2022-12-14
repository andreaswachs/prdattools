 # prdattools

This repository contains the resources to for having functioning parser and lexer tools to follow along the "Programmer som Data" course in the fall semester of 2022 at the IT university of Copenhagen.

## Usage

### Running

The most common use case is to run the container. The command for running is saved in the Makefile. A special `/work` directory is created in the container for you to place your files via a Docker volume.

I'd advice to you to run the command `docker run -it --rm -v $(pwd):/work andreaswachs/prdattools:latest` from your project's directory, instead of `make run`.

#### Commands to use while running

Running the lexer:

```bash
fslex <...>
```

Compiling generated `fs` files:

```bash
fsc <...>
```
### Building

You can build a new Docker container if you've made changes to the dockerfile with

```bash
make build
```
 