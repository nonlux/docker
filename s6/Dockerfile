FROM alpine:latest

RUN apk add --no-cache curl s6 \
 && curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.5/s6-overlay-amd64.tar.gz \
  | tar xvzf - -C / \
 && apk del --no-cache curl \
 && rm -fr /tmp/*

ENTRYPOINT [ "/init" ]
