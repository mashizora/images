#!/bin/bash

VERSION=$(curl -s "https://dl.deno.land/release-latest.txt")
curl -s "https://dl.deno.land/release/$VERSION/deno-x86_64-unknown-linux-gnu.zip" -o /tmp/deno.zip
unzip -qd /usr/local/bin /tmp/deno.zip && rm -f /tmp/deno.zip
