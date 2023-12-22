require("mason").setup()
require("mason-lspconfig").setup()

local nnoremap = require("kitkovsky.keymap").nnoremap

local servers = {
	"astro",
	"cssls",
	"dockerls",
	"eslint",
	"html",
	"lua_ls",
	"ruff_lsp",
	"rust_analyzer",
	"tailwindcss",
	"tsserver",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = function()
			require("lsp_signature").on_attach()
		end,
		capabilities = capabilities,
	})
end

lspconfig["lua_ls"].setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig["tailwindcss"].setup({
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", ".*ClassName" },
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	},
})

local remaps = {
	["gd"] = vim.lsp.buf.definition,
	["gD"] = vim.lsp.buf.declaration,
	["gt"] = vim.lsp.buf.type_definition,
	["gr"] = vim.lsp.buf.references,
	["gi"] = vim.lsp.buf.implementation,
	["K"] = vim.lsp.buf.hover,
	["[d"] = vim.diagnostic.goto_prev,
	["]d"] = vim.diagnostic.goto_next,
	["<leader>rn"] = vim.lsp.buf.rename,
	["<leader>qf"] = vim.lsp.buf.code_action,
	["<leader>d"] = vim.diagnostic.open_float,
}

for key, func in pairs(remaps) do
	nnoremap(key, func, { silent = true })
end

vim.diagnostic.config({
	virtual_text = true,
})
