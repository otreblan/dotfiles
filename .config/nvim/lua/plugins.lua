return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "DanilaMihailov/beacon.nvim"
	use "benlubas/molten-nvim"
	use "cdelledonne/vim-cmake"
	use "edkolev/promptline.vim"
	use "fannheyward/telescope-coc.nvim"
	use "honza/vim-snippets"
	use "igankevich/mesonic"
	use "jackguo380/vim-lsp-cxx-highlight"
	use "jacoborus/tender.vim"
	use "junegunn/vim-easy-align"
	use "kylechui/nvim-surround"
	use "lambdalisue/gin.vim"
	use "lewis6991/impatient.nvim"
	use "liuchengxu/vista.vim"
	use "myusuf3/numbers.vim"
	use "natecraddock/telescope-zf-native.nvim"
	use "neo4j-contrib/cypher-vim-syntax"
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-telescope/telescope.nvim"
	use "nvim-treesitter/playground"
	use "p00f/godbolt.nvim"
	use "phaazon/hop.nvim"
	use "prisma/vim-prisma"
	use "rcarriga/nvim-notify"
	use "sQVe/sort.nvim"
	use "sindrets/diffview.nvim"
	use "sirver/ultisnips"
	use "vim-airline/vim-airline"
	use "vim-denops/denops.vim"
	use "vim-pandoc/vim-pandoc"
	use "vim-pandoc/vim-pandoc-syntax"
	use "vim-pandoc/vim-rmarkdown"
	use "wellle/targets.vim"
	use "zadirion/Unreal.nvim"

	use {"HiPhish/info.vim",   cmd = {"Info"}}
	use {"sakhnik/nvim-gdb",   cmd = {"GdbStart"} }
	use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}

	use {"andymass/vim-matchup",    event = "VimEnter"}
	use {"dag/vim-fish",            ft = "fish"}
	use {"ekalinin/Dockerfile.vim", ft = "Dockerfile"}
	use {"gelguy/wilder.nvim",      requires = {"romgrk/fzy-lua-native"}}
	use {"glepnir/dashboard-nvim",  event = "VimEnter", requires = {"nvim-tree/nvim-web-devicons"}}
	use {"habamax/vim-asciidoctor", ft = "asciidoctor"}
	use {"jvirtanen/vim-octave",    ft = "octave"}
	use {"lervag/vimtex",           ft = "tex"}
	use {"tikhomirov/vim-glsl",     ft = "glsl"}

	use {"iamcco/markdown-preview.nvim",             run = "cd app & yarn install"}
	use {"ms-jpq/chadtree",                          run = "python3 -m chadtree deps"}
	use {"neoclide/coc.nvim",                        run = "npm ci"}
	use {"nvim-treesitter/nvim-treesitter",          run = ":TSUpdate"}
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use {"harrisoncramer/gitlab.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
			"nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
		},
		run = ':lua require("gitlab.server").build()'
	}

	-- This doesn't work if it's loaded before
	use "ryanoasis/vim-devicons"
end)
