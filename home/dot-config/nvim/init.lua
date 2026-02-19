-- Editor
vim.opt['list'] = true
vim.opt['listchars'] = 'eol:¬,tab:> ,trail:·,extends:>,precedes:<'


vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = " "

-- Close hidden buffer
vim.opt.hidden = false

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
