FROM nonlux/nginx:latest
ENV VERSION  0.7.3
RUN apk add --no-cache curl \
 && mkdir -p /etc/docker-gen/templates \
 && mkdir -p /etc/services.d/docker-gen \
 && curl -L -s https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-alpine-linux-amd64-$VERSION.tar.gz \
  | tar xvzf - -C /usr/bin \
 && apk del --no-cache curl 

COPY nginx.tmpl /etc/docker-gen/templates
COPY run /etc/services.d/docker-gen


