# Tailscale + Flask Web App Docker Image

This repository contains a Dockerized Flask web application bundled with the Tailscale VPN client. It uses `supervisord` to run both the Tailscale daemon and the Flask server simultaneously inside one container.

---

## Features

- Runs a simple Flask web app on port 5000.
- Runs the Tailscale daemon (`tailscaled`) and connects the container to your Tailnet.
- Uses `supervisord` for robust process management.
- Lightweight and easy to deploy with Docker.

---

## Prerequisites

- Docker installed on your host.
- A [Tailscale Auth Key](https://tailscale.com/kb/1085/auth-keys/) for unattended authentication.
- Host system must support TUN device (`/dev/net/tun`).

---

## Quick Start: Use the prebuilt Docker image

Pull the image from Docker Hub and run it:

```bash
docker run --rm \
  -e TAILSCALE_AUTH_KEY=<your-auth-key> \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -p 5000:5000 \
  hungrymack/tailscale-webapp:latest
