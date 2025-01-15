return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    -- Function to find the executable based on the build type
    local function find_executable(build_type)
      local crate_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

      local executable_path = 'target'.. '/'..build_type .. '/' .. crate_name

      if vim.fn.filereadable(executable_path) == 1 then
        return executable_path
      else
        return nil
      end
    end

    -- Rust configuration
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/bin/codelldb',
        args = { "--port", "${port}" },
      }
    }
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          local build_type = vim.fn.input('Build type (e.g., release, debug): ', '', 'file')
          local executable_path = find_executable(build_type)
          if executable_path then
            return executable_path
          else
            error("No executable found in the build directory")
          end
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
  end
}
