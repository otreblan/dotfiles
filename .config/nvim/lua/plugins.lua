return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "DanilaMihailov/beacon.nvim"
	use "cdelledonne/vim-cmake"
	use "edkolev/promptline.vim"
	use "fannheyward/telescope-coc.nvim"
	use "honza/vim-snippets"
	use "igankevich/mesonic"
	use "jacoborus/tender.vim"
	use "junegunn/vim-easy-align"
	use "lambdalisue/gin.vim"
	use "lewis6991/impatient.nvim"
	use "liuchengxu/vista.vim"
	use "myusuf3/numbers.vim"
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-telescope/telescope.nvim"
	use "nvim-treesitter/playground"
	use "p00f/godbolt.nvim"
	use "phaazon/hop.nvim"
	use "rcarriga/nvim-notify"
	use "sirver/ultisnips"
	use "tpope/vim-surround"
	use "vim-airline/vim-airline"
	use "vim-denops/denops.vim"
	use "vim-pandoc/vim-pandoc"
	use "vim-pandoc/vim-pandoc-syntax"
	use "vim-pandoc/vim-rmarkdown"
	use "wellle/targets.vim"

	use {"HiPhish/info.vim", cmd = {"Info"}}
	use {"sakhnik/nvim-gdb", cmd = {"GdbStart"} }
	use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}

	use {"andymass/vim-matchup", event = "VimEnter"}
	use {"dag/vim-fish", ft = "fish"}
	use {"ekalinin/Dockerfile.vim", ft = "Dockerfile"}
	use {"gelguy/wilder.nvim", requires = {"romgrk/fzy-lua-native"}}
	use {"glepnir/dashboard-nvim", event = "VimEnter", requires = {"nvim-tree/nvim-web-devicons"}}
	use {"habamax/vim-asciidoctor", ft = "asciidoctor"}
	use {"jvirtanen/vim-octave", ft = "octave"}
	use {"lervag/vimtex", ft = "tex"}
	use {"tikhomirov/vim-glsl", ft = "glsl"}

	use {"iamcco/markdown-preview.nvim",    run = "cd app & yarn install"}
	use {"ms-jpq/chadtree", run = "python3 -m chadtree deps"}
	use {"neoclide/coc.nvim",               run = "yarn install --frozen-lockfile"}
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

	-- This doesn't work if it's loaded before
	use "ryanoasis/vim-devicons"
end)
