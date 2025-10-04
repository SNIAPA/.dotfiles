return function()
  vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = {
            "--",
            "--no-deps",
            --"-Dclippy::correctness",
            --"-Dclippy::complexity",
            --"-Dclippy::style",
            --"-Wclippy::perf",
            --"-Wclippy::pedantic",
            --"-Wclippy::cargo",
          },
        }
      }
    },
  })
end
