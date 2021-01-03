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

alias ezshrc="nvim ~/.zshrc"
alias ethemes="nvim ~/.oh-my-zsh/custom/themes"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"
alias sl="ls"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias bcl="bc -l"
alias clc="bc -l"
alias allow="chmod +x "
alias fgui="nautilus ."
alias mtpt="/media/wilnil"
alias datepls="date -Iseconds --utc"
alias xit="exit"
alias cls="clear"
alias 'lx?'="lxc list"
alias pubkey="cat ~/.ssh/id_ed25519.pub"
alias myprivates="cat ~/.ssh/id_ed25519"
alias allmykeys="cat ~/.ssh/id_ed25519 && cat ~/.ssh/id_ed25519.pub"

# Emojis
alias shrug="clear && echo '¯\_(ツ)_/¯'"

sshdelid () {
    ssh-keygen -f "/home/wilnil/.ssh/known_hosts" -R $1
}

lxattach () {
    lxc exec $1 -- /bin/bash && return 0\
    || echo 'Starting container...' && lxc start $1 && lxc exec $1 -- /bin/bash && return 0\
    || (echo "Huh. It's still not starting. Here's the available containers: "; lxc list)
}

function letme () {
    chmod +x "$@"
    ./$@
}

function rpm_dni () {
    cd /tmp/
    mkdir /tmp/rpm_dni
    cd /tmp/rpm_dni
    wget $1 -o rpm_dni_file.rpm
    sudo rpm -i rpm_dni_file.rpm
}

function getkey () {
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
