FROM alpine

ENV PYTHON_VERSION=2.7.13-r0
ENV PY_PIP_VERSION=9.0.0-r1
ENV SUPERVISOR_VERSION=3.3.0

RUN apk update && apk add -u python=$PYTHON_VERSION py-pip=$PY_PIP_VERSION &&\
   pip install --upgrade pip &&\
   pip install supervisor==$SUPERVISOR_VERSION &&\
   mkdir /var/log/supervisor/ -p && \
   ln -sf /dev/stdout /var/log/supervisor/supervisord.log &&\
   mkdir /etc/supervisor/conf.d -p

COPY supervisor.conf /etc/supervisor/supervisord.conf
CMD ["supervisord"]
