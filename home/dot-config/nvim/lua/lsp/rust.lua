vim.lsp.config['rust-analyzer'] = {
	cmd = { 'rust-analyzer' },
	filetypes = { "rust" },
	root = { "Cargo.toml", "Cargo.lock", '.git' },
	--capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
vim.lsp.enable('rust-analyzer')
