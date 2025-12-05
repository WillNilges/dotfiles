#!/bin/bash

set -euo pipefail

git clone git@github.com:neovim/neovim || echo 'already cloned nvim'
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make -j 8 install
cd

# Get my nvim configs
git clone git@github.com:willnilges/kickstart.nvim $HOME/.config/nvim || echo 'already cloned config'

# Get dotfiles
mkdir $HOME/Code
git clone git@github.com:willnilges/dotfiles ~/Code/dotfiles || echo 'already cloned dotfiles'
cd $HOME/Code/dotfiles
