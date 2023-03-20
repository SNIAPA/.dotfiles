local opts = { noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("","<Space>","<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes 
--  noemal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-A-l>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-A-j>", ":horizontal resize +2<CR>", opts)
keymap("n", "<C-A-k>", ":horizontal resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text
keymap("n", "<A-j>", ":m .+1", opts)
keymap("n", "<A-k>", ":m .-2", opts)

-- Make x not copy
keymap("n", "x", "\"_x", opts)


-- Insert 
-- Press jk quickly to to exit insert mode
keymap("i", "jk", "<ESC>",opts)

-- Visual
-- Stau in vusual mode after changing indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text
keymap("v", "<A-j>", ":m .+1", opts)
keymap("v", "<A-k>", ":m .-2", opts)

-- Visual Block
-- Move text
keymap("x", "<A-j>", ":m .+1", opts)
keymap("x", "<A-k>", ":m .-2", opts)

-- Terminal
-- Exit
keymap("t", "jk", [[<C-\><C-n>]], opts)
