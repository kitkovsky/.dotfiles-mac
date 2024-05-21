require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<C-n>", "<cmd>Oil --float<CR>", { silent = true })
