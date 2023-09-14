-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("ellisonleao/gruvbox.nvim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })

	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("mattn/emmet-vim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("stevearc/oil.nvim")

	use("ThePrimeagen/harpoon")
	-- use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("github/copilot.vim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("mhartington/formatter.nvim")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
end)
