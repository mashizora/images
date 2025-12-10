#!/bin/bash

curl -sL "https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl-shared.tar.xz" | tar -xJ --one-top-level=/opt/ffmpeg --strip-components=1
echo "/opt/ffmpeg/lib" >"/etc/ld.so.conf.d/ffmpeg.conf" && ldconfig
