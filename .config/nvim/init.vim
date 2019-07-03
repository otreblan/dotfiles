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
set foldenable
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
	Plug 'tpope/vim-rhubarb'
	Plug 'sophacles/vim-processing'
	Plug 'tpope/vim-dispatch'
	Plug 'mhinz/vim-rfc'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'dag/vim-fish'
	Plug 'tbastos/vim-lua'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'kabbamine/vcoolor.vim'
	Plug 'junegunn/fzf.vim'
	Plug '/usr/bin/fzf'
	Plug 'mhinz/vim-startify'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	Plug 'tpope/vim-surround'

call plug#end()
" Options {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = "latex"
let g:vimtex_toc_config= {'layer_status': {'content': 1,'label': 0,'todo': 0,'include': 0}}
let g:vimtex_doc_handlers = ['MyDocs']
let g:markdown_fenced_languages = [
	\ 'vim',
	\ 'sh',
	\ 'help'
\]

" Startify options {{{
" Cowsay centering
function! s:center(lines) abort
	let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
	let centered_lines = map(copy(a:lines),
				\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

"Some options
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = s:center(startify#fortune#cowsay())

" The git commits part of the start page
function! s:list_commits()
	let git = 'git -C ' . getcwd()
	let commits = systemlist(git .' lg | head -n20')
	let git = 'G'. git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" This is the center of the start page
let g:startify_lists = [
	\ { 'header': ['   MRU'],            'type': 'files' },
	\ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
	\ { 'header': ['   Sessions'],       'type': 'sessions' },
	\ { 'header': ['   Commits'],        'type': function('s:list_commits') },
	\ ]

" This is for the file type icons on the start page
function! StartifyEntryFormat()
	return '.WebDevIconsGetFileTypeSymbol(absolute_path) ."  ". entry_path'
endfunction
" }}}

"Coc extensions
let g:coc_global_extensions = [
								\"coc-ultisnips",
								\"coc-snippets",
								\"coc-marketplace",
								\"coc-vimtex",
								\"coc-sh",
								\"coc-vimlsp",
								\"coc-python",
								\"coc-pairs",
								\"coc-json"
								\]
"let g:UltiSnipsExpandTrigger = '<C-j>'
"let g:ycm_key_invoke_completion = '<C-l>'

imap <C-l> <Nul>
function! MyDocs(context)
	Zeavim
	return 1
endfunction
" }}}
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

" Syntax Highlighting {{{

" Completion menu
highlight Pmenu ctermbg=237 ctermfg=white
highlight PmenuSel ctermbg=220 ctermfg=black
highlight PmenuSbar ctermbg=233
highlight PmenuThumb ctermbg=7

" Folder text
highlight Folded ctermbg=235 ctermfg=80
" }}}

"Pmenu for commands
set wildoptions=pum

"Something for diagnostics
set updatetime=300

" Documentation on hover
autocmd CursorHold * silent call CocActionAsync('doHover')
