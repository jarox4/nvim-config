return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
            --vim.cmd.colorscheme("catppuccin-latte")
		end,
	},
	{
		"RRethy/base16-nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
}
