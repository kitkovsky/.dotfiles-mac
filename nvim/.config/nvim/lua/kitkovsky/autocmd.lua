vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Flutter hot reload on saving Dart files",
	group = vim.api.nvim_create_augroup("flutter-hot-reload", { clear = true }),
	pattern = "*.dart",
	callback = function()
		-- 1) get the current tmux session name (strip trailing newline)
		local session = vim.fn.trim(vim.fn.system('tmux display-message -p "#S"'))
		-- 2) compose target as session:3 (the third window)
		local target = session .. ":3"
		-- 3) send the 'r' key to that tmux window
		vim.fn.system({ "tmux", "send-keys", "-t", target, "r" })

		-- 1) get the current tmux session name (strip trailing newline)
		local session = vim.fn.trim(vim.fn.system('tmux display-message -p "#S"'))
		-- 2) compose target as session:4 (the fourth window)
		local target = session .. ":4"
		-- 3) send the 'r' key to that tmux window
		vim.fn.system({ "tmux", "send-keys", "-t", target, "r" })
	end,
})
