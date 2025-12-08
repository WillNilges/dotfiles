# To make kube-ps1 work,
# brew install kube-ps1
# then add this to your .zshrc
# source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
plugins=(
  kube-ps1
)

PROMPT='%b%F{green}%3~ %b%F{cyan}$(hg_prompt_info)'(⎈ '$(kubectx -c)')' $(git_prompt_info)%B%(!.%F{red}.%F{blue})»%f%b '
RPS1='%(?..%F{red}%? ↵%f)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[magenta]%}hg:‹%{$fg[yellow]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[magenta]%}› %{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_HG_PROMPT_CLEAN=""
