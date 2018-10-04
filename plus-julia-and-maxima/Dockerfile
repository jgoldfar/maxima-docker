FROM jgoldfar/maxima-docker:latest

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

# Install Julia 0.7
## Set environment variables to change "current" version of Julia
ENV JuliaVerShort 0.7
ENV JuliaVer 0.7.0
ENV JuliaVerString julia-${JuliaVer}
ENV JuliaPath /opt/${JuliaVerString}
RUN mkdir -p ${JuliaPath} && \
    curl -s -L https://julialang-s3.julialang.org/bin/linux/x64/${JuliaVerShort}/${JuliaVerString}-linux-x86_64.tar.gz | \
    tar -C ${JuliaPath} -x -z --strip-components=1 -f - && \
    ln -fs ${JuliaPath} /opt/julia-${JuliaVerShort} && \
    ln -s /opt/julia-${JuliaVerShort}/bin/julia /usr/local/bin/julia-${JuliaVerShort} && \
    ln -s /opt/julia-${JuliaVerShort}/bin/julia /usr/local/bin/julia


# Set up path
ENV PATH="/usr/local/bin:${PATH}"

ENTRYPOINT /bin/bash