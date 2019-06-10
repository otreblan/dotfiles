set t_Co=256
filetype plugin on
syntax on " Syntax highlighting
set background=dark " Vim colours for dark baVim colours for dark background
set showcmd " Show (partial) command in status line.
set showmatch "Show matching brackets
set incsearch "Incremental search
set history=1000 "History of : commands remembered
set hlsearch "Highlight search results
set autoread "Automatically read file after it's been modified elsewhere
set number "Esta cosa pone los números de las líneas

set tabstop=4 "debería hacer que el tab tenga el tamaño de 4 espacios
set shiftwidth=4 "set cindent debería identar automáticame
set foldmethod=marker "For folding with  { { { (without spaces)
"set encoding=utf-8

filetype on "detect filetypes
filetype indent on

" Plugins {{{
call plug#begin('~/.config/nvim/plugs')
	Plug 'vim-airline/vim-airline'
	Plug 'lervag/vimtex'
	"Plug 'valloric/youcompleteme'
	Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
	Plug 'KabbAmine/zeavim.vim'
	Plug 'deviantfero/wpgtk.vim'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'sirver/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'ryanoasis/vim-devicons'
	Plug 'edkolev/promptline.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'sophacles/vim-processing'
	Plug 'tpope/vim-dispatch'
	Plug 'mhinz/vim-rfc'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'dag/vim-fish'

	"Options
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
	let g:vimtex_view_method = 'zathura'
	let g:tex_flavor = "latex"
	let g:vimtex_toc_config= {'layer_status': {'content': 1,'label': 0,'todo': 0,'include': 0}}
	let g:vimtex_doc_handlers = ['MyDocs']
	"let g:UltiSnipsExpandTrigger = '<C-j>'
	"let g:ycm_key_invoke_completion = '<C-l>'

	imap <C-l> <Nul>
	function! MyDocs(context)
		Zeavim
		return 1
	endfunction
call plug#end()
" }}}

"Busca marcas
nmap ña /<++><CR> :nohls <CR> ca<

"Cambia buffers
nmap ñl :bnext!<CR>
nmap ñh :bprevious!<CR>

"Pone fecha
nmap ñ<Space> a<C-r>=system('date +%Y-%m-%d\ %H:%M:%S \| tr -d "\n"')<CR>

"LaTeX things
function Latex()
	"nmap ññ :w <CR> \| :!make <CR><CR>
	set spell spelllang=es
	nmap ñz :set spell!<CR>
	nmap ññ :w<CR>
	nmap ñs :!zathura *.pdf & <CR><CR>
	nmap ñq a<++><Esc>
endfunction

"Guardado para LaTeX
autocmd FileType tex call Latex()
autocmd FileType cpp set keywordprg=cppman
autocmd FileType c set keywordprg=~/manvim.sh\ 3

"Syntax Highlighting
highlight Pmenu ctermbg=237 ctermfg=white
highlight PmenuSel ctermbg=220 ctermfg=black
highlight PmenuSbar ctermbg=16
highlight PmenuThumb ctermbg=2
