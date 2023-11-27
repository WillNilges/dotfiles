# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

autoload -Uz vcs_info

#SEGMENT_SEPARATOR="%K{blue}▗%k▛▞"
#BEGINNING_SEGMENT_SEPARATOR="▞▟%K{blue}▘%k"
#TRANSITION_SEPARATOR="%K{blue}▞▟▛▞%k"

CHUNK_START="%F{blue}▞▟%K{blue}▘%f"
CHUNK_END="%K{blue}%F{blue}▗%k▛▞%f"

ZSH_THEME_GIT_PROMPT_PREFIX="$CHUNK_START%{$fg_bold[green]%}±%{$reset_color%}%K{blue}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$CHUNK_END"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

WHOAMI='%{$blue_tm%}%B[%b%{\e[0m%}%{\e[1;39m%}%b%n@%m%{$blue_tm%}%B]'
#PROMPT=$'%b%{\e[0m%}%b%F{blue}%B$BEGINNING_SEGMENT_SEPARATOR%f%K{blue}%b%{\e[1;37m%}%~%{$my_green%}%B%k%F{blue}$SEGMENT_SEPARATOR%f %b%{\e[0m%}%b%{\e[0m%}$(git_prompt_info)%F{blue}%B\n$ %{\e[0m%}%b%f'

PROMPT=$'$CHUNK_START%B%F{white}%~%f%b$CHUNK_END $(git_prompt_info)\n⛰ '

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"

