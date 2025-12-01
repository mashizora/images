#!/bin/bash

ctr=$(buildah from ubuntu:noble)
IMAGE_PATH=$(buildah run $ctr -- printenv PATH)

IMAGE_PATH="/opt/node/bin:$IMAGE_PATH"
buildah config --env PATH="$IMAGE_PATH" $ctr

buildah run $ctr -- apt-get update
buildah run $ctr -- apt-get -y upgrade
buildah run $ctr -- apt-get -y install --no-install-recommends \
    ca-certificates \
    software-properties-common \
    curl wget jq unzip xz-utils

buildah commit --tag $ctr test-ubuntu
buildah rm $ctr
