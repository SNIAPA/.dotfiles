return {
  "github/copilot.vim",
  config = function()
    vim.api.nvim_set_keymap('i', '<C-Space>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_settings = { selectedCompletionModel = 'gpt-4o-copilot' }
  end,
}
