FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl gnupg2 iproute2 iptables ca-certificates lsb-release dumb-init \
 && curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.gpg | gpg --dearmor -o /usr/share/keyrings/tailscale-archive-keyring.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/tailscale-archive-keyring.gpg] https://pkgs.tailscale.com/stable/debian bookworm main" > /etc/apt/sources.list.d/tailscale.list \
 && apt-get update && apt-get install -y tailscale \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app.py entrypoint.sh /app/
RUN pip install flask
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/app/entrypoint.sh"]