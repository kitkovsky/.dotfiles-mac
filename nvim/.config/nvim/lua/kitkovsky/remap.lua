local nnoremap = require("kitkovsky.keymap").nnoremap
local vnoremap = require("kitkovsky.keymap").vnoremap

-- better tabbing
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- close a buffer with <leader>bd
nnoremap("<leader>bd", "<cmd>bdelete<CR>")

-- quickfix list things
nnoremap("<leader>j", "<cmd>cnext<CR>zz")
nnoremap("<leader>k", "<cmd>cprev<CR>zz")
nnoremap("<leader>co", "<cmd>copen<CR>")
nnoremap("<leader>cq", "<cmd>cclose<CR>")

-- Y yanks to the end of the line
nnoremap("Y", "y$")

-- keeping in centered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- never press Q
nnoremap("Q", "<nop>")

-- move lines up and down in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
