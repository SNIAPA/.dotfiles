return {
  "olimorris/codecompanion.nvim",
  dependencies = { 'echasnovski/mini.diff' },
  config = function()
    require("codecompanion").setup({
      display = {
        diff = {
          provider = "mini_diff", -- default|mini_diff
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      },
    })
  end
}
