#!/bin/bash

VERSION=$(curl -s https://static.rust-lang.org/dist/channel-rust-stable.toml | tomlq -r '.pkg.rust.version' | grep -oP '\d+\.\d+\.\d+')
