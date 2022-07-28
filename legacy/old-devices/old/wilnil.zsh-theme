# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

autoload -Uz vcs_info

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{\e[0;39m%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✗%{$fg_bold[blue]%}) "

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[0;34m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} %{\e[0;34m%}%B[%b%{\e[0;34m%}'%D{"%H:%M"}%b$'%{\e[0;34m%}%B] %b%{\e[0;34m%}$(git_prompt_info)%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} %b%{\e[0m%}
%{\e[0;34m%}%B└─%B%{\e[1;32m%}[⚡] %{\e[0m%}%b'
PS2=$' \e[0;34m%}%B%{\e[0m%}%b '

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
