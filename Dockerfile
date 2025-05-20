
FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget python3 ca-certificates && \
    apt clean

# Download and install sshx directly
RUN wget https://github.com/ekzhang/sshx/releases/download/v0.3.1/sshx-linux-amd64 \
    -O /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Create dummy web content to keep the Render service alive
WORKDIR /app
RUN echo "SSHX is running..." > index.html

# Render requires at least one open port to keep the service alive
EXPOSE 8080

# Start dummy HTTP server and sshx (foreground process)
CMD python3 -m http.server 8080 & \
    sshx serve --once
