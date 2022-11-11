FROM mono:6 as base

# Install packages for convenience and necessary tools
RUN apt update &&         \
    apt install -y        \
      neovim              \
      openjdk-11-jre      \
      openjdk-11-jdk      \
      curl                \
      make                \
      git

FROM base as build

# Setting the work directory to /work - this is where
# users will land when running the container interactively
WORKDIR /work

# Copy over the files specific for the lexing and parsing
RUN mkdir -p /root/fsharp
COPY resources/fsharp/* /root/fsharp

# Copy over a custom bash profile such that the lexing and parsing
# binaries and libraries are exposed though the $PATH
COPY resources/bashrc /root/.bashrc

ENTRYPOINT [ "bash" ]

