local nnoremap = require("kitkovsky.keymap").nnoremap
local ui = require("harpoon.ui")

nnoremap("<leader>ha", function()
	require("harpoon.mark").add_file()
end)

for i = 1, 6 do
	nnoremap(string.format("<leader>h%d", i), function()
		ui.nav_file(i)
	end)
end

nnoremap("<leader>ht", function()
	ui.toggle_quick_menu()
end)

nnoremap("<leader>hgn", function()
	ui.nav_next()
end)
nnoremap("<leader>hgp", function()
	ui.nav_prev()
end)
