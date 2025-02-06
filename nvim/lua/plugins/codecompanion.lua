return {
  "olimorris/codecompanion.nvim",
  dependencies = { 'echasnovski/mini.diff' },
  config = function()
    require("codecompanion").setup({
      display = {
        --chat = {
        --  show_settings = false,
        --  show_token_count = true,   -- Show the token count for each response?

        --  ---@param tokens number
        --  token_count = function(tokens, adapter)   -- The function to display the token count
        --    return " (" .. tokens .. " tokens)"
        --  end,
        --  window = {
        --    opts = {
        --      number = false,
        --      relativenumber = false,
        --    },
        --  },
        --},
        inline = {
          -- If the inline prompt creates a new buffer, how should we display this?
          -- layout = "buffer", -- vertical|horizontal|buffer
        },
        diff = {
          -- enabled = true,
          provider = "mini_diff",   -- default|mini_diff
        },
        action_palette = {
          -- provider = "mini_pick",
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
      adapters = {
        QwenCoder = function()
          return require("codecompanion.adapters").extend("ollama", {

            name = "QwenCoder", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "Qwen2.5-Coder:7b",
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
