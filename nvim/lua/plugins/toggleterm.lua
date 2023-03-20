return { 'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      directon = 'float',
      autochdir = true,
      float_opts = {
        border = "shadow"
      }

    })
  end

}
