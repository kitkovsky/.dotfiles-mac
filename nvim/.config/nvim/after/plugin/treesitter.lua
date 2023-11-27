require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"vim",
		"lua",
		"typescript",
		"javascript",
		"tsx",
		"html",
		"css",
		"python",
		"json",
		"yaml",
		"bash",
		"rust",
		"astro",
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
