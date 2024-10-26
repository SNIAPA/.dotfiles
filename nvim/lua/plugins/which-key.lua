return  { 'folke/which-key.nvim',
  config = function ()
    local wk = require("which-key")

    wk.add(
  {
    { "<leader>C", "<cmd>bd<CR>", desc = "close buffer and window", nowait = true, remap = false },
    { "<leader>L", group = "lsp", nowait = true, remap = false },
    { "<leader>Li", "<cmd>LspInfo<CR>", desc = "lsp info", nowait = true, remap = false },
    { "<leader>Lm", "<cmd>Mason<CR>", desc = "mason", nowait = true, remap = false },
    { "<leader>Ll", "<cmd>Lazy<CR>", desc = "lazy", nowait = true, remap = false },
    { "<leader>q", "<cmd>wqall!<CR>", desc = "close buffer", nowait = true, remap = false },
    { "<leader>c", "<cmd>bn|:bd#<CR>", desc = "close buffer", nowait = true, remap = false },
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File Explorer", nowait = true, remap = false },
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "files", nowait = true, remap = false },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "no highlight", nowait = true, remap = false },
    { "<leader>l", group = "lsp actions", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "workspace symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>", desc = "action", nowait = true, remap = false },
    { "<leader>ld", "<cmd>Trouble diagnostics<CR>", desc = "workspace diagnostics", nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "format", nowait = true, remap = false },
    { "<leader>li", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "info", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "line diagnostic", nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "rename", nowait = true, remap = false },
    { "<leader>lR", "<cmd>lua require'popui.references-navigator'()<CR>", desc = "refrences", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "document symbols", nowait = true, remap = false },
    { "<leader>lt", "<cmd>Tagbar<CR>", desc = "tagbar", nowait = true, remap = false },
    { "<leader>p", "<cmd>Lazy<CR>", desc = "plugsin", nowait = true, remap = false },
    { "<leader>t", group = "Telescope", nowait = true, remap = false },
    { "<leader>tg", "<cmd>Telescope live_grep<CR>", desc = "grep", nowait = true, remap = false },
    { "<leader>tt", "<cmd>Telescope treesitter<CR>", desc = "tags", nowait = true, remap = false },
  })

  end
}
