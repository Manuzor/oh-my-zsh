# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}✗%?%{$reset_color%})"

function _make-prompt()
{
	local theUser='%{$fg_bold[blue]%}%n%{$reset_color%}'
	local theMachine='%{$fg_no_bold[cyan]%}%m%{$reset_color%}'
	local theDir='%{$fg_bold[blue]%}%~%{$reset_color%}'
	local gitInfo=' $(git_prompt_info)'
	local theTime='[%{$fg_no_bold[cyan]%}%*%{$reset_color%}]'
	local promptChar='%{$fg_bold[blue]%}%(!.#.»)%{$reset_color%}'

	echo "${theUser}@${theMachine}:${theDir}${gitInfo} ${return_code}"
	echo "${theTime} ${promptChar} "
}

function _make-rprompt()
{
	echo "%?"
}

# primary prompt
PROMPT="$(_make-prompt)"

# right prompt
RPROMPT="$(_make-rprompt)"

#PROMPT2='[%F{gray}%*%f]'
#RPS1='${return_code}'
RPS1=""

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"


# custom functions

git_prompt_info () {
	ref=$(command git symbolic-ref HEAD 2> /dev/null)  || ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}