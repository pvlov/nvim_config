vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.lsp.enable("ruff")

require("config.options").setup()
require("config.keymaps").setup()
require("config.lazy")
local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "gruvbox-material",
	},
})

local mini_misc = require("mini.misc")
mini_misc.setup()
mini_misc.setup_termbg_sync()
