#!/bin/bash

# Perforce packages does not support arm64
# curl -s https://package.perforce.com/perforce.pubkey | gpg --dearmor | tee /usr/share/keyrings/perforce.gpg
# echo 'deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu noble release' >/etc/apt/sources.list.d/perforce.list
# apt-get -y update
# apt-get -y install helix-cli

ARCH=$(arch)
RELEASE_NOTES="https://help.perforce.com/helix-core/release-notes/current/relnotes.txt"
VERSION=$(curl -s "$RELEASE_NOTES" | grep -oP "(?<=Version \d\d)[\d.]+")
DOWNLOAD_URL="https://filehost.perforce.com/perforce/r$VERSION/bin.linux26$ARCH/p4"

curl -s "$DOWNLOAD_URL" -o /usr/local/bin/p4
chmod +x /usr/local/bin/p4
