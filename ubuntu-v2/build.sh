#!/bin/bash

ctr=$(buildah from ubuntu:noble)
buildah config --env DEBIAN_FRONTEND=noninteractive $ctr

IMAGE_PATH=$(buildah run $ctr -- printenv PATH)

buildah run $ctr -- apt-get update
buildah run $ctr -- apt-get -y upgrade
buildah run $ctr -- apt-get -y install --no-install-recommends \
    git git-lfs ca-certificates curl jq unzip xz-utils zstd

IMAGE_PATH="/opt/node/bin:$IMAGE_PATH"
# VERSION=$(curl -s "https://nodejs.org/dist/index.json" | jq -r "map(select(.lts))[0].version")
# buildah run $ctr -- curl -s "https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz" | tar -xJ --one-top-level=/opt/node --strip-components=1
# buildah run $ctr -- find /opt/node/include/node/openssl/archs -mindepth 1 -maxdepth 1 -not -name "linux-x86_64" -exec rm -rf {} +

VERSION=$(curl -s "https://help.perforce.com/helix-core/release-notes/current/relnotes.txt" | grep -oP -m1 "(?<=Version 20)\d\d\.\d")
buildah run $ctr -- curl -s "https://filehost.perforce.com/perforce/r$VERSION/bin.linux26x86_64/p4" -o /usr/local/bin/p4
buildah run $ctr -- chmod 755 /usr/local/bin/p4

buildah run $ctr -- apt clean
buildah run $ctr -- rm -rf /tmp/* /var/cache/* /var/lib/apt/lists/* /var/log/*

buildah config --env PATH="$IMAGE_PATH" $ctr
buildah commit $ctr test-ubuntu
# buildah rm $ctr
