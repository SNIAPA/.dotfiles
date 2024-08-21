return {
  "hood/popui.nvim",
  config= function ()
    vim.ui.select = require"popui.ui-overrider"
    vim.ui.input = require"popui.input-overrider"
  end
}
