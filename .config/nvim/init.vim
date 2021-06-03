set t_Co=256
filetype plugin on
syntax on " Syntax highlighting

set autoread       " Automatically read file after it's been modified elsewhere
set foldenable
set hlsearch       " Highlight search results
set incsearch      " Incremental search
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets
set copyindent     " Keep same indent

set background  =dark             " Vim colours for dark background
set foldmethod  =marker           " For folding with  { { { (without spaces)
set history     =1000             " History of : commands remembered
set list lcs    =trail:·,tab:\┊\  " For fancy indent marks
set shiftwidth  =4                " Automatic indetation
set tabstop     =4                " Makes tabs 4 spaces long
set updatetime  =300              " Something for diagnostics
set wildoptions =pum              " Pmenu for commands
set mouse       =a                " Mouse support
set conceallevel=2

filetype on "detect filetypes
filetype indent on

" Plugins
call plug#begin('~/.config/nvim/plugs')
	Plug '/usr/bin/fzf'
	Plug 'myusuf3/numbers.vim'
	Plug 'tpope/vim-dispatch'
	Plug 'jackguo380/vim-lsp-cxx-highlight'
	Plug 'KabbAmine/zeavim.vim'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'dag/vim-fish'
	Plug 'edkolev/promptline.vim'
	Plug 'ekalinin/Dockerfile.vim'
	Plug 'habamax/vim-asciidoctor'
	Plug 'honza/vim-snippets'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	Plug 'igankevich/mesonic'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'lervag/vimtex'
	Plug 'liuchengxu/vim-clap' , { 'do': { -> clap#installer#force_download() } }
	Plug 'mhinz/vim-startify'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'puremourning/vimspector'
	Plug 'scrooloose/nerdtree'
	Plug 'sirver/ultisnips'
	Plug 'tbastos/vim-lua'
	Plug 'lambdalisue/gina.vim'
	Plug 'tpope/vim-surround'
	Plug 'cdelledonne/vim-cmake'
	Plug 'vim-airline/vim-airline'
	Plug 'wellle/targets.vim'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'liuchengxu/vista.vim'
	Plug 'jvirtanen/vim-octave'
	Plug 'HiPhish/info.vim'
	Plug 'tikhomirov/vim-glsl'
	Plug 'weirongxu/plantuml-previewer.vim'
	Plug 'tyru/open-browser.vim'

	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
	Plug 'vim-pandoc/vim-rmarkdown'

	" This doesn't work if it's loaded before
	Plug 'ryanoasis/vim-devicons'
call plug#end()
" Options
let g:airline_powerline_fonts                     = 1
let g:airline#extensions#tabline#enabled          = 1
let g:airline#extensions#tabline#buffer_nr_show   = 1
let g:airline#extensions#tabline#formatter        = 'unique_tail_improved'
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"

" Use coc provider
let g:vista_default_executive = 'coc'
let g:vista_update_on_text_changed = 1
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_cursor_delay = 0
let g:vista#renderer#icons = {
	\'subroutine':     '羚 ',
	\'method':         ' ',
	\'func':           ' ',
	\'variables':      ' ',
	\'constructor':    '略 ',
	\'field':          ' ',
	\'interface':      ' ',
	\'type':           ' ',
	\'packages':       ' ',
	\'property':       '襁 ',
	\'implementation': ' ',
	\'default':        ' ',
	\'augroup':        'פּ ',
	\'macro':          ' ',
	\'enumerator':     ' ',
	\'const':          ' ',
	\'macros':         ' ',
	\'map':            'פּ ',
	\'fields':         ' ',
	\'functions':      ' ',
	\'enum':           ' ',
	\'function':       ' ',
	\'target':         ' ',
	\'typedef':        ' ',
	\'namespace':      ' ',
	\'enummember':     ' ',
	\'variable':       ' ',
	\'modules':        ' ',
	\'constant':       ' ',
	\'struct':         ' ',
	\'types':          ' ',
	\'module':         ' ',
	\'typeParameter':  ' ',
	\'package':        ' ',
	\'class':          ' ',
	\'member':         ' ',
	\'var':            ' ',
	\'union':          '鬒'
\}

" Some vimtex options
let g:vimtex_view_method       = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor               = "latex"
let g:vimtex_toc_config        = {'layer_status':
	\{'content': 1,
	\'label':    0,
	\'todo':     0,
	\'include':  0}
	\}
let g:vimtex_doc_handlers      = ['MyDocs']
let g:vimtex_quickfix_method   = 'pplatex'

let g:markdown_fenced_languages = [
	\ 'vim',
	\ 'sh',
	\ 'help',
	\ 'cmake'
\]
" This is for c/c++ autocompletion
let g:cmake_default_config        = 'build'
let g:cmake_link_compile_commands = 1
let g:cmake_root_makers           = ['.git', 'build']

" c++ syntax highlighting
let g:cpp_class_scope_highlight           = 1
let g:cpp_member_variable_highlight       = 1
let g:cpp_class_decl_highlight            = 1
let g:cpp_experimental_template_highlight = 1

" Numbers exceptions
" '' is here until floating windows have their own filetype
let g:numbers_exclude = [
	\ 'man',
	\ 'info',
	\ 'help',
	\ 'startify',
	\ 'nerdtree',
	\ 'vista',
	\ ''
\]

" pandoc
let g:pandoc#spell#enabled = 0

" Debugging
let g:vimspector_enable_mappings = 'HUMAN'

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_server_path = '/home/otreblan/.cache/omnisharp-vim/omnisharp-roslyn/run'

" Git hunks
let g:airline#extensions#hunks#coc_git = 1

" Startify options
" Cowsay centering
function! s:center(lines) abort
	let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
	let centered_lines = map(copy(a:lines),
		\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

"Some options
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header       = s:center(startify#fortune#cowsay())

" The git commits part of the start page
function! s:list_commits()
	let git     = 'git -C ' . getcwd()
	let commits = systemlist(git .' lg | head -n20')
	let git     = 'G'. git[1:]
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
"Coc extensions
let g:coc_global_extensions = [
	\"coc-ultisnips",
	\"coc-marketplace",
	\"coc-vimtex",
	\"coc-git",
	\"coc-gitignore",
	\"coc-template",
	\"coc-r-lsp",
	\"coc-yaml",
	\"coc-pyright",
	\"coc-vimlsp"
\]
	"\"coc-rls",
	"\"coc-prettier",
	"\"coc-json",

let g:man_hardwrap = 1

imap <C-l> <Nul>
" Zeal is the latex documentation provider
function! MyDocs(context)
	Zeavim
	return 1
endfunction

" Mappings

" CMake generate and build
nmap <leader>cg <Plug>(CMakeGenerate)
nmap <leader>cb <Plug>(CMakeBuild)

" Busca marcas
nmap ña /<++><CR> :nohls <CR> ca<

" Buffer change
nmap ñl :bnext!<CR>
nmap ñh :bprevious!<CR>

" Date putter
nmap ñ<Space> a<C-r>=system('date --iso-8601=seconds \| tr "\n" " "')<CR>

" Copied from coc.nvim github README
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Copied from ccls github wiki
" bases
nmap <silent> gxb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nmap <silent> gxB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nmap <silent> gxd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nmap <silent> gxD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nmap <silent> gxc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nmap <silent> gxC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nmap <silent> gxm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nmap <silent> gxf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nmap <silent> gxs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> gxt <Plug>(coc-type-definition)<cr>
nmap <silent> gxv :call CocLocations('ccls','$ccls/vars')<cr>
nmap <silent> gxV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

" Fast save
nmap ññ :w<CR>

" LaTeX things
augroup latex
	autocmd!
	autocmd FileType tex set spell spelllang=es,en spell!
	autocmd FileType tex nmap ñz :set spell!<CR>
	autocmd FileType tex nmap ñs :!zathura *.pdf & <CR><CR>
	autocmd FileType tex nmap ñq a<++><Esc>
augroup end

" For some reason 'K' doesn't works with this on neovim with coc-nvim
"autocmd FileType cpp set keywordprg=cppman
"autocmd FileType c set keywordprg=~/manvim.sh\ 3

" Easy align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Syntax Highlighting

" Completion menu
highlight Pmenu ctermbg=237 ctermfg=white
highlight PmenuSel ctermbg=220 ctermfg=black
highlight PmenuSbar ctermbg=233
highlight PmenuThumb ctermbg=7

" Folder text
highlight Folded ctermbg=235 ctermfg=80

" Sign colum
highlight SignColumn ctermbg=None

" Conceal
highlight clear Conceal

" Documentation on hover
augroup hover
	autocmd!
	autocmd CursorHold * if ! coc#float#has_float()
		\| silent call CocAction('doHover') | call CocActionAsync('highlight')
	\| endif
	autocmd CursorHoldI * if CocAction('ensureDocument')
		\|silent call CocAction('showSignatureHelp')
	\| endif
augroup end

" Init vista after coc
augroup vista
	autocmd!
	autocmd User CocNvimInit call vista#RunForNearestMethodOrFunction()
augroup end

" Close CMake window after build
augroup vim-cmake-group
	autocmd! User CMakeBuildSucceeded CMakeClose
augroup end

" systemlist() is used to delete the ^@ at the end of the line
let $MAKEFLAGS = "-j".systemlist("nproc")[0]
