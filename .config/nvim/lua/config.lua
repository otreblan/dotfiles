local g   = vim.g
local o   = vim.o
local w   = vim.w

o.autoread      = true  -- Automatically read file after it's been modified elsewhere
o.copyindent    = true  -- Keep same indent
o.foldenable    = true  -- Fold
o.hidden        = true  -- TextEdit might fail if hidden is not set.
o.hlsearch      = true  -- Highlight search results
o.incsearch     = true  -- Incremental search
o.lazyredraw    = true  -- Lazy redrawing
o.list          = true  -- For fancy indent marks
o.showcmd       = true  -- Show (partial) command in status line.
o.showmatch     = true  -- Show matching brackets
o.showmode      = false -- Use airline mode indicator
o.termguicolors = true  -- More colors

o.conceallevel = 2    -- Conceal certain LaTeX symbols
o.history      = 1000 -- History of : commands remembered
o.shiftwidth   = 4    -- Automatic indetation
o.tabstop      = 4    -- Makes tabs 4 spaces long
o.updatetime   = 300  -- Something for diagnostics

o.background  = "dark"    -- Vim colours for dark background
o.foldmethod  = "marker"  -- For folding with  { { {
o.inccommand  = "nosplit" -- Real time seach and replace
o.mouse       = "a"       -- Mouse support
o.wildoptions = "pum"     -- Pmenu for commands

-- Options

-- Airline
g["airline#extensions#hunks#coc_git"]            = true
g["airline#extensions#promptline#snapshot_file"] = "~/.shell_prompt.sh"
g["airline#extensions#tabline#enabled"]          = true
g["airline#extensions#tabline#formatter"]        = "unique_tail_improved"
g.airline_powerline_fonts                        = true

-- Vista
g.vista_cursor_delay           = 0
g.vista_default_executive      = "coc"
g.vista_echo_cursor_strategy   = "scroll"
g.vista_update_on_text_changed = true

-- Some vimtex options
g.matchup_override_vimtex  = true
g.tex_flavor               = "latex"
g.vimtex_compiler_progname = "nvr"
g.vimtex_quickfix_method   = "pplatex"
g.vimtex_view_method       = "zathura"
g.vimtex_toc_config        = {
	layer_status = {
		content = true,
		include = false,
		label   = false,
		todo    = false,
	}
}

g.markdown_fenced_languages = {"cmake", "help", "sh", "vim"}

-- This is for c/c++ autocompletion
g.cmake_default_config        = "build"
g.cmake_link_compile_commands = true
g.cmake_root_makers           = {".git", "build"}

-- c++ syntax highlighting
g.cpp_class_decl_highlight            = true
g.cpp_class_scope_highlight           = true
g.cpp_experimental_template_highlight = true
g.cpp_member_variable_highlight       = true

-- Numbers exceptions
-- "" is here until floating windows have their own filetype
g.numbers_exclude = {
	"",
	"CHADTree",
	"dashboard",
	"help",
	"info",
	"man",
	"nvimgdb",
	"vimcmake",
	"vista",
}

-- Dashboard
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
	"",
	"",
	"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

-- pandoc
g["pandoc#spell#enabled"] = false

-- Debugging
w.nvimgdb_codewin_command = "vnew"
w.nvimgdb_termwin_command = "belowright vnew"

-- Coc extensions
g.coc_global_extensions = {
	"coc-eslint",
	"coc-git",
	"coc-gitignore",
	"coc-json",
	"coc-marketplace",
	"coc-pyright",
	"coc-r-lsp",
	"coc-sql",
	"coc-ultisnips",
	"coc-vimlsp",
	"coc-vimtex",
	"coc-yaml",
}

-- Man pages
g.man_hardwrap = true

-- Chadtree theme
g.chadtree_settings = {
	theme = {
		text_colour_set = "nerdtree_syntax_dark"
	}
}

-- Snippets
g.UltiSnipsExpandTrigger = "<NUL>"

-- Matching
g.matchup_matchparen_offscreen = {}

require('impatient')

-- Packer.nvim
require("plugins")

require("nvim-treesitter.configs").setup {
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	highlight = {
		enable  = true,
		disable = { "latex", "lua"},
	},
}

require("telescope").load_extension("coc")
require("telescope").load_extension("notify")

require("telescope").setup{
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			preview_cutoff = 0,
		},
	}
}

require("godbolt").setup()
require("hop").setup()
require("notify").setup()
