#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Checking if it's not a tty {{{
if [[ "$TERM" != "linux" ]]
then
	#Terminal recorder


	#This is depecrated. Thanks to asciinema

	#Checking if this shell was called from script
#	if ! [[ $(ps --format command= ${PPID}) =~ ^script.* ]]
#	then
#		YEAR=$(date +%Y)
#		MONTH=$(date +%m)
#		DAY=$(date +%d)
#		HOUR=$(date +%H)
#		MINUTE=$(date +%M)
#		DIRPATH=${HOME}/log/${YEAR}/${MONTH}/${DAY}/${HOUR}
#
#		mkdir -p ${DIRPATH}
#		script -t${DIRPATH}/${MINUTE}.txt ${DIRPATH}/${MINUTE}.log
#	fi

	#Checking if this shell was called from asciinema
	if ! [[ $(ps --format command= ${PPID}) =~ .*asciinema.* ]]
	then
		YEAR=$(date +%Y)
		MONTH=$(date +%m)
		DAY=$(date +%d)
		HOUR=$(date +%H)
		MINUTE=$(date +%M)
		DIRPATH=${HOME}/log/${YEAR}/${MONTH}/${DAY}/${HOUR}

		mkdir -p ${DIRPATH}
		asciinema rec ${DIRPATH}/${MINUTE}.cast
	fi

	#Vim promptline on bash
	if [[ -f ~/.shell_prompt.sh ]]
	then
		source ~/.shell_prompt.sh
		fi
fi #}}}

alias ls='ls --color=auto'
alias grep='grep --colour'
alias Syu='sudo powerpill -Syu'
alias man="~/manvim.sh"
#alias emacs="emacs --no-window-system"

#vi mode
set -o vi
neofetch

#Fuzzy search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
