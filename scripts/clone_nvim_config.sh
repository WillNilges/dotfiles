#!/bin/bash
set -euo pipefail

mkdir -p ~/.config
git clone git@github.com:willnilges/kickstart.nvim $HOME/.config/nvim
