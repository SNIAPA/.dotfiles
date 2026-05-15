-- Editor
vim.opt['list'] = true
vim.opt['listchars'] = 'eol:¬,tab:> ,trail:·,extends:>,precedes:<'


vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>', '<Nop>', { silent = true })

-- Lazygit
vim.keymap.set('n', '<leader>g', function()
	local prev_buf = vim.api.nvim_get_current_buf()
	vim.cmd('term lazygit')
	vim.cmd('startinsert')
	vim.api.nvim_create_autocmd('TermClose', {
		buffer = vim.api.nvim_get_current_buf(),
		once = true,
		callback = function()
			vim.cmd('bd!')
			vim.api.nvim_set_current_buf(prev_buf)
		end,
	})
end)

-- Close hidden buffer
--vim.opt.hidden = false
--vim.api.nvim_create_autocmd("BufNew", {
--	callback = function(ev)
--		vim.bo[ev.buf].bufhidden = "wipe"
--	end,
--})

-- Netrw
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("edit .")
		end
	end
})

vim.g.netrw_banner = 0

-- Add line numbers to netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Lazy
require "config-lazy"

-- Lsp
require "lsp.rust"
require "lsp.lua"
require "lsp.mappings"

-- Mappings
