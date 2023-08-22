#!/bin/bash

test_link() {
	if [ -L ${my_link} ] ; then
	   if [ -e ${my_link} ] ; then
	      echo "Good link"
	   else
	      echo "Broken link"
	   fi
	elif [ -e ${my_link} ] ; then
	   echo "Not a link"
	else
	   echo "Missing"
	fi
}

ln -s ~/Code/dotfiles/.vimrc ~/.vimrc
ln -s ~/Code/dotfiles/nvim/ ~/.config/nvim
ln -s ~/Code/dotfiles/openbox ~/.config/openbox
ln -s ~/Code/dotfiles/alacritty.yml ~/.config/alacritty.yml
ln -s ~/Code/dotfiles/rofi ~/.config/rofi
ln -s ~/Code/dotfiles/.zshrc ~/.zshrc
ln -s ~/Code/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Code/dotfiles/wilnil-lowkey.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-lowkey.zsh-theme
ln -s ~/Code/dotfiles/wilnil-smoky.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-smoky.zsh-theme
