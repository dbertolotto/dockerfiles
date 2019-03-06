FROM alpine:3.9

ENV EDGE_REPO="--repository=http://dl-cdn.alpinelinux.org/alpine/edge/main"

RUN apk add --no-cache tini

RUN addgroup -g 1000 -S alpine && \
    adduser -u 1000 -G alpine -S alpine

ENTRYPOINT ["tini","--"]

CMD ["sh"]
