
------------------------------------------------------------------------
-- Setup of LSP servers ------------------------------------------------
-- https://github.com/neovim/nvim-lspconfig ----------------------------
-- https://github.com/williamboman/mason.nvim --------------------------
------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {
		"pyright",
		"texlab",
		"ltex",
		"clangd",
	}
}

require('fidget').setup{
	sources = {
		ltex = {
			ignore = true,
		},
	},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local lsp = require('lspconfig')
lsp.pyright.setup {
	capabilities = capabilities
}
lsp.texlab.setup{
	capabilities = capabilities
}
lsp.ltex.setup{
	capabilities = capabilities,
	settings = {
		ltex = {
			filetypes = {"org", "tex", "bib"}
		}
	}
}
lsp.clangd.setup{
	capabilities = capabilities
}
