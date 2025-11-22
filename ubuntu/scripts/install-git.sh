#!/bin/bash

# Install git
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get -y install git
git config --system --add safe.directory "*"

# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get -y install git-lfs

git version
git lfs version
