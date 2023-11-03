-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
local mark = require
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'projekt0n/github-nvim-theme',
		config = function()
			require('github-theme').setup({
				-- ...
			})

			vim.cmd('colorscheme github_dark_dimmed')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    --use("nvim-tree/nvim-tree.lua")
    --use("nvim-tree/nvim-web-devicons")

    use {'akinsho/toggleterm.nvim', tag = '*', config = function()
        require("toggleterm").setup()
    end}

    use('ThePrimeagen/harpoon')
    use('folke/zen-mode.nvim')
    use('m4xshen/autoclose.nvim')
    use('airblade/vim-gitgutter')
    use('RRethy/vim-illuminate')
    use('windwp/nvim-ts-autotag')
    use('WhoIsSethDaniel/mason-tool-installer.nvim')
    use({
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup()
      end,
    })
end)
