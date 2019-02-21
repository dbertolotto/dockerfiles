FROM dbertolotto/debian:stretch-minbase

ARG ARCH=amd64
ARG VERSION=1.7.9

RUN apt-get update && \
    apt-get install -y ca-certificates wget && \
    wget --quiet -O /usr/local/bin/traefik "https://github.com/containous/traefik/releases/download/v$VERSION/traefik_linux-$ARCH" && \
    chmod +x /usr/local/bin/traefik && \
    apt-get autoremove --purge -y wget && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["traefik"]
