FROM jgoldfar/alpine-sbcl:3.9

LABEL maintainer="Jonathan Goldfarb <jgoldfar@my.fit.edu>"

RUN apk add --no-cache \
      git \
      make \
      texinfo \
      autoconf \
      automake \
      python \
      tar \
      perl \
      curl

ENV MaximaPath=/opt/maxima

RUN git clone https://git.code.sf.net/p/maxima/code ${MaximaPath} && \
    cd ${MaximaPath} && \
    ./bootstrap && \
    ./configure --enable-sbcl --prefix=/usr/local --enable-quiet-build && \
    make install && \
    rm -rf ${MaximaPath}
    
COPY latex-minimal.profile .

RUN curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -o install-tl-unx.tar.gz && \
    tar xzf install-tl-unx.tar.gz && \
    ./install-tl-*/install-tl -profile ./latex-minimal.profile && \
    rm -rf latex-minimal.profile install-tl-*

ENV PATH="/usr/local/texlive/2018/bin/x86_64-linuxmusl:${PATH}"

RUN apk del automake texinfo autoconf python git perl &&\
    rm -fr /var/cache/apk/*
