FROM golang:1.21.8-bullseye

WORKDIR /workspace

COPY my5G-RANTester my5G-RANTester/

RUN cd my5G-RANTester  \
    && go mod download 

# Move to the binary path
WORKDIR /workspace/my5G-RANTester/cmd

RUN go build -o app

# Install iperf
RUN apt-get update && apt-get install -y iperf

# Config files volume
VOLUME [ "/workspace/my5G-RANTester/config" ]
