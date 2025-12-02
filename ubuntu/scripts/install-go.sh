#!/bin/bash

VERSION=$(curl -s "https://go.dev/dl/?mode=json" | jq -r ".[0].version")
RELEASE_URL="https://go.dev/dl/$VERSION.linux-amd64.tar.gz"
curl -s $RELEASE_URL | tar -xz --one-top-level=/opt/go --strip-components=1
