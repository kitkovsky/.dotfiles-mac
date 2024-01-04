---@diagnostic disable: unused-local

local GRUVBOX_BABY = "gruvbox"
local ROSE_PINE = "rose-pine"
local current_colorscheme = GRUVBOX_BABY

vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

if current_colorscheme == ROSE_PINE then
	require("rose-pine").setup({
		variant = "moon",
		disable_background = true,

		highlight_groups = {
			TelescopeBorder = { fg = "highlight_high", bg = "none" },
			TelescopeNormal = { bg = "none" },
			TelescopePromptNormal = { bg = "base" },
			TelescopeResultsNormal = { fg = "subtle", bg = "none" },
			TelescopeSelection = { fg = "text", bg = "base" },
			TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
		},
	})
end

vim.cmd("colorscheme " .. current_colorscheme)

if current_colorscheme == GRUVBOX_BABY then
	vim.cmd("highlight SignColumn guibg=NONE")
	vim.cmd("highlight Normal guibg=none")
	vim.cmd("highlight WinBar guibg=none")
end
