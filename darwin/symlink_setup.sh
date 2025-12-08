#!/bin/bash

declare -a links=(
    ~/Code/dotfiles/darwin/.aerospace.toml ~/.aerospace.toml
    ~/Code/dotfiles/darwin/.zshrc ~/.zshrc
    ~/Code/dotfiles/darwin/.tmux.conf ~/.tmux.conf
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
