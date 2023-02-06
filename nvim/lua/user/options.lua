local options = {
  backup = false,
  clipboard = "unnamedplus", 
  cmdheight = 2,
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
  timeoutlen = 100,                        
  undofile = true,                         
  updatetime = 300,                        
  expandtab = false,                        
  shiftwidth = 2,                          
  tabstop = 2,                             
  cursorline = true,                       
  number = true,                           
  relativenumber = true,                   
  numberwidth = 2,                         
  signcolumn = "yes",                      
  wrap = false,                            
  scrolloff = 10,                           
  sidescrolloff = 10,
  guifont = "Hack Nerd Font:size=8",               
  cc = "100",                               
	termguicolors = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
