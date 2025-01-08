return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    -- Rust configuration
    dap.adapters.rustlldb = {
      type = 'executable',
      command = 'rust-lldb', -- Adjust the path if necessary
      name = 'rustlldb'
    }

    dap.configurations.rust = {
      {
        name = 'Launch',
        type = 'rustlldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
          local args_input = vim.fn.input('Arguments: ')
          return vim.split(args_input, ' ', true)
        end,
        runInTerminal = false,
      },
    }

    -- Enable logging
    dap.set_log_level('TRACE')
  end
}
