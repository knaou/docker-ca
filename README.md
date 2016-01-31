docker-ca
===========

Provide Dockerfile to build private CA environment with ubuntu

## How to use

### Initialize CA directory

    docker run -it -v `pwd`/ca:/ca knaou/ca create_ca

'create_ca' command makes CA environment on /path/to/ca.

### (If necessary,) Create CSR and key file without passphrase

When you set up apache with ssl or other case, run create_csr command to create csr.

    docker run -it -v `pwd`/ca:/ca -v `pwd`/sign:/sign knaou/ca create_csr
    docker run -it -v `pwd`/ca:/ca -v `pwd`/sign:/sign knaou/ca create_no_pass_key

or

    docker run -it -v `pwd`/ca:/ca -v `pwd`/sign:/sign knaou/ca bash

    # Into ca environment and,
    
    create_csr
    create_no_pass_key
    
### Sign your CSR

    docker run -it -v `pwd`/ca:/ca -v `pwd`/sign:/sign knaou/ca sign

sign command expects /sign/csr.pem file.
 
create_csr command makes /sign/csr.pem.
When you want to use your CSR, put sign/csr.pem before running upper command.

## Best-practice: Make your CA images that contains /ca

### Build
I suggest to make your CA image from docker hub.

First, you run create_ca command.

    docker run -it -v /path/to/ca:/ca knaou/ca create_ca

And, describe your Dockerfile.

    FROM knaou/ca
    MAINTAINER your name
    COPY ca /ca

And, build this file.

    docker build -t myca .

### Create CSR and sign it

    docker run -it -v `pwd`/ca:/ca -v `pwd`/sign:/sign knaou/ca bash
    # Into ca environment and,
    
    create_csr
    create_no_pass_key
    sign
    exit

You get the signed file on sign directory!

    
    