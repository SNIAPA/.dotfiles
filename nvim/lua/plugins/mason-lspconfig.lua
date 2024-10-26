return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "sar/cmp-lsp.nvim",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    end

    mason_lspconfig.setup {
      ensure_installed = {},
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach
          }
        end,
        ["clangd"] = require("lsp.clangd")
      }
    }
  end

}
