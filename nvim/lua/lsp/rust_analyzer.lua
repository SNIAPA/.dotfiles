return function()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require("lspconfig").rust_analyzer.setup {
    checkOnSave = {
      command = "clippy",
    },
    capabilities = capabilities,
    on_attach = require('../lsp/on_attach'),
  }
end
