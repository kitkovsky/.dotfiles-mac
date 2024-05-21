vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns undo_stage_hunk<CR>")

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
})

vim.cmd("highlight GitSignsAdd guifg=#b8bb26 guibg=NONE") -- GruvboxGreenSign #b8bb26
vim.cmd("highlight GitSignsChange guifg=#8ec07c guibg=NONE") -- GruvboxAquaSign #8ec07c
vim.cmd("highlight GitSignsDelete guifg=#fb4934 guibg=NONE") -- GruvboxRedSign #fb4934
vim.cmd("highlight GitSignsTopDelete guifg=#fb4934 guibg=NONE") -- GruvboxRedSign #fb4934
vim.cmd("highlight GitSignsChangeDelete guifg=#8ec07c guibg=NONE")
vim.cmd("highlight GitSignsUntracked guifg=#b8bb26 guibg=NONE")
