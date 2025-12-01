#!/bin/bash

VERSION=$(curl -s https://docs.python.org/3/index.html | grep -oP -m1 "(?<=Python )3\.\d+\.\d+")
RELEASE_TAG=$(curl -s https://api.github.com/repos/astral-sh/python-build-standalone/releases/latest | jq -r ".tag_name")
RELEASE_URL="https://github.com/astral-sh/python-build-standalone/releases/download/$RELEASE_TAG/cpython-$VERSION+$RELEASE_TAG-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"
curl -sL -o - "$RELEASE_URL" | tar -xz --one-top-level=/opt/python --strip-components=1
