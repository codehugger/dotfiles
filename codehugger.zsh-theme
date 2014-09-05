VIRTUAL_ENV_DISABLE_PROMPT="true"
 
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '%F{blue}[%F{magenta}'`basename $VIRTUAL_ENV`'%F{blue}]%f'
}
 
PROMPT='%F{blue}Σ%f '
RPROMPT=' %F{blue}[%F{yellow}%2~$(git_prompt_info)%F{blue}]$(virtualenv_info)%f'
 
ZSH_THEME_GIT_PROMPT_PREFIX="%f: %F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
