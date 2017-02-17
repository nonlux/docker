FROM alpine
ENV NGINX_VERSION 1.11.10
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
   --without-poll_module \
--with-http_realip_module \
--with-http_ssl_module \
--without-http_browser_module \
--without-http_charset_module \
--without-http_empty_gif_module \
--without-http_geo_module \
--without-http_scgi_module \
--without-http_split_clients_module \
--without-http_ssi_module \
--without-http_userid_module \
--without-http_uwsgi_module \
--without-mail_imap_module \
--without-mail_pop3_module \
--without-mail_smtp_module \
--without-stream_access_module \
--without-stream_geo_module \
--without-stream_limit_conn_module \
--without-stream_map_module \
--without-stream_return_module \
--without-stream_split_clients_module \
"
RUN apk add --no-cache --virtual .build-deps \
       curl \
       gcc \
       libc-dev \
       linux-headers  \
       make \
       zlib-dev \
       libxslt-dev \
       gd-dev \
       geoip-dev \
       perl-dev \
       pcre-dev \
       openssl-dev &&\
       mkdir /tmp/nginx &&\
    cd /tmp/nginx && \
    curl http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
         -o nginx.tar.gz &&\
    tar -zxC ./ -f nginx.tar.gz &&\
    cd  nginx-$NGINX_VERSION &&\
    addgroup -S nginx &&\
    adduser -D -S \
      -h /var/cache/nginx \
      -s /sbin/nologin \
      -G nginx nginx &&\
    ./configure $CONFIG &&\
    make install &&\
    apk add --no-cache --virtual .gettext gettext &&\
    mv /usr/bin/envsubst /tmp/  &&\
    runDeps=$( \
   scanelf --needed --nobanner /usr/sbin/nginx /usr/lib/nginx/modules/*.so /tmp/envsubst \
   | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
   | sort -u \
   | xargs -r apk info --installed \
   | sort -u \
   ) &&\
  apk add --no-cache --virtual .nginx-rundeps $runDeps &&\
  apk del .build-deps \
   && apk del .gettext \
   && mv /tmp/envsubst /usr/local/bin/  \
   && rm -rf /tmp/nginx &&\
   ln -sf /dev/stdout /var/log/nginx/access.log \
   && ln -sf /dev/stderr /var/log/nginx/error.log 

CMD ["nginx", "-g", "daemon off;"]
