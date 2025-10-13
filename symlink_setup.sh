#!/bin/bash

declare -a links=(
	~/Code/dotfiles/alacritty.toml ~/.config/alacritty.toml
	~/Code/dotfiles/.zshrc ~/.zshrc
	~/Code/dotfiles/.tmux.conf ~/.tmux.conf
	~/Code/dotfiles/wilnil-lowkey.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-lowkey.zsh-theme
	~/Code/dotfiles/wilnil-smoky.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-smoky.zsh-theme

	# Unused on willardpad
	#~/Code/dotfiles/.vimrc ~/.vimrc
	#~/Code/dotfiles/nvim/ ~/.config/nvim
	#~/Code/dotfiles/openbox ~/.config/openbox
	#~/Code/dotfiles/rofi ~/.config/rofi
)

test_link() {
	if [ -L $1 ] ; then
	   if [ -e $1 ] ; then
	      echo "Good link"
	   else
	      echo "Broken link"
	   fi
	elif [ -e $1 ] ; then
	   echo "Not a link"
	else
	   echo "Missing"
	fi
}

for ((i=0; i<${#links[@]}; i+=2)); do
	src=${links[i]}
	dest=${links[i+1]}
	echo $src $dest
	exists=$(test_link $dest)
	if [ ! "$exists" = "Good link" ]; then
		ln -s $src $dest
	else
		echo "Link already exists."
	fi
done
