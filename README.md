Latex & Julia docker container
=====

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/latex-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/latex-docker.svg)](https://hub.docker.com/r/jgoldfar/latex-docker/)

This container helps with compilation of latex sources without the need to install all latex packages on your system.

This repository is forked from blang's repository in order to add other packages needed for a CI setup.

Setup
-----
First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

build:
```bash
docker build -t jgoldfar/latex-docker .

```

Usage:
-----

```bash
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
- `texlive-full` covers most of the available packages
- `chktex` and `pgf` packages are explicitly installed to ensure they are always available.

## Container Descriptions

* default is the original build, containing just TeXLive

* plus-julia-release includes everything in default, plus Julia v0.6 and v0.7

* plus-julia-dev includes everything in default, plus Julia 0.7 and Julia 1.0 (useful for porting packages)

* plus-julia-dev includes everything in default, plus a version of Julia built from source

* plus-julia-and-maxima includes the released version of Julia (v0.7) as well as everything included in [maxima-docker](https://github.com/jgoldfar/maxima-docker), that is, Maxima built against SBCL.