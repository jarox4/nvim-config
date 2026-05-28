return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        vim.keymap.set("n", "<leader>cf", function() require("conform").format({async = true}) end, {desc = "Code format"})
        require("conform").setup({
            formatters_by_ft = {
                cs = { "clang_format" },  -- in conform setup
                -- cs = {"csharpier"},
                go         = { "gofmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                lua = {"stylua"},
                ["*"] = {"astyle"},
            },
            format_on_save = false,
        })
    end
}
