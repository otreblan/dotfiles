#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ "$TERM" != "linux" ]; then
[[ -f ~/.shell_prompt.sh ]] && source ~/.shell_prompt.sh
fi

alias ls='ls --color=auto'
alias grep='grep --colour'
alias Syu='sudo powerpill -Syu'
alias man="~/manvim.sh"
alias emacs="emacs --no-window-system"
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;97;44m\]\u\[\e[0;34;45m\]\[\e[0;97;45m\]\W\[\e[0;35;41m\]\[\e[0;96;41m\] \[\e[0;31m\] \[\e[m\]'
#vi mode
set -o vi
neofetch
