Latex & Maxima docker container
=====

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/maxima-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/maxima-docker.svg)](https://hub.docker.com/r/jgoldfar/maxima-docker/)

This container helps with compilation of latex sources without the need to install all latex packages on your system; [maxima](http://maxima.sourceforge.net/) is a computer algebra system that plays (relatively) nicely with TeX.

This repository is forked from blang's repository in order to add other packages needed to run Maxima scripts for a CI setup.

Setup
-----
First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

build:
```bash
docker build -t jgoldfar/maxima-docker .

```

Usage:
-----

```bash
dockercmd.sh (to open a shell)

# Or better in one go (does not start container twice)
../dockercmd.sh /bin/sh -c "pdflatex example.tex && pdflatex example.tex"

# View
./example.pdf
```
Use `dockercmd.sh` to execute any command you like inside the container. `WORKDIRs` match, mounted to `/data` inside container.

Why should I use this container?
-----

- Easy setup
- `texlive-full` covers most of the available packages
- `chktex` and `pgf` packages are explicitly installed to ensure they are always available.
