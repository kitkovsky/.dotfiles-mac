local nnoremap = require("kitkovsky.keymap").nnoremap

require("oil").setup()

nnoremap("<C-n>", "<cmd>Oil --float<CR>", { silent = true })
