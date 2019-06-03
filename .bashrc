#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Vim promptline on bash
if [ "$TERM" != "linux" ]; then
	[[ -f ~/.shell_prompt.sh ]] && source ~/.shell_prompt.sh
fi

alias ls='ls --color=auto'
alias grep='grep --colour'
alias Syu='sudo powerpill -Syu'
alias man="~/manvim.sh"
alias emacs="emacs --no-window-system"

#vi mode
set -o vi
neofetch
