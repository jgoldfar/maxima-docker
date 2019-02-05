Maxima-on-alpine docker container
=====

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/maxima-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/maxima-docker.svg)](https://hub.docker.com/r/jgoldfar/maxima-docker/)
[![Build Status](https://travis-ci.org/jgoldfar/maxima-docker.svg?branch=master)](https://travis-ci.org/jgoldfar/maxima-docker)

This container helps to run Maxima scripts without the need to install its dependencies on your system.

Setup
-----
First, add your local user to docker group:

```shell
sudo usermod -aG docker YOURUSERNAME
```

build:

```shell
docker build -t jgoldfar/maxima-docker .
```

Usage:
-----

```shell
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/maxima-docker
```

`WORKDIRs` match, mounted to `/data` inside container.

Why should I use this container?

-----

- Easy setup

## Container Descriptions

* `debian` contains a Maxima installation on top of Debian Stretch

* `alpine` contains a Maxima installation on top of Alpine Linux v3.9
