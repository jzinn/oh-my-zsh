PROMPT='
%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$fg[green]%}@%m:%{$fg[yellow]%}%~%{$reset_color%}$(git_prompt_info)
%(!.%{$fg[red]%}#%{$reset_color%}.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}*%{$reset_color%})"
