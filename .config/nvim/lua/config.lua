local g   = vim.g
local o   = vim.o
local w   = vim.w

local keyset = vim.keymap.set

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

-- pandoc
g["pandoc#spell#enabled"] = false

-- Debugging
w.nvimgdb_codewin_command = "vnew"
w.nvimgdb_termwin_command = "belowright vnew"

-- Coc extensions
g.coc_global_extensions = {
	"coc-angular",
	"coc-eslint",
	"coc-git",
	"coc-gitignore",
	"coc-html",
	"coc-html-css-support",
	"coc-json",
	"coc-marketplace",
	"coc-pyright",
	"coc-r-lsp",
	"coc-sql",
	"coc-tsserver",
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

-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)


require('impatient')

-- Packer.nvim
require("plugins")

require("nvim-treesitter.configs").setup {
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	highlight = {
		enable  = true,
		disable = {"latex", "lua"},
	},
	indent = {
		enable = true,
	}
}

require("telescope").load_extension("coc")
require("telescope").load_extension("notify")

require("telescope").setup {
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			preview_cutoff = 0,
		},
	}
}

require("dashboard").setup {
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				desc = ' Apps',
				group = 'DiagnosticHint',
				action = 'Telescope app',
				key = 'a',
			},
			{
				desc = ' dotfiles',
				group = 'Number',
				action = 'Telescope find_files cwd=~/.config/nvim/',
				key = 'd',
			},
		},
	},
}

require("wilder").setup {
	modes = { ":", "/", "?" }
}

local wilder = require("wilder")

wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			-- sets the language to use, "vim" and "python" are supported
			fuzzy_filter = wilder.lua_fzy_filter(),
			-- 0 turns off fuzzy matching
			-- 1 turns on fuzzy matching
			-- 2 partial fuzzy matching (match does not have to begin with the same first letter)
			fuzzy = 1,
		}),
		wilder.python_search_pipeline({
			-- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
			pattern = wilder.python_fuzzy_pattern(),
			-- omit to get results in the order they appear in the buffer
			sorter = wilder.python_difflib_sorter(),
			-- can be set to "re2" for performance, requires pyre2 to be installed
			-- see :h wilder#python_search() for more details
			engine = "re",
		}),
		{
			wilder.check(function(_, x) return x == '' end),
			wilder.history(),
		}
	),
})

local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.lua_fzy_highlighter(),
}


local popupmenu_renderer = wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		left = {" ", wilder.popupmenu_devicons(), " "},
		right = {" ", wilder.popupmenu_scrollbar()},
		-- "single", "double", "rounded" or "solid"
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
		empty_message = wilder.popupmenu_empty_message_with_spinner(),
		highlighter = highlighters,
		highlights = {
			accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, {foreground = "#f4468f", bold = 1}}),
		},
	})
)

local wildmenu_renderer = wilder.wildmenu_renderer(
	wilder.wildmenu_airline_theme({
		-- highlights can be overriden, see :h wilder#wildmenu_renderer()
		highlights = {default = "StatusLine"},
		highlighter = highlighters,
		separator = " · ",
	})
)

wilder.set_option("renderer", wilder.renderer_mux({
	[":"] = popupmenu_renderer,
	["/"] = wildmenu_renderer,
	substitute = wildmenu_renderer,
}))

require("godbolt").setup({
})

require("hop").setup()
require("notify").setup()
require("nvim-surround").setup()
require("nvim-web-devicons").setup()
