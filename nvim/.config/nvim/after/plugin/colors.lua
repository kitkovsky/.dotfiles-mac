local CATTPUCCIN = "cattpuccin"
local GRUVBOX_BABY = "gruvbox"
local current_colorscheme = GRUVBOX_BABY

vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

if current_colorscheme == GRUVBOX_BABY then
	vim.cmd("colorscheme gruvbox")
end

if current_colorscheme == CATTPUCCIN then
	require("catppuccin").setup({
		flavour = "macchiato", -- mocha, macchiato, frappe, latte
		background = {
			dark = "macchiato",
		},
		transparent_background = false,
		integrations = {
			cmp = true,
			telescope = true,
		},
	})

	vim.cmd("colorscheme catppuccin")
end


vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight WinBar guibg=none")
