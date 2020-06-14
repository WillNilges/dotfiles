# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wilnil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wilnil-lowkey"

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

alias vi="nvim"
alias vim="nvim"
alias sl="echo \(correcting to \'ls\'\) && ls"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias bcl="bc -l"
alias allow="chmod +x "
alias fgui="nautilus ."
alias school="cd ~/Documents/2-2-RIT/"
alias eixt="echo \(correcting to \'exit\'\) && exit"
alias bsdfuck="echo 'The command to get video out is: set kern.vty=\"sc\"' && echo 'The command to enable networking is: ifconfig em0 inet 10.0.0.19 && dhclient em0"

function letme () {
    chmod +x "$@"
    ./$@
}
