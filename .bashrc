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

alias curl='curl --http3'
alias diff='diff --color=auto'
alias feh='feh -.'
alias gnome-control-center='XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias grep='grep --colour'
alias ip='ip -c'
alias less='less -RN --incsearch'
alias ls='ls --color=auto'
alias mpv='mpv --hwdec=auto'
alias rsync='rsync --compress-choice=zstd --compress-level=3 --checksum-choice=xxh3'
alias sysyadm='sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data'
alias tree='tree -C'
alias watch='watch --color'

# System information
fastfetch --load-config neofetch.jsonc

#Fuzzy search
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Tabsize
tabs -4

PATH="/home/aru/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/aru/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/aru/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/aru/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/aru/perl5"; export PERL_MM_OPT;
