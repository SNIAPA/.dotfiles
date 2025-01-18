local get_rust_gdb_path = function()
  local toolchain_location = string.gsub(vim.fn.system("rustc --print sysroot"), "\n", "")
  local rustgdb = toolchain_location .. "/bin/rust-gdb"
  return rustgdb
end

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

    -- Rust configuration
    dap.adapters.rust_gdb = {
      type = "executable",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      command = "rust-gdb"
      --executable = {
      --  command = get_rust_gdb_path(),
      --}
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "rust_gdb",
        request = "launch",
        program = find_program,
        args = {},
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        environment = {},
        -- externalConsole = true,
        setupCommands = {
          {
            description = "Setup to resolve symbols",
            text = "set sysroot /",
            ignoreFailures = false,
          },
          {
            description = "Enable pretty-printing for gdb",
            text = "-enable-pretty-printing",
            ignoreFailures = false,
          },
        },
      },
      {
        name = "Select and attach to process",
        type = "rust_gdb",
        request = "attach",
        program = find_program,
        pid = find_pid,
        cwd = '${workspaceFolder}'
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'rust_gdb',
        request = 'attach',
        target = 'localhost:1234',
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
