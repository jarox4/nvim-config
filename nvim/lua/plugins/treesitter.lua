-- return {
--   "nvim-treesitter/nvim-treesitter",
--   branch = 'main',
--   lazy = false,
--   build = ":TSUpdate",
--   config = function()
--     local config = require("nvim-treesitter.config")
--     config.setup({
--       ensure_installed = {"vim", "vimdoc", "lua", "python", "c_sharp", "regex", "bash", "yaml", "html", "latex", "go"},
--       highlight = { enable = true},
--       indent = { enable = true},
--     })
--   end
-- }
--
return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter').install({'c', 'c_sharp', 'go', 'typescript', 'rust'})
        require("nvim-treesitter.config").setup({
            ensure_installed = {"c_sharp", "razor", "html", "go", "c", "typescript", "yaml"},
            highlight = {
                enabled = true,
                additional_vim_regex_highlighting = false,
            }
        })
    end,
}
