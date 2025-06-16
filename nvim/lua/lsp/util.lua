local on_attach = function(client, bufnr)
  print('LSP started for buffer: ' .. bufnr);
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
  on_attach = on_attach,
  capabilities = capabilities
}
