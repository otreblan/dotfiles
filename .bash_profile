#
# ~/.bash_profile
#

export QT_QPA_PLATFORMTHEME='qt5ct'
export PDFVIEWER=zathura
export BROWSER=opera

export EDITOR=nvim

# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

# Neovim as manpager reader
export MANPAGER="nvim +Man!"


export PATH="/home/otreblan/.gem/ruby/2.6.0/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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
