function fish_prompt
	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.shell_prompt.sh left
end

function fish_right_prompt
	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.shell_prompt.sh right
end

set -x QT_QPA_PLATFORMTHEME 'qt5ct'
set -x PDFVIEWER zathura
set -x BROWSER firefox

set -x EDITOR nvim

# Settings for Japanese input
set -x GTK_IM_MODULE 'ibus'
set -x QT_IM_MODULE 'ibus'
set -x XMODIFIERS '@im=ibus'

# Neovim as manpager reader
set -x MANPAGER "nvim +Man!"

set -x PATH "/home/otreblan/.gem/ruby/2.7.0/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


if status --is-interactive
	paleofetch
end
