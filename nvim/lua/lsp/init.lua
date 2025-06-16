


local lsp_files = vim.fn.glob(vim.fn.stdpath('config') .. '/lua/lsp/servers/*.lua', false, true)

for _, file in ipairs(lsp_files) do
  local module_name = vim.fn.fnamemodify(file, ':t:r')

  local success, lsp_setup = pcall(require, 'lsp.servers.' .. module_name)

  if success and type(lsp_setup) == 'function' then
    pcall(lsp_setup)
  end
end


local lsp_utils = require('lsp.util')

vim.lsp.config('*', lsp_utils)
