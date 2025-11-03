return
{
  {
    {
      "mason-org/mason.nvim",
      opts = {},
      config = function()
        --require("mason").setup()
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })
      end
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        auto_install = true
      }
    end
  },
  {
      "seblyng/roslyn.nvim",
      ---@module 'roslyn.config'
      ---@type RoslynNvimConfig
      opts = {
          -- your configuration comes here; leave empty for default settings
      },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- local lspconfig = require("lspconfig")
      vim.lsp.config("lua_ls", {
          capabilities = capabilities
        })
      vim.lsp.enable ("lua_ls")
      --vim.lsp.config("omnisharp", {
      --    capabilities = capabilities
      --  })
      --vim.lsp.enable ("omnisharp")
      --vim.lsp.config("harper_ls", {
      --    capabilities = capabilities
      --  })
      --vim.lsp.enable("harper_ls")
      vim.lsp.enable("roslyn")

      vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
    end
  }
}
