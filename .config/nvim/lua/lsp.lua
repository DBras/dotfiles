
------------------------------------------------------------------------
-- Setup of LSP servers ------------------------------------------------
-- https://github.com/neovim/nvim-lspconfig ----------------------------
------------------------------------------------------------------------

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}
require('lspconfig').texlab.setup{
	capabilities = capabilities
}
-- require('lspconfig').jedi_language_server.setup{}
