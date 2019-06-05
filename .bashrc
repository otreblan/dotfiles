#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Terminal recorder

#Checking if this shell was called from script
if ! [[ $(ps --format command= ${PPID}) =~ ^script.* ]]
then
	YEAR=$(date +%Y)
	MONTH=$(date +%m)
	DAY=$(date +%d)
	HOUR=$(date +%H)
	DIRPATH=${HOME}/${YEAR}/${MONTH}/${DAY}

	mkdir -p ${DIRPATH}
	script -a -t${DIRPATH}/${HOUR}.txt ${DIRPATH}/${HOUR}.log
fi

#Vim promptline on bash
if [[ "$TERM" != "linux" ]]
then
	if [[ -f ~/.shell_prompt.sh ]]
	then
		source ~/.shell_prompt.sh
		fi
fi

alias ls='ls --color=auto'
alias grep='grep --colour'
alias Syu='sudo powerpill -Syu'
alias man="~/manvim.sh"
alias emacs="emacs --no-window-system"

#vi mode
set -o vi
neofetch
