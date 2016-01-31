FROM ubuntu
MAINTAINER naou <monaou@gmail.com>

RUN apt-get install openssl && apt-get clean

RUN mkdir -p /ca
COPY bin /bin

RUN sed -i 's/\.\/demoCA/\/ca/g' /etc/ssl/openssl.cnf

VOLUME /ca
VOLUME /sign
