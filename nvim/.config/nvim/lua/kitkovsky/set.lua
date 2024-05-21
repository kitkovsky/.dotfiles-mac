vim.cmd("language en_US")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.winbar = "%f %m"

vim.opt.clipboard:append("unnamedplus")

vim.opt.cmdheight = 1

vim.opt.updatetime = 50

vim.opt.shortmess:append("c")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

-- for some reason emmet keybinds don't work in /after
vim.g.user_emmet_leader_key = "<C-e>"
vim.g.user_emmet_mode = "inv"
