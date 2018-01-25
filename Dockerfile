FROM alpine
MAINTAINER naou <monaou@gmail.com>

RUN apk add --no-cache openssl

RUN mkdir -p /ca
COPY bin /bin
RUN chmod +x /bin/create_ca /bin/create_csr /bin/create_no_pass_key /bin/init_ca_dir /bin/sign
COPY openssl.cnf /etc/ssl/openssl.cnf

VOLUME /ca
VOLUME /sign

