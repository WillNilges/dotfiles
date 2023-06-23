export ZSH="/home/wilnil/.oh-my-zsh"

ZSH_THEME="wilnil-lowkey"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

alias zshrc="nvim ~/.zshrc"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"
alias sl="ls"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias bcl="bc -l"
alias clc="bc -l"
alias fgui="dolphin .&"
alias xit="exit"
alias cls="clear"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' #https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias shrug="clear && echo '¯\_(ツ)_/¯'"
alias lenny="clear && echo '( ͡° ͜ʖ ͡°)'"
alias agent='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'

key (){
    key="ed25519"
    type=".pub"
    while test $# -gt 0; do
        case "$1" in
            --rsa)
                key="rsa"
                ;;
            --ed25519)
                key="ed25519"
                ;;
            --private || -p)
                type=""
                ;;
        esac
        shift
    done
    cat /home/wilnil/.ssh/id_$key$type

}

# Clone a git repo real easy
gogit () {
    git clone git@github.com:$1.git $2
}

# Query Command Not Found for the correct Arch package to install
cnf() {
    chom=$(curl --silent https://command-not-found.com/$1 | grep pacman)
    echo $chom | sed -e 's/<[^>]*>//g'
}
