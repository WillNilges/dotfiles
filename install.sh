#!/bin/bash

set -euo pipefail

# Setup script for datadog workspaces.

# Band-Aid fix my signing key
git config --global user.signingKey "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA21sliaNUYxI4KeUqJaDkJD2fZ+six7gF/U2BEBCC2i"

# Compile and install neovim from source (Ubuntu's version of Neovim is old)
# This will also grab my nvim config
bash $HOME/dotfiles/scripts/compile_neovim.sh

# Configure symlinks I care about for workspaces, like tmux
ln -s ~/dotfiles/darwin/.tmux.conf ~/.tmux.conf || echo "Link already exists"
