#!/bin/bash

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

declare -a links=(
	~/Code/dotfiles/.vimrc ~/.vimrc
	~/Code/dotfiles/nvim/ ~/.config/nvim
	~/Code/dotfiles/openbox ~/.config/openbox
	~/Code/dotfiles/alacritty.yml ~/.config/alacritty.yml
	~/Code/dotfiles/rofi ~/.config/rofi
	~/Code/dotfiles/.zshrc ~/.zshrc
	~/Code/dotfiles/.tmux.conf ~/.tmux.conf
	~/Code/dotfiles/wilnil-lowkey.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-lowkey.zsh-theme
	~/Code/dotfiles/wilnil-smoky.zsh-theme ~/.oh-my-zsh/custom/themes/wilnil-smoky.zsh-theme
)

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
