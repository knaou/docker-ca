FROM ubuntu
MAINTAINER naou <monaou@gmail.com>

RUN apt-get update && \
    apt-get -y install openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/*

RUN mkdir -p /ca
COPY bin /bin

RUN sed -i 's/\.\/demoCA/\/ca/g' /etc/ssl/openssl.cnf

VOLUME /ca
VOLUME /sign
