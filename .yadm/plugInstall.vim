"Vim-plug autoinstaller
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('/usr/share/vim/vimfiles/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
        \ mkdir -p ~/.vim/plugs
endif
