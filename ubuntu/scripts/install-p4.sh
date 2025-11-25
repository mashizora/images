#!/bin/bash

RELNOTES_URL="https://help.perforce.com/helix-core/release-notes/current/relnotes.txt"
VERSION=$(curl -s "$RELNOTES_URL" | grep -oP -m1 "(?<=Version )\d{4}\.\d")
DOWNLOAD_URL="https://filehost.perforce.com/perforce/r${VERSION:2}/bin.linux26$(arch)/p4"

curl -s "$DOWNLOAD_URL" -o /usr/local/bin/p4
chmod 755 /usr/local/bin/p4
