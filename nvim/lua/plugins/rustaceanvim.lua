return {
  "mrcjkb/rustaceanvim",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
      },
      -- LSP configuration
      server = {
        on_attach = require('lsp.util').on_attach,
        capabilities = require('lsp.util').capabilities,
        default_settings = {
          ['rust-analyzer'] = {
            checkOnSave = true
          }
        },
      },
    }
  end
}
