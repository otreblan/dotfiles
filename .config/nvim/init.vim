filetype plugin indent on " Detect filetypes
syntax on                 " Syntax highlighting

" Mappings
imap <C-l> <Nul>

"" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Coc mappings
nmap <silent> gd :Telescope coc definitions<CR>
nmap <silent> gi :Telescope coc implementations<CR>
nmap <silent> gr :Telescope coc references<CR>
nmap <silent> gy :Telescope coc type_definitions<CR>

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

" Hop.nvim
nmap <silent> gw :HopWord<cr>

" Fast save
nmap ññ :w<CR>

" Chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

" LaTeX things
augroup latex
	autocmd!
	autocmd FileType tex set spell spelllang=es,en spell!
	autocmd FileType tex nmap ñz :set spell!<CR>
	autocmd FileType tex nmap ñs :!zathura *.pdf & <CR><CR>
	autocmd FileType tex nmap ñq a<++><Esc>
augroup end

" Easy align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Syntax Highlighting
colorscheme tender

" Ignore errors
function Null(error, response) abort
endfunction

" Documentation on hover
augroup hover
	autocmd!
	autocmd CursorHold * if !coc#float#has_float()
		\| call CocActionAsync('doHover', 'float', function('Null'))
		\| call CocActionAsync('highlight', function('Null'))
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

" --option is a single word
autocmd FileType sh set iskeyword+=45

" systemlist() is used to delete the ^@ at the end of the line
let $MAKEFLAGS = "-j".systemlist("nproc")[0]

" Lua config
lua require('config')

" Conceal
highlight Conceal ctermbg=NONE guibg=NONE
