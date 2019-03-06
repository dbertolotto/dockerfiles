FROM debian:stable AS builder

ARG arch=amd64
ARG variant=fakechroot
ARG exclude=none
ARG version=stretch

USER root

RUN apt-get update && \
    apt-get -y install fakechroot fakeroot debootstrap && \
    mkdir tmpchr && \
    fakechroot fakeroot debootstrap --arch=${arch} --exclude=${exclude} --variant=${variant} ${version} tmpchr http://deb.debian.org/debian/

FROM scratch AS base
COPY --from=builder tmpchr .

FROM base
RUN apt-get -y clean && \
    rm -rf /var/lib/apt/lists
