require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"astro",
		"bash",
		"css",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"rust",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},

	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
})
