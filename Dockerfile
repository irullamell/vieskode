FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install --no-install-recommends -y wget curl git sudo

# Install VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Ensure code-server is in PATH
RUN ln -s /usr/local/bin/code-server /usr/bin/code-server || true

EXPOSE 6080

CMD /usr/local/bin/code-server --bind-addr 0.0.0.0:6080 --auth none /root
