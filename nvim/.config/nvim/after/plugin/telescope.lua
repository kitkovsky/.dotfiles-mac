local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = "🔍 ",
		color_devicons = true,

		mappings = {
			i = {
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},

		layout_config = {
			horizontal = {
				width = 0.95,
			},
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files()
end)
vim.keymap.set("n", "<leader>fhf", function()
	builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>gf", function()
	builtin.git_files()
end)
vim.keymap.set("n", "<leader>bf", function()
	builtin.buffers()
end)
vim.keymap.set("n", "<leader>gs", function()
	builtin.git_status()
end)
vim.keymap.set("n", "<leader>gc", function()
	builtin.git_commits()
end)
vim.keymap.set("n", "<leader>gbc", function()
	builtin.git_bcommits()
end)
vim.keymap.set("n", "<leader>gbr", function()
	builtin.git_branches()
end)
vim.keymap.set("n", "<leader>gt", function()
	builtin.git_stash()
end)
vim.keymap.set("n", "<leader>lg", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>blg", function()
	builtin.live_grep({ grep_open_files = true })
end)
vim.keymap.set("n", "<leader>flg", function()
	builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "<leader>of", function()
	builtin.oldfiles()
end)
vim.keymap.set("n", "<leader>wd", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", "<leader>bd", function()
	builtin.diagnostics({ bufnr = 0 })
end)
