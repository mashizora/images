#!/bin/bash

curl -s https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor | tee /usr/share/keyrings/kitware.gpg
echo 'deb [signed-by=/usr/share/keyrings/kitware.gpg] https://apt.kitware.com/ubuntu/ noble main' >/etc/apt/sources.list.d/kitware.list
apt-get -y update
apt-get -y install cmake
