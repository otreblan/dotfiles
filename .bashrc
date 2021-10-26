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

alias diff='diff --color=auto'
alias grep='grep --colour'
alias ip='ip -c'
alias less='less -R'
alias ls='ls --color=auto'
alias mpv='mpv --hwdec=auto'
alias tree='tree -C'

# vi mode
#set -o vi

# System information
fastfetch

#Fuzzy search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Tabsize
tabs -4
