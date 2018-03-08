FROM ubuntu:16.04

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

RUN apt-get -q -y update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get -q -y install \
    latexmk \
    texlive-full \
    man-db \
    libc6 \
    libc6-dev \
    build-essential \
    wget curl \
    file \
    vim \
    unzip \
    pkg-config \
    git mercurial \
    cmake make \
    gfortran \
    python \
    ssh && \
    apt-get clean

ENTRYPOINT /bin/bash

WORKDIR /data
VOLUME ["/data"]
