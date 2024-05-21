local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end)

for i = 1, 6 do
	vim.keymap.set("n", string.format("<leader>h%d", i), function()
		ui.nav_file(i)
	end)
end

vim.keymap.set("n", "<leader>ht", function()
	ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hgn", function()
	ui.nav_next()
end)
vim.keymap.set("n", "<leader>hgp", function()
	ui.nav_prev()
end)
