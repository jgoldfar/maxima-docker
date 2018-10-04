FROM jgoldfar/latex-docker:default-0.1.0

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"
ENV MaximaPath /opt/maxima
RUN apt-get -q -y update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get -q --no-install-recommends -y install sbcl autoconf automake && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p ${MaximaPath} && \
    git clone https://github.com/jgoldfar/maxima-clone.git ${MaximaPath} && \
    cd ${MaximaPath} && \
    ./bootstrap && \
    ./configure --enable-sbcl --prefix=${MaximaPath}/usr --enable-quiet-build && \
    make install
    
# Set up path
ENV PATH="${MaximaPath}/usr/bin:${PATH}"

ENTRYPOINT /bin/bash