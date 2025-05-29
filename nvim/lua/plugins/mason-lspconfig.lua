return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "sar/cmp-lsp.nvim",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup {
      ensure_installed = {},
      automatic_enable = true
    }
  end

}
