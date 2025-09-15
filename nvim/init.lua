vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("vim-options")
require("config.lazy")
require("lazy").setup("plugins")
