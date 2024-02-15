#!/bin/bash
set -e
sudo apt -y install protobuf-compiler libprotobuf-dev libncurses5-dev zlib1g-dev libutempter-dev libssl-dev
git clone https://github.com/mobile-shell/mosh
git checkout mosh-1.4.0
cd mosh
./autogen.sh
./configure
make
make install
