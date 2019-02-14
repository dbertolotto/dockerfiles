FROM dbertolotto/debian:stretch-minbase

ARG VERSION=8
ARG TYPE=jre

RUN apt-get update && \
    apt-get install -y openjdk-$VERSION-$TYPE && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
