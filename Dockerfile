FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install --no-install-recommends -y wget curl git sudo apt-transport-https ca-certificates gnupg

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt install -y nodejs

# Install code-server dari npm
RUN npm install -g code-server

EXPOSE 6080

CMD code-server --bind-addr 0.0.0.0:6080 --auth none /root
