#
# ~/.bash_profile
#

export QT_QPA_PLATFORMTHEME='qt5ct'
export PDFVIEWER=zathura
export BROWSER=opera

set -o vi
export EDITOR=vim

#Toolbar for anthy
#ibus-daemon -drx

# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

#PS1='[\u@\h \W]\$ '

#vi mode
#export PS1='\[\e[0;97;44m\]\u\[\e[0;34;45m\]\[\e[0;97;45m\]\W\[\e[0;35;41m\]\[\e[0;97;41m\]\$\[\e[0;31m\] \[\e[m\]'
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/otreblan/.gem/ruby/2.6.0/bin/


if [ "$TERM" = "linux" ]; then
echo -en "\e]P0000000"
echo -en "\e]P8616981"
echo -en "\e]P1E14245"
echo -en "\e]P9316F7E"
echo -en "\e]P25CA75B"
echo -en "\e]PAADD488"
echo -en "\e]P3F6AB32"
echo -en "\e]PBFDC35F"
echo -en "\e]P44877B1"
echo -en "\e]PC8CA9BF"
echo -en "\e]P5A660C3"
echo -en "\e]PDE2AFEC"
echo -en "\e]P65294E2"
echo -en "\e]PE73C5E2"
echo -en "\e]P7A9A9AA"
echo -en "\e]PFFCFCFC"
clear
#setfont /usr/share/kbd/consolefonts/ter-powerline-v14b.psf.gz &
fi


[[ -f ~/.bashrc ]] && . ~/.bashrc
#[[ -f ~/.shell_prompt.sh ]] && source ~/.shell_prompt.sh
