#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DOCKER_REPO_BASE="latex-docker"
IMG_TAG=debian-latest

docker build -f Dockerfile.debian -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

#DOCKER_REPO_BASE="latex-docker"
#IMG_TAG=alpine-latest

#docker build -f Dockerfile.alpine -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}
