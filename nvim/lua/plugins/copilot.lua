return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  config = function()

    require("copilot").setup({
      nes = {
        enabled = true,
        keymap = {
          accept_and_goto = "<leader>p",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    })

    vim.api.nvim_set_keymap('i', '<C-Space>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
    vim.g.copilot_no_tab_map = true
  end,
}

