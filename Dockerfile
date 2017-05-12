FROM ubuntu:16.04
LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get install -y \
    texlive-full \
    man-db \
    libc6 \
    libc6-dev \
    build-essential \
    wget \
    curl \
    file \
    vim \
    screen \
    tmux \
    unzip \
    pkg-config \
    make git \
    cmake \
    gfortran \
    gettext \
    libreadline-dev \
    libncurses-dev \
    libpcre3-dev \
    libgnutls30 \
    libzmq3-dev \
    libzmq5 \
    python \
    python-yaml \
    python-m2crypto \
    python-crypto \
    msgpack-python \
    python-dev \
    python-setuptools \
    supervisor \
    python-jinja2 \
    python-requests \
    python-isodate \
    python-git \
    python-pip \
    iputils-ping \
    dnsutils \
    net-tools \
    inetutils-traceroute \
    hdf5-tools && \
    apt-get clean

# Install julia 0.5
RUN  mkdir -p /opt/julia-0.4.7 && \
    curl -s -L https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.7-linux-x86_64.tar.gz | tar -C /opt/julia-0.4.7 -x -z --strip-components=1 -f - && \
    ln -fs /opt/julia-0.4.7 /opt/julia-0.4 && \
    echo '("JULIA_LOAD_CACHE_PATH" in keys(ENV)) && unshift!(Base.LOAD_CACHE_PATH, ENV["JULIA_LOAD_CACHE_PATH"])' >> /opt/julia-0.4/etc/julia/juliarc.jl

# Install julia 0.5 and make v0.5 default julia
RUN mkdir -p /opt/julia-0.5.1 && \
    curl -s -L https://julialang.s3.amazonaws.com/bin/linux/x64/0.5/julia-0.5.1-linux-x86_64.tar.gz | tar -C /opt/julia-0.5.1 -x -z --strip-components=1 -f - && \
    ln -fs /opt/julia-0.5.1 /opt/julia-0.5 && \
    echo '("JULIA_LOAD_CACHE_PATH" in keys(ENV)) && unshift!(Base.LOAD_CACHE_PATH, ENV["JULIA_LOAD_CACHE_PATH"])' >> /opt/julia-0.5/etc/julia/juliarc.jl && \
    ln -fs /opt/julia-0.5 /opt/julia && \
    ln -s /opt/julia-0.5/bin/julia /usr/local/bin/julia 

# Install julia 0.6 and set up path
RUN mkdir -p /opt/julia-0.6.0-dev && \
    curl -s -L https://status.julialang.org/download/linux-x86_64 | tar -C /opt/julia-0.6.0-dev -x -z --strip-components=1 -f - && \
    ln -fs /opt/julia-0.6.0-dev /opt/julia-0.6 && \
    echo '("JULIA_LOAD_CACHE_PATH" in keys(ENV)) && unshift!(Base.LOAD_CACHE_PATH, ENV["JULIA_LOAD_CACHE_PATH"])' >> /opt/julia-0.6/etc/julia/juliarc.jl && \
    echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/julia/bin\"" > /etc/environment && \
    echo "export PATH" >> /etc/environment && \
    echo "source /etc/environment" >> /root/.bashrc

RUN ln -s /opt/julia-0.6/bin/julia /usr/local/bin/julia-0.6 && \
    ln -s /opt/julia-0.5/bin/julia /usr/local/bin/julia-0.5 && \
    ln -s /opt/julia-0.6/bin/julia /usr/local/bin/julia-0.4

ENTRYPOINT /bin/bash

WORKDIR /data
VOLUME ["/data"]
