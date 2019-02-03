Latex (TeXLive) docker container
=====

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/latex-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/latex-docker.svg)](https://hub.docker.com/r/jgoldfar/latex-docker/)
[![Build Status](https://travis-ci.org/jgoldfar/latex-docker.svg?branch=master)](https://travis-ci.org/jgoldfar/latex-docker)

This container helps with compilation of latex sources without the need to install all latex packages on your system.

This repository is forked from blang's repository in order to add other packages needed for a CI setup.

Setup
-----
First, add your local user to docker group:

```shell
sudo usermod -aG docker YOURUSERNAME
```

build:

```shell
docker build -t jgoldfar/latex-docker .

```

Usage:
-----

```shell
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/latex-docker

# Or better in one go (does not start container twice)
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/latex-docker /bin/sh -c "pdflatex example.tex && pdflatex example.tex"

# View
./example.pdf
```

`WORKDIRs` match, mounted to `/data` inside container.

Why should I use this container?

-----

- Easy setup
- `chktex` and `pgf` packages are explicitly installed to ensure they are always available.

## Container Descriptions

* `debian-` is the "legacy" image containing the complete TeXLive installation on top of Debian Stretch

* `debian-minimal` is a minimal image containing just TeX & LaTeX

* `debian-minplus` includes some additional packages on top of `debian-minimal`.
