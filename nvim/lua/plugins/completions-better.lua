return {
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		version = "*", -- use a release tag for pre-built binaries
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
            keymap = {
                preset = "default",
            },
			-- enabled = function()
			-- 	return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
			-- end,

			cmdline = { enabled = false },

			completion = {
				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before _and_ after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword = { range = "full" },

				-- Disable auto brackets
				accept = { auto_brackets = { enabled = true } },

				-- Don't select by default, auto insert on selection
				list = { selection = { preselect = false, auto_insert = true } },

				menu = {
					-- Don't automatically show the completion menu
					auto_show = true,

					-- nvim-cmp style menu
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},

				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 300 },

				-- Display a preview of the selected item on the current line
				ghost_text = { enabled = true },
			},

			sources = {
				-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Use a preset for snippets, check the snippets documentation for more information
			--snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' | 'vsnip' },
			snippets = { preset = "default" },

			signature = { enabled = true },
		},
	},
}
