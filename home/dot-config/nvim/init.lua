-- Editor
vim.opt['list'] = true
vim.opt['listchars'] = 'eol:¬,tab:> ,trail:·,extends:>,precedes:<'


vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>', '<Nop>', { silent = true })

-- Netrw
vim.g.netrw_banner = 0

-- Add line numbers to netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Lazy
require "config-lazy"

-- Lsp
vim.lsp.config('*', {
	capabilities = require('blink.cmp').get_lsp_capabilities(),
})
require "lsp.rust"
require "lsp.lua"
require "lsp.wgsl"
require "lsp.mappings"

-- Mappings
