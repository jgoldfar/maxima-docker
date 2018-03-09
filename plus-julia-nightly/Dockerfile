FROM jgoldfar/latex-docker:plus-julia-reqs-0.1.1

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

# TODO: Add source build of Julia
ENV JuliaDevPath /opt/julia-dev

# Install Julia 0.7
## Set environment variables to change "current" version of Julia
ENV JuliaVerShort latest
ENV JuliaVer latest
ENV JuliaVerString julia-${JuliaVer}
ENV JuliaPath /opt/${JuliaVerString}
RUN mkdir -p ${JuliaPath} && \
    curl -s -L https://julialangnightlies-s3.julialang.org/bin/linux/x64/${JuliaVerString}-linux64.tar.gz | \
    tar -C ${JuliaPath} -x -z --strip-components=1 -f - && \
    ln -fs ${JuliaPath} /opt/julia-${JuliaVerShort} && \
    ln -s /opt/julia-${JuliaVerShort}/bin/julia /usr/local/bin/julia-${JuliaVerShort}

# Set up path
ENV PATH="/usr/local/bin:${PATH}"

ENTRYPOINT /bin/bash