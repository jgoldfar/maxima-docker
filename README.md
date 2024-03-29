Maxima-on-alpine docker container
=====

[![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/maxima-docker.svg)](https://hub.docker.com/r/jgoldfar/maxima-docker/)

[![Build and push docker images](https://github.com/jgoldfar/maxima-docker/actions/workflows/build.yml/badge.svg)](https://github.com/jgoldfar/maxima-docker/actions/workflows/build.yml)

This container helps with compilation of latex sources without the need to install all latex packages on your system; [maxima](http://maxima.sourceforge.net/) is a computer algebra system that plays (relatively) nicely with TeX.

This repository is forked from blang's repository in order to add other packages needed to run Maxima scripts for a CI setup.
Minimally maintained, accepts PRs!

> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

For more information, reach out to the team at [desert.frog.solutions@gmail.com](mailto:desert.frog.solutions@gmail.com) or [desertfrogsolutions.com](https://desertfrogsolutions.com)


Setup
-----

Get [Docker](http://www.docker.io/) configured on your system, then build the image with

```shell
docker build -t jgoldfar/maxima-docker -f Dockerfile.debian .
```

Usage:
-----

```shell
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/maxima-docker:debian-latest
```

Your current working directory should be mounted to `/data` inside the running container.

Why should I use this container?

-----

- Easy setup, small container size

## Container Descriptions

* `debian` contains a Maxima installation on top of Debian Stretch

* `alpine` contains a Maxima installation on top of Alpine Linux v3.18

* `alpine-latex` adds a minimal TeX/LaTeX installation to `alpine`.
