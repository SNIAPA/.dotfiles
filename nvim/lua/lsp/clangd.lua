return function()

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local util = require('lspconfig.util')
  local root_files = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'build.sh',
    'configure.ac',
    'run',
    'compile',
  }
  require("lspconfig").clangd.setup {
    cmd = { "clangd",
      "--all-scopes-completion",
      "--background-index",
      "--clang-tidy",
      "--compile_args_from=filesystem",
      "--completion-parse=always",
      "--completion-style=bundled",
      "--debug-origin",
      "--enable-config",
      "--fallback-style=Qt",
      "--function-arg-placeholders",
      "--header-insertion=iwyu",
      "--pch-storage=memory",
      "-j=4", -- number of workers
      "--log=error",
      -- "--resource-dir="
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(fname)
      return util.root_pattern(root_files)(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    init_options = {
      compilationDatabasePath = vim.fn.getcwd() .. "/build",
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = require('../lsp/on_attach'),


  }
end
