#!/bin/bash

set -euo pipefail

# Setup script for datadog workspaces.

# Clone my dotfiles
mkdir $HOME/Code
git clone git@github.com:willnilges/dotfiles $HOME/Code/dotfiles

# Compile and install neovim from source (Ubuntu's version of Neovim is old)
# This will also grab my dotfiles
bash $HOME/Code/dotfiles/scripts/compile_neovim.sh

# Configure symlinks I care about for workspaces
ln -s ~/Code/dotfiles/.tmux.conf ~/.tmux.conf || echo "Link already exists"
