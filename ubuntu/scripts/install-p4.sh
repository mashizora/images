#!/bin/bash

curl -s https://package.perforce.com/perforce.pubkey | gpg --dearmor | tee /usr/share/keyrings/perforce.gpg
echo 'deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu noble release' >/etc/apt/sources.list.d/perforce.list
apt-get -y update
apt-get -y install helix-cli
