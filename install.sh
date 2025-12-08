#!/bin/bash

set -euo pipefail

# Setup script for datadog workspaces.

# Compile and install neovim from source (Ubuntu's version of Neovim is old)
# This will also grab my nvim config
bash $HOME/dotfiles/scripts/compile_neovim.sh

# Configure symlinks I care about for workspaces, like tmux
ln -s ~/dotfiles/darwin/.tmux.conf ~/.tmux.conf || echo "Link already exists"
