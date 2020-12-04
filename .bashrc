#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Checking if it's not a tty {{{
if [[ "$TERM" != "linux" ]]
then
	#Vim promptline on bash
	if [[ -f ~/.shell_prompt.sh ]]
	then
		source ~/.shell_prompt.sh
	fi
fi #}}}

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --colour'
alias tree='tree -C'

# vi mode
set -o vi

# System information
paleofetch

#Fuzzy search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Tabsize
tabs -4
