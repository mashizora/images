#!/bin/bash

curl -sL "https://github.com/oven-sh/bun/releases/latest/download/bun-linux-x64.zip" -o /tmp/bun.zip
unzip -qd /usr/local/bin /tmp/bun.zip && rm -f /tmp/bun.zip
