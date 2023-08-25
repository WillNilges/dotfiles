# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

autoload -Uz vcs_info

CHUNK_START="%F{blue}▞▟%K{blue}▘%f"
CHUNK_END="%K{blue}%F{blue}▗%k▛▞%f"
GIT_CHUNK_END="▗%k▛▞%{$reset_color%}"

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

PROMPT=$'$CHUNK_START%B%F{white}%~%f%b$CHUNK_END $(git_prompt_info)\n⛰ '

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"

