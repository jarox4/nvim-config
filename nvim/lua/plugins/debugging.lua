return {
	{
		"mrcjkb/rustaceanvim",
		-- To avoid being surprised by breaking changes,
		-- I recommend you set a version range
		version = "^9",
		-- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
		-- No need for lazy.nvim to lazy-load it.
		lazy = false,
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
			-- local dap = require("dap")

			-- dap.adapters.delve = {
			-- 	type = "server",
			-- 	port = "${port}",
			-- 	executable = {
			-- 		-- Replace with your terminal: kitty, alacritty, wezterm, foot...
			-- 		command = "kitty",
			-- 		args = { "dlv", "dap", "-l", "127.0.0.1:${port}" },
			-- 	},
			-- }
		end,
	},
	{
		"ownself/nvim-dap-unity",
		dependencies = { "mfussenegger/nvim-dap" },
		build = function()
			require("nvim-dap-unity").install()
		end,
		config = function()
			require("nvim-dap-unity").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			require("dapui").setup()
			dap.defaults.fallback.force_external_terminal = true
			--C#
			dap.adapters.coreclr = {
				type = "executable",
				command = "netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll ", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
					console = "integratedTerminal", -- THIS is the key
				},
			}
			vim.keymap.set("n", "<Leader>cg", function()
				vim.lsp.buf.signature_help()
			end, { desc = "Toggle signature help" })
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)

			--C / C++
			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = {}, -- provide arguments if needed
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
			dap.configurations.cpp = dap.configurations.c

			--Golang
			-- dap.adapters.go = {
			--   type = 'executable';
			--   command = 'node';
			--   args = {os.getenv('HOME') .. '/dev/golang/vscode-go/extension/dist/debugAdapter.js'};
			-- }
			-- dap.configurations.go = {
			--   {
			--     type = 'go';
			--     name = 'Debug';
			--     request = 'launch';
			--     showLog = false;
			--     program = "${file}";
			--     dlvToolPath = vim.fn.exepath('dlv'),  -- Adjust to where delve is installed
			--     console = "integratedTerminal"; -- Crucial for input() support
			--   },
			-- }
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				-- dapui.close()
			end

			vim.keymap.set("n", "<F4>", function()
				require("dap").terminate()
			end)
			vim.keymap.set("n", "<F5>", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<Leader>db", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<Leader>du", function()
				require("dapui").toggle()
			end, { desc = "Toggle ui" })
		end,
	},
}
