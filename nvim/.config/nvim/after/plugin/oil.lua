local nnoremap = require("kitkovsky.keymap").nnoremap

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

nnoremap("<C-n>", "<cmd>Oil --float<CR>", { silent = true })
