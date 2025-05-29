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
        on_attach = require('lsp.on_attach'),
        default_settings = {
          ['rust-analyzer'] = {
            checkOnSave = true
          }
        },
      },
      -- DAP configuration
      dap = {
      },
    }
  end
}
