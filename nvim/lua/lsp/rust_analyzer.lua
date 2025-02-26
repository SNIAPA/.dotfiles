return function()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require 'lspconfig'.rust_analyzer.setup {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = {
            "--",
            "--no-deps",
            "-Dclippy::correctness",
            "-Dclippy::complexity",
            "-Dclippy::style",
            "-Wclippy::perf",
            "-Wclippy::pedantic",
            "-Wclippy::cargo",
          },
        }
      }
    },
    capabilities = capabilities,
    on_attach = require('../lsp/on_attach'),
  }
end
