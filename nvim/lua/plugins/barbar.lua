return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = true end,
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<S-l>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<Leader>bx', '<Cmd>BufferClose<CR>', opts)
  end,
}

