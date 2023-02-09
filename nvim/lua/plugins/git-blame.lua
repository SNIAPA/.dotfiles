return { 'f-person/git-blame.nvim',
  config = function ()
    vim.cmd [[let g:gitblame_enabled = 0]]
  end
}
