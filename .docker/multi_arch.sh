#!/bin/bash

set -e

VERSION=${1}:="0.31.149.110"
NAME="ajcore"
IMAGE="red171/${NAME}"

docker buildx create --platform linux/arm,linux/arm64,linux/amd64,linux/386 --name ${NAME}
docker buildx use ${NAME}

docker buildx build \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  --build-arg VCS_REF=$(git rev-parse --short HEAD) \
  --build-arg VERSION=${VERSION} \
  --platform linux/arm,linux/arm64,linux/amd64,linux/386 \
  --push \
  -t ${IMAGE} .

docker buildx rm ${NAME}
