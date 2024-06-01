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
alias feh='feh -.'
alias gnome-control-center='XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias grep='grep --colour'
alias ip='ip -c'
alias less='less -RN --incsearch'
alias ls='ls --color=auto'
alias mpv='mpv --hwdec=auto'
alias rsync='rsync --compress-choice=zstd --compress-level=3 --checksum-choice=xxh3'
alias tree='tree -C'

# System information
fastfetch --load-config neofetch.jsonc

#Fuzzy search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Tabsize
tabs -4
