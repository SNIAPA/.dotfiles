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

		vim.keymap.set("n", "<leader>df", function()
			vim.lsp.buf.format({ async = false })
			-- trigger rust-analyzer's clippy check
			vim.lsp.buf.execute_command({
				command = "rust-analyzer.runFlycheck",
				arguments = { { textDocument = vim.lsp.util.make_text_document_params() } },
			})
		end, { desc = "Format (rustfmt) + lint (clippy)" })

		vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics → quickfix' })
		vim.keymap.set('n', '<leader>rp', function()
			vim.lsp.buf_request(0, 'workspace/executeCommand', {
				command = 'rust-analyzer.rebuildProcMacros',
				arguments = {}
			})
		end, vim.tbl_extend('force', opts, { desc = 'RA: Rebuild proc macros' }))
	end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
	callback = function()
		vim.lsp.codelens.refresh({ bufnr = 0 })
	end,
})
