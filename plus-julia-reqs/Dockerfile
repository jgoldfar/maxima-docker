FROM jgoldfar/latex-docker:default-0.1.0

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

RUN apt-get -q -y update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get -q -y install \
    dnsutils \
    gettext \
    hdf5-tools \
    inetutils-traceroute \
    iputils-ping \
    libgnutls30 \
    libncurses-dev \
    libpcre3-dev \
    libreadline-dev \
    libzmq3-dev \
    libzmq5 \
    msgpack-python \
    net-tools \
    python \
    python-crypto \
    python-dev \
    python-git \
    python-isodate \
    python-jinja2 \
    python-m2crypto \
    python-pip \
    python-requests \
    python-setuptools \
    python-yaml \
    screen \
    supervisor && \
    apt-get clean

ENTRYPOINT /bin/bash