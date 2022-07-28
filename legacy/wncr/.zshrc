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
alias vpn="export TERM=xterm; barracudavpn"
alias cls="clear"
alias 'lx?'="lxc list"
alias mssh=bosh
alias pubkey="cat ~/.ssh/id_rsa.pub"
alias myprivates="cat ~/.ssh/id_rsa"
alias allmykeys="cat ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub"
#alias ghtoken="export GITHUB_TOKEN=$(cat ~/githubtoken.txt)"
alias tftpstart="sudo /etc/init.d/tftpd-hpa start && sudo ufw allow tftp"
alias tftpstop="sudo /etc/init.d/tftpd-hpa stop && sudo ufw deny tftp"
alias testpi="ssh pi@10.10.3.15" # This may change from time to time.
alias fgfi="./run.sh || ./do.sh || ./test.sh" #Fuckin' go for it!
alias qt-old=". /opt/poky/2.3.4/environment-setup-cortexa9hf-neon-poky-linux-gnueabi && /home/wnilges/Qt/Tools/QtCreator/bin/qtcreator.sh &"
alias lumenpi="ssh ubuntu@10.10.2.116" # Subject to change.
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' #https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias k="kubectl"
alias qt=". /opt/inversol-lumen2/3.1/environment-setup-aarch64-fslc-linux && /home/wnilges/Qt/Tools/QtCreator/bin/qtcreator.sh &"
alias mqtte='/home/wnilges/.local/share/MQTT-Explorer-0.3.5.AppImage &'
alias git-branch-stale='git for-each-ref --sort=committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias a-dog='git log --all --decorate --oneline --graph'

# Fuck, Typos.
alias scd="cd" 
alias sl="ls"
alias xit="exit"
alias exi="exit"
alias ext="exit"
alias exu="exit"

# Emojis?
alias shrug="clear && echo '¯\_(ツ)_/¯'"
alias lenny="clear && echo '( ͡° ͜ʖ ͡°)'"
alias bear="clear && echo 'ʕ•ᴥ•ʔ'"
alias ritstudent="clear && echo '┬┴┬┴┤ ͜ʖ ͡°) ├┬┴┬┴'"

# Recursively find and replace inside a directory.
find-replace() {
    search_for=$1
    inside=$2
    replace_with=$3
    grep -rl "$search_for" $inside | xargs sed -i 's/'$search_for'/'$replace_with'/g'
}

ssh-forget () { #The cooler Daniel
  ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$1"
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

#. ~/.password_file.conf
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

#export KUBECONFIG=~/Documents/vista-base-test/kube_config_cluster.yml
