vim.api.nvim_create_autocmd('DiagnosticChanged', {
	callback = function()
		vim.diagnostic.setqflist({ open = false }) -- all buffers
		vim.diagnostic.setloclist({ open = false }) -- current buffer
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set('n', 'grd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'grf', vim.lsp.buf.format, opts)
		vim.keymap.set('n', 'grl', vim.diagnostic.open_float, opts)
	end,
})
