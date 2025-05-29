return {
  "olimorris/codecompanion.nvim",
  dependencies = { 'echasnovski/mini.diff' },
  config = function()
    require("codecompanion").setup({
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
