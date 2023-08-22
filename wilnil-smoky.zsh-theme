autoload -Uz vcs_info

B_PRE='%B%F{cyan}░▒%f%b%K{cyan}%F{black}'
B_POST='%f%k%B%F{cyan}▒░%f%b'

GIT_PRE='%B%F{cyan}[%f%b%K{cyan}%F{black}'
GIT_POST='%f%k%B%F{cyan}]%f%b'

ZSH_THEME_GIT_PROMPT_PREFIX="$GIT_PRE%{$reset_color%}±%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_POST"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

END='%B%F{cyan}$%f%b '

PROMPT=$'$B_PRE%~$B_POST $(git_prompt_info)\n$END'



