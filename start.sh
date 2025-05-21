#!/bin/bash

# Start dummy HTTP server to keep Render Web Service alive
python3 -m http.server 8080 &

# Start tmate in background
tmate -S /tmp/tmate.sock new-session -d

# Wait for tmate to be ready
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH and web access link
echo "=============================="
echo "鉁� Tmate SSH session ready:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "馃寪 Web URL:"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'
echo "=============================="

# Keep service running forever
while true; do
    echo "馃挙 Still alive: $(date)"
    sleep 300
done
