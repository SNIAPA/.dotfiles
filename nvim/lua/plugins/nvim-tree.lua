return {
  'nvim-tree/nvim-tree.lua',
  config = function ()
    require("nvim-tree").setup({
      on_attach = "false",
})
  end

}
