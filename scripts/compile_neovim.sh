#!/bin/bash

set -euo pipefail

git clone git@github.com:neovim/neovim || echo 'already cloned nvim'
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make -j 8 install
cd

# Get my nvim configs
bash $HOME/Code/dotfiles/scripts/clone_nvim_config.sh || echo 'already cloned config'
