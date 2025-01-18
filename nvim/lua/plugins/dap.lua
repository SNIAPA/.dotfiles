local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local find_program = function()
  return coroutine.create(function(coro)
    local opts = {}
    pickers
        .new(opts, {
          prompt_title = "Path to executable",
          finder = finders.new_oneshot_job(
            { "fd", "--hidden", "--exclude", ".git", "--no-ignore", "--type", "x" },
            {}
          ),
          sorter = conf.generic_sorter(opts),
          attach_mappings = function(buffer_number)
            actions.select_default:replace(function()
              actions.close(buffer_number)
              coroutine.resume(coro, action_state.get_selected_entry()[1])
            end)
            return true
          end,
        })
        :find()
  end)
end

local find_pid = function()
  return coroutine.create(function(coro)
    local opts = {}
    pickers
        .new(opts, {
          prompt_title = "Select PID",
          finder = finders.new_oneshot_job(
            { "ps", "-e", "-o", "pid,comm" }, -- List all processes with PID and command
            {}
          ),
          sorter = conf.generic_sorter(opts),
          attach_mappings = function(buffer_number)
            actions.select_default:replace(function()
              actions.close(buffer_number)
              local selected_entry = action_state.get_selected_entry()
              local pid = string.match(selected_entry[1], "^%s*(%d+)") -- Extract PID from the selected entry
              coroutine.resume(coro, pid)
            end)
            return true
          end,
        })
        :find()
  end)
end

return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb", -- I installed codelldb through mason.nvim
        args = {"--port", "${port}"},
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = find_program,
        args = {},
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
      },
      {
        name = "Select and attach to process",
        type = "codelldb",
        request = "attach",
        program = find_program,
        pid = find_pid,
        cwd = '${workspaceFolder}'
      },
      {
        name = 'Attach to server 1234',
        type = 'codelldb',
        request = 'attach',
        connect = {
          port = 1234,
          host = 'localhost',
        },
        program = find_program,
        cwd = '${workspaceFolder}'
      },
    }

    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/alacritty',
      args = { '-e' },
    }
  end
}
