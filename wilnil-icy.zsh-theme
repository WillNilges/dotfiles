# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

# To make kube-ps1 work,
# brew install kube-ps1
# then add this to your .zshrc
# source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
plugins=(
  kube-ps1
)

autoload -Uz vcs_info

CHUNK_START="%F{blue}▞▟%K{blue}▘%f"
CHUNK_END="%K{blue}%F{blue}▗%k▛▞%f"
#
#GIT_CHUNK_START=" %F{white}▞▟%K{white}▘%f"
GIT_CHUNK_END="▗%k▛▞%{$reset_color%}"
#
#KUBE_PS1_PREFIX="%F{white}▞▟%K{white}▘%f"
#KUBE_PS1_SUFFIX="%K{white}%F{white}▗%k▛▞%f" #"▗%k▛%f" 
#KUBE_PS1_PREFIX=''
#KUBE_PS1_SUFFIX='%k'
##KUBE_PS1_DIVIDER="▗%K{white}▘"
#KUBE_PS1_SEPARATOR=""
#KUBE_PS1_CTX_COLOR="white"
#KUBE_PS1_NS_COLOR="white"
#
#function get_cluster_short() {
#  stg_or_prod=$(echo "$1" | cut -d . -f3)
#  prod_alert=""
#  if [ $stg_or_prod != 'staging' ]; then
#    prod_alert="%F{white}%K{blue}"
#  fi
#  my_cluster=$(echo "$1" | cut -d . -f1)
#  echo "$prod_alert$my_cluster"
#}
#
#KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

ZSH_THEME_GIT_PROMPT_PREFIX="$GIT_CHUNK_START%{$reset_color%}±"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_CHUNK_END%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{black}▗%K{green}▘%f%{$fg_bold[black]%}✔%F{green}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{black}▗%K{red}▘%f%{$fg_bold[black]%}✗%F{red}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}●%{$reset_color%}"

PATH_CHUNK="$CHUNK_START%F{black}%B%~%f%b$CHUNK_END " # Time is %T

ICEBERG="%(?.%{$reset_color%}.%F{red})⛰ %f"

#PROMPT=$'$PATH_CHUNK$(kube_ps1) $(git_prompt_info)\n$ICEBERG'
PROMPT=$'$PATH_CHUNK$(kubectx -c) $(git_prompt_info)\n$ICEBERG'

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[blue]%}"
