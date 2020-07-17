export ZSH="/home/wnilges/.oh-my-zsh"

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
alias sl="ls"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias bcl="bc -l"
alias clc="bc -l"
alias allow="chmod +x "
alias fgui="nautilus ."
alias mtpt="/media/wnilges"
alias img2tftp="sudo cp councilrock-telig.img.gz /var/lib/tftpboot"
alias datepls="date -Iseconds --utc"
alias vpn="barracudavpn"
alias xit="exit"
alias cls="clear"
alias 'lx?'="lxc list"
alias mssh=bosh
alias pubkey="cat ~/.ssh/id_rsa.pub"
alias myprivates="cat ~/.ssh/id_rsa"
alias allmykeys="cat ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub"

lxattach () {
    lxc exec $1 -- /bin/bash && return 0\
    || echo 'Starting container...' && lxc start $1 && lxc exec $1 -- /bin/bash && return 0\
    || (echo "Huh. It's still not starting. Here's the available containers: "; lxc list)
}

function letme () {
    chmod +x "$@"
    ./$@
}

suckitjs() {
app=$1; install-peerdeps $app || npm i $app
}

function expect_ssh () {
expect ~/.exp $2 ssh $1
}

. ~/.password_file.conf
default_boxssh_subnet=3
bosh_password=
function bosh () {
    if [ -z "$2" ];
    then
        func_password=$bosh_password
    else
        func_password=$2
    fi
    if [[ ! $1 == *"."* ]];
    then
        ssh root@10.10.$default_boxssh_subnet.$1
        #expect_ssh root@10.10.$default_boxssh_subnet.$1 $func_password
    else
        ssh root@10.10.$1
        #expect_ssh root@10.10.$default_boxssh_subnet.$1 $func_password
    fi
}

function ucsh () {
    func_password=$uc_password
    if [[ ! $1 == *"."* ]];
    then
        ssh councilrock@10.10.$default_boxssh_subnet.$1
        #expect_ssh councilrock@10.10.$default_boxssh_subnet.$1 $func_password
    else
        ssh councilrock@10.10.$1
        #expect_ssh councilrock@10.10.$default_boxssh_subnet.$1 $func_password
    fi
}

alias ucesh="ssh councilrock@10.0.3.1"
