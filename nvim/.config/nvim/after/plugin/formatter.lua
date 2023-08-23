require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		astro = {
			function()
				return {
					exe = "prettier",
					args = {
						"--write",
						".",
						"--plugin=prettier-plugin-astro",
					},
					stdin = false,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local nnoremap = require("kitkovsky.keymap").nnoremap
nnoremap("<leader>nf", "<cmd>FormatWrite<CR>")
