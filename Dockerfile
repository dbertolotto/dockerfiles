FROM dbertolotto/debian:stretch-minbase

ARG VERSION=6.6.0
ARG ARCH=amd64

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$VERSION-$ARCH.deb && \
dpkg -i filebeat-$VERSION-$ARCH.deb && \
rm filebeat-$VERSION-$ARCH.deb

