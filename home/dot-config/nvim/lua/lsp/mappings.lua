vim.api.nvim_create_autocmd('DiagnosticChanged', {
	callback = function(args)
		vim.diagnostic.setqflist({ open = false })

		for _, win in ipairs(vim.fn.win_findbuf(args.buf)) do
			vim.diagnostic.setloclist({ open = false, winnr = win })
		end
	end,
})

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

		vim.keymap.set('n', '<leader>rw', function()
			vim.lsp.buf_request(0, 'workspace/executeCommand', {
				command = 'rust-analyzer.reloadWorkspace',
				arguments = {}
			})
		end, vim.tbl_extend('force', opts, { desc = 'RA: Reload workspace' }))

		if vim.bo[args.buf].filetype == 'rust' then
			local suppress = require 'lsp.suppress'

			vim.keymap.set('n', '<leader>la', function() suppress.suppress('allow') end,
				vim.tbl_extend('force', opts, { desc = 'Add #[allow(lint)] for line' }))
			vim.keymap.set('n', '<leader>le', function() suppress.suppress('expect') end,
				vim.tbl_extend('force', opts, { desc = 'Add #[expect(lint)] for line' }))
		end
	end,
})

