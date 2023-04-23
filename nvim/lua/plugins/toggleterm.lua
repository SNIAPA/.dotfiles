return { 'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      direction = 'float',
      autochdir = true,
      float_opts = {
        border = "double"
      }

    })
  end

}
