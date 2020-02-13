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
alias sl="echo TYPE \'ls\' NEXT TIME, MORON! && ls"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias bcl="bc -l"
alias allow="chmod +x "
alias fgui="nautilus ."

function letme () {
    chmod +x "$@"
    ./$@
}