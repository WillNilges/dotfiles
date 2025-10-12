#!/bin/bash
set -euo pipefail

mkdir -p ~/.config
git clone git@github.com:willnilges/kickstart.nvim ~/.config/nvim

# Use gcc environment to built treesitter
nix shell nixpkgs#gcc && nvim && exit
