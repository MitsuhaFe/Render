FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install tmate, tmux, Python for HTTP server, etc.
RUN apt-get update && \
    apt-get install -y tmate tmux curl openssh-client python3 tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]