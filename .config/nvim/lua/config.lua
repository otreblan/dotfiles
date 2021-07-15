vim.o.autoread      = true  -- Automatically read file after it's been modified elsewhere
vim.o.copyindent    = true  -- Keep same indent
vim.o.foldenable    = true  -- Fold
vim.o.hidden        = true  -- TextEdit might fail if hidden is not set.
vim.o.hlsearch      = true  -- Highlight search results
vim.o.incsearch     = true  -- Incremental search
vim.o.list          = true  -- For fancy indent marks
vim.o.showcmd       = true  -- Show (partial) command in status line.
vim.o.showmatch     = true  -- Show matching brackets
vim.o.showmode      = false -- Use airline mode indicator
vim.o.termguicolors = true  -- More colors

vim.o.background   = "dark"    -- Vim colours for dark background
vim.o.conceallevel = 2         -- Conceal certain LaTeX symbols
vim.o.foldmethod   = "marker"  -- For folding with  { { {
vim.o.history      = 1000      -- History of : commands remembered
vim.o.inccommand   = "nosplit" -- Real time seach and replace
vim.o.mouse        = "a"       -- Mouse support
vim.o.shiftwidth   = 4         -- Automatic indetation
vim.o.tabstop      = 4         -- Makes tabs 4 spaces long
vim.o.updatetime   = 300       -- Something for diagnostics
vim.o.wildoptions  = "pum"     -- Pmenu for commands

vim.opt.listchars = {
	trail = '·',
	tab = '┊ '
}

require("nvim-treesitter.configs").setup {
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	highlight = {
		enable  = true,
		disable = { "latex" },
	},
}

require("treesitter-context.config").setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

require("telescope").load_extension("coc")

require("telescope").setup{
	defaults = {
		layout_config = {
			preview_cutoff = 0,
		},
	}
}
