return {
	{
		"nvim-mini/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"nvim-mini/mini.surround",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
	{
		"nvim-mini/mini.splitjoin",
		version = "*",
		opts = {
			mappings = {
				toggle = "gS",
			},
		},
	},
	{ "nvim-mini/mini.ai", version = false },
    -- {
    --     "nvim-mini/mini.files",
    --     version = false,
    --     config = function()
    --         vim.keymap.set("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", {desc = "Mini files"})
    --         require("mini.files").setup()
    --         local files_set_cwd = function()
    --           local cur_entry_path = MiniFiles.get_fs_entry().path
    --           local cur_directory = vim.fs.dirname(cur_entry_path)
    --           if cur_directory ~= nil then
    --             vim.fn.chdir(cur_directory)
    --           end
    --         end
    --         vim.keymap.set("n", "<C-c>", files_set_cwd, {desc = "Set cwd"})
    --     end,
    --     opts = {
    --         mapping = {
    --             close       = 'q',
    --             go_in       = 'l',
    --             go_in_plus  = 'L',
    --             go_out      = 'h',
    --             go_out_plus = 'H',
    --             mark_goto   = "'",
    --             mark_set    = 'm',
    --             reset       = '<BS>',
    --             reveal_cwd  = '@',
    --             show_help   = 'g?',
    --             synchronize = '=',
    --             trim_left   = '<',
    --             trim_right  = '>',
    --         }
    --     }
    -- },
}
