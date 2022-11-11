FROM mono:6 as base

# Setting the work directory to /work - this is where
# users will land when running the container interactively
WORKDIR /work

# Copy over the files specific for the lexing and parsing
RUN mkdir -p /root/fsharp
COPY resources/fsharp/* /root/fsharp

# Copy over a custom bash profile such that the lexing and parsing
# binaries and libraries are exposed though the $PATH
COPY resources/bashrc /root/.bashrc

# Install packages for convenience
RUN apt update &&         \
    apt install -y        \
      openjdk-11-jre      \
      openjdk-11-jdk      \
      curl                \
      make                \
      git

ENTRYPOINT [ "bash" ]

