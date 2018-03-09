FROM jgoldfar/latex-docker:plus-julia-reqs-0.1.0

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"
ENV MaximaPath /opt/maxima
RUN apt-get -q -y update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get -q -y install sbcl && \
    mkdir -p ${MaximaPath} && \
    git clone git://git.code.sf.net/p/maxima/code ${MaximaPath} && \
    ${MaximaPath}/configure --enable-sbcl --prefix=${MaximaPath}/usr --enable-quiet-build && \
    make install
    
# Set up path
ENV PATH="${MaximaPath}/usr/bin:${PATH}"

# TODO: Add source build of Julia? Separate container?

ENTRYPOINT /bin/bash