#!/bin/bash
set -e
tailscaled &
until tailscale up --authkey="$TAILSCALE_AUTH_KEY"; do
  echo "Waiting for Tailscale..."
  sleep 2
done
python /app/app.py