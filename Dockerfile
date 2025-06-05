FROM python:3.11-slim

# Install dependencies, tailscale, and supervisor
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl gnupg2 iproute2 iptables ca-certificates lsb-release dumb-init supervisor && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.list | tee /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && apt-get install -y tailscale && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy app and supervisord config
COPY app.py /app/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install Python dependencies
RUN pip install flask

EXPOSE 5000

ENTRYPOINT ["/usr/bin/supervisord", "-n"]