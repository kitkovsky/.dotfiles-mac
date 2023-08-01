local nnoremap = require("kitkovsky.keymap").nnoremap

nnoremap("]h", "<cmd>GitGutterNextHunk<CR>")
nnoremap("[h", "<cmd>GitGutterPrevHunk<CR>")
nnoremap("<leader>hu", "<cmd>GitGutterUndoHunk<CR>")
nnoremap("<leader>hs", "<cmd>GitGutterStageHunk<CR>")

vim.cmd("highlight GitGutterAdd guifg=#98971a guibg=NONE")
vim.cmd("highlight GitGutterChange guifg=#d79921 guibg=NONE")
vim.cmd("highlight GitGutterDelete guifg=#d65d0e guibg=NONE")
vim.cmd("highlight GitGutterChangeDelete guifg=#d65d0e guibg=NONE")
