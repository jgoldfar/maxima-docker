#!/bin/sh
exec docker run --rm -it -v "$PWD":/data jgoldfar/juliatex
