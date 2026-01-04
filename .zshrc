export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

export SSH_AUTH_SOCK="/tmp/$USER.agent"

# Scratchypad
alias scratchypad="~/Code/dotfiles/scratchypad.sh"

# Networking
alias scan_wifi="nmcli dev wifi list --rescan yes"

# Editing Quality of Life
alias zshrc="nvim ~/.zshrc"
alias v="nvim"
alias code="codium"

# Navigation 
alias sl="ls"
alias fgui="dolphin .&"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' #https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias t="tmux"

# Python convenience
alias py="python3"
alias py3="python3"
alias py2="python2"
alias new_venv="python -m venv .venv"
alias activate="source .venv/bin/activate"

# Kube convenience
alias o="oc"
alias k="kubectl"
alias pik="kubectl --kubeconfig=$HOME/.kube/central.kubeconfig"

alias p="podman"

# Docker (and act) convenience
alias dock="docker"
alias wact="act --pull=false -P ubuntu-latest=willnilges/act-ubuntu-latest:latest --container-options '--network host'" # Check the act directory if this breaks and build as such

#alias dockstop="docker stop $(docker ps -a -q)"
#alias dockclear="docker rm $(docker ps -a -q)"

alias nixedit="nvim ~/Code/dotfiles/nixos/"
alias nixswitch="nixos-rebuild switch --use-remote-sudo --flake ~/Code/dotfiles/nixos#$(hostname)"
alias nixboot="nixos-rebuild boot --use-remote-sudo --flake ~/Code/dotfiles/nixos#$(hostname)"

pik-ns () {
    pik config set-context --current --namespace=$1
}

# Good memes
alias shrug="clear && echo '¯\_(ツ)_/¯'"
alias lenny="clear && echo '( ͡° ͜ʖ ͡°)'"

# Make SSH Agent work properly
alias agent='eval "$(ssh-agent -a /tmp/$USER.agent)" && ssh-add ~/.ssh/id_ed25519'

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

# Update a .env-style config file without opening it
cfg() {
    input_file=$1
    input_key=$2
    input_val=$3

    if [ ! -f $input_file ]; then
        echo "File does not exist."
        return
    fi

    grep "$input_key"'=' $input_file >> /dev/null 

    if [ $? -eq 0 ]; then
        sed -i "s/$input_key=.*/$input_key=$input_val/" $input_file
    else
        echo "$input_key=$input_val" >> $input_file
    fi
}

cfg_del() {
    input_file=$1
    input_key=$2

    if [ ! -f $input_file ]; then
        echo "File does not exist."
        return
    fi

    sed -i "/$input_key=.*/d" $input_file
}

# MeshDB beta env
export KUBECONFIG=~/.kube/config-dev3
alias prod1="KUBECONFIG=~/.kube/config-prod1 kubectl"
alias prod2="KUBECONFIG=~/.kube/config-prod2 kubectl"
alias dev3="KUBECONFIG=~/.kube/config-dev3 kubectl"
alias gamma1="KUBECONFIG=~/.kube/config-gamma1 kubectl"

alias pub="KUBECONFIG=~/.kube/config-pub kubectl"
alias helmpub="helm --kubeconfig ~/.kube/config-pub"

# Created by `pipx` on 2024-09-01 14:22:53
export PATH="$PATH:/home/wilnil/.cargo/bin:/home/wilnil/.local/bin"

# Contents of export-esp.sh
export PATH="/home/wilnil/.rustup/toolchains/esp/xtensa-esp-elf/esp-14.2.0_20240906/xtensa-esp-elf/bin:$PATH"
export LIBCLANG_PATH="/home/wilnil/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-19.1.2_20250225/esp-clang/lib"
