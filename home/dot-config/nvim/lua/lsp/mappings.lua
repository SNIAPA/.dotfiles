vim.api.nvim_create_autocmd('DiagnosticChanged', {
	callback = function()
		vim.diagnostic.setqflist({ open = false }) -- all buffers
		vim.diagnostic.setloclist({ open = false }) -- current buffer
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

		vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

		vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

		vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

		vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
	end,
})
