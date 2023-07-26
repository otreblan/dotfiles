#
# ~/.bash_profile
#

export QT_QPA_PLATFORMTHEME='qt5ct'
export PDFVIEWER=zathura
export BROWSER=firefox

# Hardware acceleration
export MOZ_DISABLE_RDD_SANDBOX=1

export EDITOR=nvim

# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

# Neovim as manpager reader
export MANPAGER="nvim +Man!"
export MANWIDTH=80

export CLR_OPENSSL_VERSION_OVERRIDE=1.1

# Force Minecraft to use pulseaudio
export ALSOFT_DRIVERS=pulse

export TERMINAL=/usr/bin/alacritty

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Gtk theme on java
export _JAVA_OPTIONS='-Djdk.gtk.version=3 -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

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

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
