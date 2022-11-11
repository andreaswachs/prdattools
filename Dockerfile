FROM mono:6 as base

ENV RIPGREP_URL "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_13.0.0_amd64.deb"

# Setting the work directory to /work - this is where
# users will land when running the container interactively
WORKDIR /work

# Copy over the files specific for the lexing and parsing
RUN mkdir -p /root/fsharp
COPY fsharp/* /root/fsharp

# Copy over a custom bash profile such that the lexing and parsing
# binaries and libraries are exposed though the $PATH
COPY bashrc /root/.bashrc

# Install packages for convenience
RUN apt update &&         \
    apt install -y        \
      neovim              \
      openjdk-11-jre      \
      openjdk-11-jdk      \
      curl                \
      make                \
      git

# Install ripgrep
RUN curl -Lo ripgrep.deb $RIPGREP_URL \
    && apt install -y ./ripgrep.deb \
    && rm -f ./ripgrep.deb

ENTRYPOINT [ "bash" ]

