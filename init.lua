require("config.options").setup()
require("config.keymaps").setup()
require("config.lazy")
require("lualine").setup()

mini_misc = require("mini.misc")
mini_misc.setup()
mini_misc.setup_termbg_sync()
