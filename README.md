# Tailscale Web App (Dockerized)

A simple Flask web application bundled with Tailscale VPN. This Docker image runs both a Flask web server and Tailscale to connect securely to your Tailnet.

---

## Features

- Runs a lightweight Flask app on port 5000.
- Includes Tailscale VPN client for private network connectivity.
- Easy to build and run with Docker.
- Requires Tailscale auth key at runtime to authenticate your node.

---

## Getting Started

### Prerequisites

- Docker installed on your machine or server.
- A [Tailscale Auth Key](https://tailscale.com/kb/1085/auth-keys/) for unattended authentication.

---

### Build the Docker Image

Clone or download this repo, then run:

```bash
docker build -t tailscale-webapp .
