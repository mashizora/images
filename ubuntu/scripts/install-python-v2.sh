#!/bin/bash

VERSION=$(curl -s https://docs.python.org/3/index.html | grep -oP -m1 "(?<=Python )\d+\.\d+\.\d+")
if [[ -z "$VERSION" ]]; then
    echo "Error: Failed to get python version." >&2
    exit 1
fi

RELEASE_TAG=$(curl -s https://api.github.com/repos/astral-sh/python-build-standalone/releases/latest | jq -r ".tag_name")
if [[ -z "$RELEASE_TAG" ]]; then
    echo "Error: Failed to get python-build-standalone release tag." >&2
    exit 1
fi

DOWNLOAD_URL="https://github.com/astral-sh/python-build-standalone/releases/download/$RELEASE_TAG/cpython-$VERSION+$RELEASE_TAG-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"
curl -sL -o - "$DOWNLOAD_URL" | tar -xz --directory /usr/local --strip-components=1
