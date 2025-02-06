return {
  'folke/which-key.nvim',
  config = function()
    local wk = require("which-key")

    wk.setup({
      triggers = { "<auto>", mode = "nixsotc" },
      layout = {
        width = { min = 20, max = 50 },
        spacing = 5,
      },
      win = {
        border = "none",
        padding = { 1, 1 },
        zindex = 1000,
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
        mappings = true,
        rules = {},
        colors = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󱕐 ",
          ScrollWheelUp = "󱕑 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },
    })

    local keymaps = {
      { key = "<leader>C", cmd = "<cmd>Copilot panel<CR>",     desc = "Copilot suggestion window", nowait = true, remap = false },
      {
        key = "<leader>L",
        group = "LSP",
        nowait = true,
        remap = false,
        subkeys = {
          { key = "i", cmd = "<cmd>LspInfo<CR>",      desc = "LSP Info", nowait = true, remap = false },
          { key = "l", cmd = "<cmd>Lazy<CR>",         desc = "Lazy",     nowait = true, remap = false },
          { key = "m", cmd = "<cmd>Mason<CR>",        desc = "Mason",    nowait = true, remap = false },
          { key = "r", cmd = "<cmd>LspRestart<CR>",   desc = "Restart",    nowait = true, remap = false },
        }
      },
      { key = "<leader>c", cmd = "<cmd>bn|bd#<CR>", desc = "Close buffer",            nowait = true, remap = false },
      {
        key = "<leader>d",
        group = "debug",
        subkeys = {
          { key = "c",  cmd = "<cmd>lua require('dap').continue()<CR>",                                                    desc = "Continue" },
          { key = "d",  cmd = "<cmd>lua require('dap').toggle_breakpoint()<CR>",                                           desc = "Toggle Breakpoint" },
          { key = "i",  cmd = "<cmd>lua require('dap').step_into()<CR>",                                                   desc = "Step Into" },
          { key = "l",  cmd = "<cmd>lua require('dap').run_last()<CR>",                                                    desc = "Run Last" },
          { key = "o",  cmd = "<cmd>lua require('dap').step_over()<CR>",                                                   desc = "Step Over" },
          { key = "p",  cmd = "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Set Log Point" },
          { key = "q",  cmd = "<cmd>lua require('dap').terminate()<CR>",                                                   desc = "Terminate" },
          { key = "u",  cmd = "<cmd>lua require('dap').step_out()<CR>",                                                    desc = "Step Out" },
          { key = "v",  cmd = "<cmd>lua require('dapui').toggle()<CR>",                                                    desc = "Toggle DAP UI" },
          { key = "e",  cmd = "<cmd>lua require('dap').disconnect()<CR>",                                                  desc = "Disconnect" },
          { key = "r",  cmd = "<cmd>lua require('dap').restart()<CR>",                                                     desc = "Restart" },
          { key = "s",  cmd = "<cmd>lua require('dap').pause()<CR>",                                                       desc = "Pause" },
          { key = "r",  cmd = "<cmd>lua require('dap').run_to_cursor()<CR>",                                               desc = "Run to Cursor" },
          { key = "h",  cmd = "<cmd>lua require('dap.ui.widgets').preview()<CR>",                                          desc = "Hover" },
          { key = "re", cmd = "<cmd>lua require('dap.repl').execute(vim.fn.input('Expression: '))<CR>",                    desc = "REPL Execute" },
          { key = "rt", cmd = "<cmd>lua require('dap.repl').toggle()<CR>",                                                 desc = "REPL Toggle" },
        }
      },
      {
        key = "<leader>dw",
        group = "Widgets",
        nowait = true,
        remap = false,
        subkeys = {
          { key = "P", cmd = "<cmd>lua require('dap.ui.widgets').preview()<CR>", desc = "Preview" },
        }
      },
      { key = "<leader>e", cmd = "<cmd>Neotree toggle<CR>",       desc = "File Explorer", nowait = true, remap = false },
      { key = "<leader>f", cmd = "<cmd>Telescope find_files<CR>", desc = "Find Files",    nowait = true, remap = false },
      { key = "<leader>h", cmd = "<cmd>nohlsearch<CR>",           desc = "No Highlight",  nowait = true, remap = false },
      {
        key = "<leader>l",
        group = "LSP Actions",
        nowait = true,
        remap = false,
        subkeys = {
          { key = "S", cmd = "<cmd>Telescope lsp_workspace_symbols<CR>",                                    desc = "Workspace Symbols",     nowait = true, remap = false },
          { key = "a", cmd = "<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>",                          desc = "Code Action",           nowait = true, remap = false },
          { key = "d", cmd = "<cmd>Trouble diagnostics toggle<CR>",                                         desc = "Workspace Diagnostics", nowait = true, remap = false },
          { key = "f", cmd = "<cmd>lua vim.lsp.buf.format()<CR>",                                           desc = "Format",                nowait = true, remap = false },
          { key = "i", cmd = "<cmd>lua vim.lsp.buf.hover()<CR>",                                            desc = "Hover Info",            nowait = true, remap = false },
          { key = "l", cmd = "<cmd>lua vim.diagnostic.open_float()<CR>",                                    desc = "Line Diagnostic",       nowait = true, remap = false },
          { key = "r", cmd = "<cmd>lua vim.lsp.buf.rename()<CR>",                                           desc = "Rename",                nowait = true, remap = false },
          { key = "s", cmd = "<cmd>Telescope lsp_document_symbols<CR>",                                     desc = "Document Symbols",      nowait = true, remap = false },
          { key = "t", cmd = "<cmd>Tagbar<CR>",                                                             desc = "Tagbar",                nowait = true, remap = false },
          { key = "h", cmd = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", desc = "Toggle inlay hints",    nowait = true, remap = false },
        }
      },
      { key = "<leader>p", cmd = "<cmd>Lazy<CR>",   desc = "Plugins",           nowait = true, remap = false },
      { key = "<leader>q", cmd = "<cmd>wqall!<CR>", desc = "Save and quit all", nowait = true, remap = false },
      {
        key = "<leader>t",
        group = "Telescope",
        nowait = true,
        remap = false,
        subkeys = {
          { key = "g", cmd = "<cmd>Telescope live_grep<CR>",  desc = "Grep", nowait = true, remap = false },
          { key = "t", cmd = "<cmd>Telescope treesitter<CR>", desc = "Tags", nowait = true, remap = false },
        }
      },
    }

    local function add_keymaps(keymaps, prefix)
      prefix = prefix or ""
      for _, keymap in ipairs(keymaps) do
        local full_key = prefix .. keymap.key
        if keymap.subkeys then
          wk.add({
            { full_key, group = keymap.group, nowait = keymap.nowait, remap = keymap.remap },
          })
          add_keymaps(keymap.subkeys, full_key)
        else
          wk.add({
            { full_key, keymap.cmd, desc = keymap.desc, nowait = keymap.nowait, remap = keymap.remap },
          })
        end
      end
    end

    add_keymaps(keymaps)
  end,
}
