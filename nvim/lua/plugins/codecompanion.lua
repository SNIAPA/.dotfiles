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
          adapter = "Deepseek",
        },
        inline = {
          adapter = "copilot",
        },
      },
      adapters = {
        Deepseek = function()
          return require("codecompanion.adapters").extend("ollama", {

            name = "Deepseek",
            schema = {
              model = {
                default = "hf.co/bartowski/DeepSeek-R1-Distill-Qwen-14B-GGUF:Q4_K_L",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    })
  end
}
