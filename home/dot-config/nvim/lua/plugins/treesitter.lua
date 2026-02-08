return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup { 
      install_dir = vim.fn.stdpath('data') .. '/site',
      auto_install = true,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    }
  end,
}
