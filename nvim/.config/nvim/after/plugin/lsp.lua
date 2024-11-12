local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func)
			vim.keymap.set("n", keys, func, { buffer = event.buf })
		end

		local remaps = {
			["gd"] = builtin.lsp_definitions,
			["gD"] = vim.lsp.buf.declaration,
			["gt"] = builtin.lsp_type_definitions,
			["gr"] = builtin.lsp_references,
			["gi"] = builtin.lsp_implementations,
			["K"] = vim.lsp.buf.hover,
			["[d"] = vim.diagnostic.goto_prev,
			["]d"] = vim.diagnostic.goto_next,
			["<leader>rn"] = vim.lsp.buf.rename,
			["<leader>qf"] = vim.lsp.buf.code_action,
			["<leader>d"] = vim.diagnostic.open_float,
		}

		for key, func in pairs(remaps) do
			map(key, func)
		end

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	astro = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	eslint = {},
	gopls = {},
	html = {},
	lua_ls = {},
	pyright = {},
	ruff = {},
	rust_analyzer = {},
	tailwindcss = {
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
	},
}

require("mason").setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"astro-language-server",
	"clang-format",
	"clangd",
	"cmake-language-server",
	"css-lsp",
	"dockerfile-language-server",
	"eslint-lsp",
	"gopls",
	"graphql-language-service-cli",
	"html-lsp",
	"lua-language-server",
	"pyright",
	"ruff",
	"rust-analyzer",
	"stylua",
	"tailwindcss-language-server",
	"typescript-language-server",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
