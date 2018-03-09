FROM jgoldfar/latex-docker:plus-julia-reqs-0.1.1

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

# TODO: Add source build of Julia

# Set up path
ENV PATH="/usr/local/bin:${PATH}"

ENTRYPOINT /bin/bash