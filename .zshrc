export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="wilnil-fowl"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# BEGIN ANSIBLE MANAGED BLOCK
# Load homebrew shell variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Load python shims
eval "$(pyenv init -)"

# Load ruby shims
eval "$(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Add datadog devtools binaries to the PATH
export PATH="$HOME/dd/devtools/bin:$PATH"

# Point GOPATH to our go sources
export GOPATH="$HOME/go"

# Add binaries that are go install-ed to PATH
export PATH="$GOPATH/bin:$PATH"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="$HOME/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm switch from storing objects in kubernetes configmaps to
# secrets by default, but we still use the old default.
export HELM_DRIVER=configmap

# Go 1.16+ sets GO111MODULE to off by default with the intention to
# remove it in Go 1.18, which breaks projects using the dep tool.
# https://blog.golang.org/go116-module-changes
export GO111MODULE=auto
# Configure Go to pull go.ddbuild.io packages.
export GONOSUMDB=github.com/DataDog,go.ddbuild.io
export GOPRIVATE=
export GOPROXY="https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/magicmirror/@current/|https://depot-read-api-go.us1.ddbuild.io/magicmirror/testing/@current/"
# END ANSIBLE MANAGED BLOCK

# User configuration

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Editing Quality of Life
alias zshrc="nvim ~/.zshrc"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"
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
alias new_venv="python -m venv venv"
alias activate="source venv/bin/activate"

# Kube convenience
alias k="kubectl"

# Good memes
alias shrug="clear && echo '¯\_(ツ)_/¯'"
alias lenny="clear && echo '( ͡° ͜ʖ ͡°)'"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export GITLAB_TOKEN=$(security find-generic-password -a ${USER} -s gitlab_token -w)
