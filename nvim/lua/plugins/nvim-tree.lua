return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  config = function ()
    require("nvim-tree").setup({
      on_attach = "false",
    })
  end

}
