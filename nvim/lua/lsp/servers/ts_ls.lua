return function()
  vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_markers = {
      'tsconfig.json',
      'package.json',
    },
    init_options = {
      hostInfo = 'neovim',
      preferences = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  }
end
