vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set('n', 'gc', vim.diagnostic.setqflist, opts)

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'grl', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', 'grc', vim.lsp.codelens.run, opts)
		vim.keymap.set('n', 'grh', function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
		end, opts)

		vim.keymap.set('n', '<leader>rp', function()
			vim.lsp.buf_request(0, 'workspace/executeCommand', {
				command = 'rust-analyzer.rebuildProcMacros',
				arguments = {}
			})
		end, vim.tbl_extend('force', opts, { desc = 'RA: Rebuild proc macros' }))
	end,
})

