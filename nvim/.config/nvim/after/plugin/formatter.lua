require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,
	filetype = {
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
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		scss = {
			require("formatter.filetypes.css").prettier,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").ruff,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		yml = {
			require("formatter.filetypes.yaml").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>nf", "<cmd>FormatWrite<CR>")

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		if vim.bo.filetype == "oil" then
			return
		end

		vim.cmd("FormatWrite")
	end,
	group = vim.api.nvim_create_augroup("lsp_document_format", { clear = true }),
})
