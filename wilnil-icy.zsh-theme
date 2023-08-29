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

GIT_CHUNK_END="▗%k▛▞%{$reset_color%}"

KUBE_PS1_PREFIX="%F{white}▞▟%K{white}▘%f"
KUBE_PS1_SUFFIX="%K{white}%F{white}▗%k▛▞%f"

KUBE_PS1_DIVIDER="▞"
KUBE_PS1_SEPARATOR=""
KUBE_PS1_CTX_COLOR="black"
KUBE_PS1_NS_COLOR="black"

ZSH_THEME_GIT_PROMPT_PREFIX="$CHUNK_START%{$fg_bold[white]%}±%{$reset_color%}%K{blue}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_CHUNK_END%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue}▗%K{green}▘%f%{$fg_bold[black]%}✔%F{green}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}▗%K{red}▘%f%{$fg_bold[white]%}✗%F{red}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

WHOAMI='%{$blue_tm%}%B[%b%{\e[0m%}%{\e[1;39m%}%b%n@%m%{$blue_tm%}%B]'

PATH_CHUNK="$CHUNK_START%F{white}%D{%L:%M:%S} %B%~%f%b$CHUNK_END"

ICEBERG="%(?.%F{white}.%F{red})⛰ %f"

TIME_CHUNK="$CHUNK_START%D{%L:%M:%S}$CHUNK_END"

PROMPT=$'$PATH_CHUNK $(kube_ps1) $(git_prompt_info)\n$ICEBERG'

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
