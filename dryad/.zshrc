# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wilnil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wilnil-lowkey"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias letme="chmod +x"
alias sl="echo It\'s \'ls\', moron! && echo && ls"
