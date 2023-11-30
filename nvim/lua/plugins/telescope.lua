return { 'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup{
      pickers = {
        find_files = {
          disable_devicons = true,
          previewer = false,
        },
        file_browser = {
          disable_devicons = true,
          previewer = false,
        }
      }
    }
  end
}
