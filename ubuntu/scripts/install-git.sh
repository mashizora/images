#!/bin/bash

add-apt-repository ppa:git-core/ppa
apt-get update
apt-get -y install git
git config --system --add safe.directory "*"

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get -y install git-lfs
