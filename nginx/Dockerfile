FROM alpine
ENV NGINX_VERSION 1.11.10
RUN  apk add --no-cache --virtual .build-deps \
   curl \
   gcc
   
RUN mkdir /tmp/nginx
WORKDIR /tmp/nginx
RUN curl http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -o nginx.tar.gz
RUN tar -zxC ./ -f nginx.tar.gz 
WORKDIR /tmp/nginx/nginx-1.11.10
RUN  apk add --no-cache --virtual .build-deps \
linux-headers 
RUN  apk add --no-cache --virtual .build-deps \
make

RUN  apk add --no-cache --virtual .build-deps \
libc-dev
RUN  apk add --no-cache --virtual .build-deps \
zlib-dev \
libxslt-dev \
gd-dev \
geoip-dev \
perl-dev
RUN apk add --no-cache --virtual .build-deps \
pcre-dev
RUN apk add --no-cache --virtual .build-deps \
openssl-dev
RUN addgroup -S nginx
RUN adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx
ENV CONFIG="\
                --prefix=/etc/nginx \
                --sbin-path=/usr/sbin/nginx \
		--modules-path=/usr/lib/nginx/modules \
		--conf-path=/etc/nginx/nginx.conf \
		--error-log-path=/var/log/nginx/error.log \
		--http-log-path=/var/log/nginx/access.log \
		--pid-path=/var/run/nginx.pid \
		--lock-path=/var/run/nginx.lock \
		--http-client-body-temp-path=/var/cache/nginx/client_temp \
		--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
		--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
		--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
		--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
		--user=nginx \
		--group=nginx \
                --with-pcre-jit \
                --with-debug \
"

RUN echo $CONFIG
RUN ./configure $CONFIG
RUN ls -la

