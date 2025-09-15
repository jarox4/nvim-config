return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' }
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        -- dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        -- dapui.close()
      end

      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
    end
  },
}
