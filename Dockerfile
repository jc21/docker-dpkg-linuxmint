FROM linuxmintd/mint19-amd64

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

# Rust as `builder` user
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

