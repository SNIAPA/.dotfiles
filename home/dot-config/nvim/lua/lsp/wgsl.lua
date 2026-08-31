vim.lsp.config['wgsl_analyzer'] = {
	cmd = { 'wgsl-analyzer' },
	filetypes = { 'wgsl' },
	root_markers = { '.git' },
}

vim.lsp.enable('wgsl_analyzer')
