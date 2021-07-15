return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "cdelledonne/vim-cmake"
	use "edkolev/promptline.vim"
	use "fannheyward/telescope-coc.nvim"
	use "glepnir/dashboard-nvim"
	use "honza/vim-snippets"
	use "igankevich/mesonic"
	use "jacoborus/tender.vim"
	use "junegunn/vim-easy-align"
	use "lambdalisue/gina.vim"
	use "liuchengxu/vista.vim"
	use "myusuf3/numbers.vim"
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-telescope/telescope.nvim"
	use "nvim-treesitter/playground"
	use "romgrk/nvim-treesitter-context"
	use "sakhnik/nvim-gdb"
	use "sirver/ultisnips"
	use "tpope/vim-surround"
	use "vim-airline/vim-airline"
	use "vim-pandoc/vim-pandoc"
	use "vim-pandoc/vim-pandoc-syntax"
	use "vim-pandoc/vim-rmarkdown"
	use "wellle/targets.vim"

	use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}
	use {"HiPhish/info.vim", cmd = {"Info"}}

	use {"andymass/vim-matchup", event = "VimEnter"}
	use {"dag/vim-fish", ft = "fish"}
	use {"ekalinin/Dockerfile.vim", ft = "Dockerfile"}
	use {"habamax/vim-asciidoctor", ft = "asciidoctor"}
	use {"jvirtanen/vim-octave", ft = "octave"}
	use {"lervag/vimtex", ft = "tex"}
	use {"tikhomirov/vim-glsl", ft = "glsl"}

	use {"glacambre/firenvim", run = function() vim.fn["firenvim#install"](0) end}

	use {"neoclide/coc.nvim",               run = "yarn install --frozen-lockfile"}
	use {"iamcco/markdown-preview.nvim",    run = "cd app & yarn install"}
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

	-- This doesn't work if it's loaded before
	use "ryanoasis/vim-devicons"
end)
