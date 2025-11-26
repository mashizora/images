#!/bin/bash

ARCH=$(arch)
if [[ "$ARCH" != "x86_64" && "$ARCH" != "aarch64" ]]; then
    echo "Error: Unsupported architecture." >&2
    exit 1
fi

RELNOTES_URL="https://help.perforce.com/helix-core/release-notes/current/relnotes.txt"
VERSION=$(curl -s "$RELNOTES_URL" | grep -oP -m1 "(?<=Version )\d{4}\.\d")
if [[ -z "$VERSION" ]]; then
    echo "Error: Failed to get perforce version." >&2
    exit 1
fi

curl -s "https://filehost.perforce.com/perforce/r${VERSION:2}/bin.linux26${ARCH}/p4" -o /usr/local/bin/p4
chmod 755 /usr/local/bin/p4
