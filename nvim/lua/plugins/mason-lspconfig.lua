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


    local on_attach = require("..lsp.on_attach");
    mason_lspconfig.setup {

      ensure_installed = {},
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,
        ["clangd"] = require("lsp.clangd"),
        ["rust_analyzer"] = require("lsp.rust_analyzer"),
      }
    }

    vim.cmd([[autocmd BufRead,BufNewFile *.ers setfiletype rustscript]])

    local lspconfigs = require 'lspconfig.configs'
    local lspconfig = require("lspconfig")
    if not lspconfigs.rlscls then
      lspconfigs.rlscls = {
        default_config = {
          cmd = { 'rscls' },
          filetypes = { 'rustscript' },
          root_dir = function(fname)
            return lspconfig.util.path.dirname(fname)
          end,
        },
        docs = {
          description = [[
https://github.com/MiSawa/rscls

rscls, a language server for rust-script
]],
        }
      }
    end

    lspconfig.rlscls.setup {
      settings = {
        ['rust-analyzer'] = {
          imports = {
            group = {
              enable = true,
            },
            granularity = {
              enforce = true,
              group = "crate",
            },
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true,
          },
        },
      }
    }
  end

}
