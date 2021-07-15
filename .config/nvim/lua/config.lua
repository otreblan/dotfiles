require('nvim-treesitter.configs').setup {
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	highlight = {
		enable  = true,
		disable = { "latex" },
	},
}

require('treesitter-context.config').setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

require('telescope').load_extension('coc')

require('telescope').setup{
	defaults = {
		layout_config = {
			preview_cutoff = 0,
		},
	}
}
