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
		vim.keymap.set('n', 'gf', vim.lsp.buf.format, opts)
		vim.keymap.set('n', 'grl', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', 'grc', vim.lsp.codelens.run, opts)
		vim.keymap.set('n', 'grh', function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
		end, opts)
	end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
	callback = function()
		vim.lsp.codelens.refresh({ bufnr = 0 })
	end,
})
