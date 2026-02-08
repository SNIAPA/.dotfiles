-- Editor
vim.opt['list'] = true
vim.opt['listchars'] = 'eol:¬,tab:> ,trail:·,extends:>,precedes:<'

vim.opt.signcolumn = "number"
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ","

-- Lazy
require "config-lazy"

-- Lsp
require "lsp.rust"
require "lsp.lua"
require "lsp.mappings"

-- Mappings
