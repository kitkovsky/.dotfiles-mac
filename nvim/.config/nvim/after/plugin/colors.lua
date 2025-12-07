vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd("colorscheme gruvbox")

vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight WinBar guibg=none")
