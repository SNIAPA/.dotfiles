return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/alacritty',
      args = { '-e' },
    }
  end
}
