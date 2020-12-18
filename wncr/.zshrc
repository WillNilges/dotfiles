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

PATH=/home/wnilges/go/bin:/home/wnilges/bin:$PATH

alias ezshrc="nvim ~/.zshrc"
alias ethemes="nvim ~/.oh-my-zsh/custom/themes"
alias vim="nvim"
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
alias vpn="xterm barracudavpn"
alias xit="exit"
alias exi="exit"
alias ext="exit"
alias exu="exit"
alias cls="clear"
alias 'lx?'="lxc list"
alias mssh=bosh
alias pubkey="cat ~/.ssh/id_rsa.pub"
alias myprivates="cat ~/.ssh/id_rsa"
alias allmykeys="cat ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub"
alias ghtoken="export GITHUB_TOKEN=$(cat ~/githubtoken.txt)"
alias tftpstart="sudo /etc/init.d/tftpd-hpa start && sudo ufw allow tftp"
alias tftpstop="sudo /etc/init.d/tftpd-hpa stop && sudo ufw deny tftp"
alias testpi="ssh pi@10.10.3.15" # This may change from time to time.
alias fgfi="./run.sh || ./do.sh || ./test.sh" #Fuckin' go for it!
alias iaq=". /opt/poky/2.3.4/environment-setup-cortexa9hf-neon-poky-linux-gnueabi && /home/wnilges/Qt/Tools/QtCreator/bin/qtcreator.sh"
alias lumenpi="ssh ubuntu@10.10.2.116" # Subject to change.
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' #https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias akcfg='export KUBECONFIG=/home/wnilges/Documents/vista/thingsboard-ce-k8s/aws/eks/kubeconfig_k8s-vista-test'

# Emojis?
alias shrug="clear && echo '¯\_(ツ)_/¯'"

del_id() { #Daniel
    ssh-keygen -f ~/.ssh/known_hosts -R 10.10.3.$1
    echo "Just checking ;)"
    ssh-keygen -f ~/.ssh/known_hosts -R $1
}

ssh-rm () { #The cooler Daniel
  ssh-keygen -f "/home/wnilges/.ssh/known_hosts" -R "$1"
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

# Look momma, I'm a web developer™!
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

blkmv () {
for filename in *$1; do echo mv \"$filename\" \"${filename//$1/$2}\"; done | /bin/bash
}

aliases () {
    cat "$HOME/.zshrc" | grep alias
}

serial () {
    sudo minicom -D /dev/tty$1
}

gogit () {
git clone git@github.com:$1.git $2
}
