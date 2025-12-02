#!/bin/bash

VERSION=$(curl -s "https://nodejs.org/dist/index.json" | jq -r "map(select(.lts))[0].version")
RELEASE_URL="https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz"
curl -s $RELEASE_URL | tar -xJ --one-top-level=/opt/node --strip-components=1
find /opt/node/include/node/openssl/archs -mindepth 1 -maxdepth 1 -not -name "linux-x86_64" -exec rm -rf {} +
