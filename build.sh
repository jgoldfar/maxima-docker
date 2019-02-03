#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DOCKER_REPO_BASE="latex-docker"
IMG_TAG=debian-latest

docker build -f Dockerfile.debian -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

DOCKER_REPO_BASE="latex-docker"
IMG_TAG=debian-minimal-latest

docker build -f Dockerfile.debian-minimal -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}


DOCKER_REPO_BASE="latex-docker"
IMG_TAG=debian-minplus-latest

docker build -f Dockerfile.debian-minplus -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

DOCKER_REPO_BASE="latex-docker"
IMG_TAG=alpine-minimal-latest

docker build -f Dockerfile.alpine-minimal -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

DOCKER_REPO_BASE="latex-docker"
IMG_TAG=alpine-minplus-latest

docker build -f Dockerfile.alpine-minplus -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}
