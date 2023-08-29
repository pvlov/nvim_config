require("gopnik.plugins-setup")
require("gopnik.core.options")
require("gopnik.core.keymaps")
require("gopnik.core.colorscheme")
require("gopnik.plugins.comment")
require("gopnik.plugins.nvim-tree")
require("gopnik.plugins.lualine")
require("gopnik.plugins.telescope")
require("gopnik.plugins.nvim-cmp")
require("gopnik.plugins.lsp.mason")
require("gopnik.plugins.lsp.lspsaga")
require("gopnik.plugins.lsp.lspconfig")
require("gopnik.plugins.lsp.null-ls")
require("gopnik.plugins.autopairs")
require("gopnik.plugins.treesitter")
require("gopnik.plugins.gitsigns")

vim.cmd([[
    command! C :!./build.sh
]])
