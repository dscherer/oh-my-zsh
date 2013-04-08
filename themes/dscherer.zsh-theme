PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]
local env_prefix='‹'
local env_suffix='›'
eval electric_green='$FG[082]'


# Dem effects
local reset=$FX[reset]
local bold=$FX[bold]
local italic=$FX[italic]
local orange=$FG[208]
local uline=$FX[underline]



# PROMPT='%(!.%{$fg_bold[red]%}%m.%{$fg_bold[green]%}%m)%{$reset_color%}\
PROMPT='$orage%m%{$reset_color%}\
::%2c%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) \
%{$reset_color%}%{$PROMPT_PROMPT%}➤%{$reset_color%} '
RPROMPT=${venv_status}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

add-zsh-hook precmd build_prompt
build_prompt() {
    # Oh yeah, we got Python
    [ $VIRTUAL_ENV ] && {
        venv_name=$(basename "$VIRTUAL_ENV")
        local venv_status='$electric_green$env_prefix$venv$venv_name$env_suffix$reset '
    }


    PROMPT='%(!.%{$fg_bold[red]%}%m.%{$fg_bold[green]%}%m)%{$reset_color%}\
::%2c%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) \
%{$reset_color%}%{$PROMPT_PROMPT%}➤%{$reset_color%} '
    RPROMPT=${venv_status}
}

