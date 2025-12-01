#!/bin/bash

VERSION=$(curl -s "https://help.perforce.com/helix-core/release-notes/current/relnotes.txt" | grep -oP -m1 "(?<=Version \d\d)\d\d\.\d")
curl -s "https://filehost.perforce.com/perforce/r$VERSION/bin.linux26x86_64/p4" -o /usr/local/bin/p4 && chmod 755 /usr/local/bin/p4
