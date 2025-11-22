#!/bin/bash

curl -s https://fnm.vercel.app/install | bash
source /root/.bashrc && fnm install --lts

fnm --version
node --version
