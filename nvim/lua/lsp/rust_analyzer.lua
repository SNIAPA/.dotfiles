return function()
  require("lspconfig").rust_analyzer.setup {
      checkOnSave = {
          command = "clippy",
      },
  }
end
