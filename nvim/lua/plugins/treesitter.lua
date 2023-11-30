return { 'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function ()
    require'nvim-treesitter.configs'.setup {
      sync_install = false,

      auto_install = true,

      indent = {
        enable = true,
      },

      autopairs = {
        enable = true,
      },

      highlight = {
        enable = true,

        additional_vim_regex_highlighting = true,
      },
    }
  end
}

