local lsp = require("lsp-zero")
local nnoremap = require("kitkovsky.keymap").nnoremap

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"dockerls",
	"pyright",
	"html",
	"cssls",
	"tailwindcss",
	"eslint",
	"graphql",
	"lua_ls",
	"rust_analyzer",
})

-- fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", ".*ClassName" },
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = cmp.config.disable,
	["<S-Tab>"] = cmp.config.disable,
	["<CR>"] = cmp.config.disable,
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function()
	nnoremap("gd", function()
		vim.lsp.buf.definition()
	end, { silent = true })
	nnoremap("gD", function()
		vim.lsp.buf.declaration()
	end, { silent = true })
	nnoremap("gt", function()
		vim.lsp.buf.type_definition()
	end, { silent = true })
	nnoremap("gr", function()
		vim.lsp.buf.references()
	end, { silent = true })
	nnoremap("gi", function()
		vim.lsp.buf.implementation()
	end, { silent = true })
	nnoremap("K", function()
		vim.lsp.buf.hover()
	end, { silent = true })
	nnoremap("[d", function()
		vim.diagnostic.goto_prev()
	end, { silent = true })
	nnoremap("]d", function()
		vim.diagnostic.goto_next()
	end, { silent = true })
	nnoremap("<leader>rn", function()
		vim.lsp.buf.rename()
	end, { silent = true })
	nnoremap("<leader>qf", function()
		vim.lsp.buf.code_action()
	end, { silent = true })
	nnoremap("<leader>d", function()
		vim.diagnostic.open_float()
	end, { silent = true })
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
