local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 0,
  completeopt = { "menu", "preview", "noselect"},
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitright = true,
  splitbelow = true,
  swapfile = false,
  timeout = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 10,
  sidescrolloff = 10,
  guifont = "Hack Nerd Font:size=8",
  cc = "80",
	termguicolors = true,
  -- shell = '/usr/bin/zsh',
  -- indetation
  autoindent = true,
  expandtab = true,
  tabstop = 4,
  shiftwidth = 2,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
