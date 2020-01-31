# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

autoload -Uz vcs_info

# green sheen
eval my_green='$FG[084]'
eval drk_green='$FG[078]'
eval blue_tm='$FG[032]'

# git theming
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{\e[0;39m%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX=" "
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%}) "

ZSH_THEME_GIT_PROMPT_PREFIX="%B%{$my_green%}[%b%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%{$my_green%}]%b "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

WHOAMI='%{$blue_tm%}%B[%b%{\e[0m%}%{\e[1;39m%}%b%n@%m%{$blue_tm%}%B]'
PROMPT=$'%b%{\e[0m%} %b%{$my_green%}%B[%b%{\e[1;37m%}%~%{$my_green%}%B]%b%{\e[0m%} %b%{\e[0m%}$(git_prompt_info)%{$my_green%}%B$ %{\e[0m%}%b'

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"


