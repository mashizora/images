#!/bin/bash

curl -sL https://astral.sh/uv/install.sh | sh
"$HOME/.local/bin/uv" python install --default
